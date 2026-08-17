import os
file_path = r"c:\Users\KwonHyeonjin\Documents\스텔란티스 ai 앱파일\index.html"
with open(file_path, "r", encoding="utf-8") as f:
    content = f.read()

# 1. Update loadLog visibility logic
load_log_search = """    const isJoint = (proc?.name || '').includes('조인트') || (proc?.id || '').includes('joint');
    
    container.querySelector('#prep-spec-card').style.display = isPrep ? 'block' : 'none';
    const jointCard = container.querySelector('#joint-spec-card');
    if (jointCard) jointCard.style.display = isJoint ? 'block' : 'none';
    const prodCard = container.querySelector('#default-prod-card');
    if (prodCard) prodCard.style.display = (isClip || isPrep || isJoint) ? 'none' : 'block';

    if (isPrep) this._initPrepCard(container, proc);
    if (isJoint) this._initJointCard(container, proc);"""

load_log_replace = """    const isJoint = (proc?.name || '').includes('조인트') || (proc?.id || '').includes('joint');
    const isPost = (proc?.name || '').includes('후가공') || (proc?.id || '').includes('post');
    
    container.querySelector('#prep-spec-card').style.display = isPrep ? 'block' : 'none';
    const jointCard = container.querySelector('#joint-spec-card');
    if (jointCard) jointCard.style.display = isJoint ? 'block' : 'none';
    const postCard = container.querySelector('#post-spec-card');
    if (postCard) postCard.style.display = isPost ? 'block' : 'none';
    
    const prodCard = container.querySelector('#default-prod-card');
    if (prodCard) prodCard.style.display = (isClip || isPrep || isJoint || isPost) ? 'none' : 'block';

    if (isPrep) this._initPrepCard(container, proc);
    if (isJoint) this._initJointCard(container, proc);
    if (isPost) this._initPostCard(container, proc);"""

content = content.replace(load_log_search, load_log_replace)

# 2. Add _initPostCard
init_post_card = """
  _initPostCard(container, proc) {
    const postCard = container.querySelector('#post-spec-card');
    if (!postCard) return;

    const calcDefect = () => {
      let tot = 0;
      container.querySelectorAll('.post-def-input').forEach(inp => {
        tot += parseInt(inp.value) || 0;
      });
      const tEl = container.querySelector('#post-defect-total');
      if (tEl) tEl.value = tot;
    };
    
    container.querySelectorAll('.post-def-input').forEach(inp => {
      inp.addEventListener('input', calcDefect);
    });
  }
"""

if "_initPostCard(container, proc)" not in content:
    content = content.replace("  _initJointCard(container, proc) {", init_post_card + "\n  _initJointCard(container, proc) {")

# 3. Add to _saveLog
save_log_search = """    const isJoint = this.currentLog.processName?.includes('조인트') || this.currentLog.processId?.includes('joint');"""
save_log_replace = """    const isPost = this.currentLog.processName?.includes('후가공') || this.currentLog.processId?.includes('post');
    let postData = null;
    if (isPost) {
      postData = {
        type: container.querySelector('#post-type')?.value || '',
        lotEarlyA: container.querySelector('#post-lot-early-a')?.value || '',
        lotEarlyB: container.querySelector('#post-lot-early-b')?.value || '',
        lotEarlyC: container.querySelector('#post-lot-early-c')?.value || '',
        lotMidA: container.querySelector('#post-lot-mid-a')?.value || '',
        lotMidB: container.querySelector('#post-lot-mid-b')?.value || '',
        lotMidC: container.querySelector('#post-lot-mid-c')?.value || '',
        lotLateA: container.querySelector('#post-lot-late-a')?.value || '',
        lotLateB: container.querySelector('#post-lot-late-b')?.value || '',
        lotLateC: container.querySelector('#post-lot-late-c')?.value || '',
        inspEarlyMi: container.querySelector('#post-insp-early-mi')?.value || 'O',
        inspEarlyGwa: container.querySelector('#post-insp-early-gwa')?.value || 'O',
        inspMidMi: container.querySelector('#post-insp-mid-mi')?.value || 'O',
        inspMidGwa: container.querySelector('#post-insp-mid-gwa')?.value || 'O',
        inspLateMi: container.querySelector('#post-insp-late-mi')?.value || 'O',
        inspLateGwa: container.querySelector('#post-insp-late-gwa')?.value || 'O',
        defectsTotal: parseInt(container.querySelector('#post-defect-total')?.value) || 0
      };
      const defectDetails = {};
      container.querySelectorAll('.post-def-input').forEach(inp => {
        const cat = inp.getAttribute('data-cat');
        const type = inp.getAttribute('data-type');
        const v = parseInt(inp.value) || 0;
        if(v > 0) {
           if(!defectDetails[cat]) defectDetails[cat] = {};
           defectDetails[cat][type] = v;
        }
      });
      postData.defectDetails = defectDetails;
    }

""" + save_log_search

content = content.replace(save_log_search, save_log_replace)

new_log_search = """      clipData, prepData, jointData,"""
new_log_replace = """      clipData, prepData, jointData, postData,"""
content = content.replace(new_log_search, new_log_replace)

with open(file_path, "w", encoding="utf-8") as f:
    f.write(content)
