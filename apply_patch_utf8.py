import os
import io

def patch_index():
    with io.open('index.html', 'r', encoding='utf-8') as f:
        html = f.read()

    # 1. prework-card ID
    html = html.replace('<div class="card mb-3">\n              <div class="card-header">\n                <div class="card-title" id="prework-title">',
                        '<div id="prework-card" class="card mb-3">\n              <div class="card-header">\n                <div class="card-title" id="prework-title">')

    # 2. joint-spec-card HTML
    joint_card_html = """            <div id="joint-spec-card" class="card mb-3" style="display:none;">
              <div class="card-header" style="background: linear-gradient(135deg, rgba(239,68,68,0.12), rgba(245,158,11,0.12));">
                <div class="card-title" style="color:var(--accent-rose);"><i class="ri-tools-fill"></i> 조인트 공정 작업일보 (DT CREW / QUAD D/SIDE)</div>
                <span class="badge badge-rose">가류온도 201±10℃ / 가류시간 90±10초</span>
              </div>
              <div class="card-body" style="padding:1rem;">

                <!-- 🔴기본 정보 : 부위, 작업시간, 생산량 -->
                <div class="clip-sub-card">
                  <label class="form-label mb-2" style="font-weight:700;color:var(--accent-rose);">✅ 1. 부위 / 작업시간 / 생산량</label>
                  <div style="display:grid;grid-template-columns:repeat(auto-fit,minmax(160px,1fr));gap:0.6rem;">
                    <div>
                      <label class="form-label" style="font-size:0.8rem;">작업 적용 부위</label>
                      <select class="form-select" id="joint-part-side">
                        <option value="FR RH">FR RH</option>
                        <option value="FR LH">FR LH</option>
                        <option value="RR RH">RR RH</option>
                        <option value="RR LH">RR LH</option>
                      </select>
                    </div>
                    <div>
                      <label class="form-label" style="font-size:0.8rem;">작업시간 (Start)</label>
                      <input type="time" class="form-control" id="joint-time-start" />
                    </div>
                    <div>
                      <label class="form-label" style="font-size:0.8rem;">작업시간 (End)</label>
                      <input type="time" class="form-control" id="joint-time-end" />
                    </div>
                    <div>
                      <label class="form-label" style="font-size:0.8rem;">생산계획(EA)</label>
                      <input type="number" min="0" class="form-control" id="joint-plan-qty" placeholder="계획" />
                    </div>
                    <div>
                      <label class="form-label" style="font-size:0.8rem;">생산실적(EA)</label>
                      <input type="number" min="0" class="form-control" id="joint-prod-qty" placeholder="실적" />
                    </div>
                  </div>
                </div>

                <!-- 🔴금형 및 LOT 정보 -->
                <div class="clip-sub-card mt-3">
                  <label class="form-label mb-2" style="font-weight:700;color:var(--accent-rose);">✅ 2. 금형 및 LOT 정보 입력</label>
                  
                  <div style="display:flex;gap:1rem;flex-wrap:wrap;margin-bottom:1rem;background:#f8fafc;padding:0.75rem;border-radius:6px;">
                    <div style="flex:1;min-width:200px;">
                      <label class="form-label" style="font-size:0.8rem;color:#475569;">금형 1호기</label>
                      <div style="display:flex;gap:0.5rem;">
                        <input type="text" class="form-control" id="joint-m1-no" placeholder="호기 (예: 1호기)" />
                        <select class="form-select" id="joint-m1-pos">
                          <option value="직각">직각</option>
                          <option value="둔각">둔각</option>
                          <option value="직선">직선</option>
                          <option value="엔드">엔드</option>
                        </select>
                      </div>
                    </div>
                    <div style="flex:1;min-width:200px;">
                      <label class="form-label" style="font-size:0.8rem;color:#475569;">금형 2호기</label>
                      <div style="display:flex;gap:0.5rem;">
                        <input type="text" class="form-control" id="joint-m2-no" placeholder="호기" />
                        <select class="form-select" id="joint-m2-pos">
                          <option value="직각">직각</option>
                          <option value="둔각">둔각</option>
                          <option value="직선">직선</option>
                          <option value="엔드">엔드</option>
                        </select>
                      </div>
                    </div>
                    <div style="flex:1;min-width:200px;">
                      <label class="form-label" style="font-size:0.8rem;color:#475569;">금형 3호기</label>
                      <div style="display:flex;gap:0.5rem;">
                        <input type="text" class="form-control" id="joint-m3-no" placeholder="호기" />
                        <select class="form-select" id="joint-m3-pos">
                          <option value="직각">직각</option>
                          <option value="둔각">둔각</option>
                          <option value="직선">직선</option>
                          <option value="엔드">엔드</option>
                        </select>
                      </div>
                    </div>
                  </div>

                  <div style="display:grid;grid-template-columns:1fr 1fr;gap:1rem;">
                    <div>
                      <label class="form-label" style="font-size:0.8rem;">고무 압출소재 LOT (60664$OS)</label>
                      <input type="text" class="form-control" id="joint-rubber-lot" placeholder="LOT NO 입력" />
                    </div>
                  </div>
                </div>

                <!-- 🔴가류조건 측정 (초물/중물/종물) -->
                <div class="clip-sub-card mt-3">
                  <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:0.5rem;">
                    <label class="form-label" style="font-weight:700;color:var(--accent-rose);margin:0;">✅ 3. 가류조건 측정 (초/중/종)</label>
                    <span style="font-size:0.75rem;color:#64748b;">(범위 벗어나면 빨간색 표시)</span>
                  </div>
                  <div style="overflow-x:auto;">
                    <table style="width:100%;border-collapse:collapse;font-size:0.85rem;text-align:center;">
                      <thead>
                        <tr style="background:#f1f5f9;">
                          <th style="padding:0.5rem;border:1px solid #cbd5e1;" rowspan="2">구분</th>
                          <th style="padding:0.5rem;border:1px solid #cbd5e1;" colspan="2" id="joint-lbl-m1">#1</th>
                          <th style="padding:0.5rem;border:1px solid #cbd5e1;" colspan="2" id="joint-lbl-m2">#2</th>
                          <th style="padding:0.5rem;border:1px solid #cbd5e1;" colspan="2" id="joint-lbl-m3">#3</th>
                        </tr>
                        <tr style="background:#f8fafc;">
                          <th style="padding:0.3rem;border:1px solid #cbd5e1;font-size:0.75rem;">온도(℃)</th>
                          <th style="padding:0.3rem;border:1px solid #cbd5e1;font-size:0.75rem;">시간(초)</th>
                          <th style="padding:0.3rem;border:1px solid #cbd5e1;font-size:0.75rem;">온도(℃)</th>
                          <th style="padding:0.3rem;border:1px solid #cbd5e1;font-size:0.75rem;">시간(초)</th>
                          <th style="padding:0.3rem;border:1px solid #cbd5e1;font-size:0.75rem;">온도(℃)</th>
                          <th style="padding:0.3rem;border:1px solid #cbd5e1;font-size:0.75rem;">시간(초)</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td style="padding:0.4rem;border:1px solid #cbd5e1;font-weight:700;">초물</td>
                          <td style="padding:0.2rem;border:1px solid #cbd5e1;"><input type="number" class="form-control joint-temp" style="padding:0.2rem;text-align:center;" /></td>
                          <td style="padding:0.2rem;border:1px solid #cbd5e1;"><input type="number" class="form-control joint-time" style="padding:0.2rem;text-align:center;" /></td>
                          <td style="padding:0.2rem;border:1px solid #cbd5e1;"><input type="number" class="form-control joint-temp" style="padding:0.2rem;text-align:center;" /></td>
                          <td style="padding:0.2rem;border:1px solid #cbd5e1;"><input type="number" class="form-control joint-time" style="padding:0.2rem;text-align:center;" /></td>
                          <td style="padding:0.2rem;border:1px solid #cbd5e1;"><input type="number" class="form-control joint-temp" style="padding:0.2rem;text-align:center;" /></td>
                          <td style="padding:0.2rem;border:1px solid #cbd5e1;"><input type="number" class="form-control joint-time" style="padding:0.2rem;text-align:center;" /></td>
                        </tr>
                        <tr>
                          <td style="padding:0.4rem;border:1px solid #cbd5e1;font-weight:700;">중물</td>
                          <td style="padding:0.2rem;border:1px solid #cbd5e1;"><input type="number" class="form-control joint-temp" style="padding:0.2rem;text-align:center;" /></td>
                          <td style="padding:0.2rem;border:1px solid #cbd5e1;"><input type="number" class="form-control joint-time" style="padding:0.2rem;text-align:center;" /></td>
                          <td style="padding:0.2rem;border:1px solid #cbd5e1;"><input type="number" class="form-control joint-temp" style="padding:0.2rem;text-align:center;" /></td>
                          <td style="padding:0.2rem;border:1px solid #cbd5e1;"><input type="number" class="form-control joint-time" style="padding:0.2rem;text-align:center;" /></td>
                          <td style="padding:0.2rem;border:1px solid #cbd5e1;"><input type="number" class="form-control joint-temp" style="padding:0.2rem;text-align:center;" /></td>
                          <td style="padding:0.2rem;border:1px solid #cbd5e1;"><input type="number" class="form-control joint-time" style="padding:0.2rem;text-align:center;" /></td>
                        </tr>
                        <tr>
                          <td style="padding:0.4rem;border:1px solid #cbd5e1;font-weight:700;">종물</td>
                          <td style="padding:0.2rem;border:1px solid #cbd5e1;"><input type="number" class="form-control joint-temp" style="padding:0.2rem;text-align:center;" /></td>
                          <td style="padding:0.2rem;border:1px solid #cbd5e1;"><input type="number" class="form-control joint-time" style="padding:0.2rem;text-align:center;" /></td>
                          <td style="padding:0.2rem;border:1px solid #cbd5e1;"><input type="number" class="form-control joint-temp" style="padding:0.2rem;text-align:center;" /></td>
                          <td style="padding:0.2rem;border:1px solid #cbd5e1;"><input type="number" class="form-control joint-time" style="padding:0.2rem;text-align:center;" /></td>
                          <td style="padding:0.2rem;border:1px solid #cbd5e1;"><input type="number" class="form-control joint-temp" style="padding:0.2rem;text-align:center;" /></td>
                          <td style="padding:0.2rem;border:1px solid #cbd5e1;"><input type="number" class="form-control joint-time" style="padding:0.2rem;text-align:center;" /></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>

                <!-- 🔴금형 청소 및 에어홀 점검 -->
                <div class="clip-sub-card mt-3">
                  <label class="form-label mb-2" style="font-weight:700;color:var(--accent-rose);">✅ 4. 설비/금형 청소 및 에어홀 점검</label>
                  <div style="display:grid;grid-template-columns:1fr 1fr;gap:1rem;">
                    <div style="background:#f8fafc;padding:0.75rem;border-radius:6px;border:1px solid #e2e8f0;">
                      <div style="font-size:0.85rem;font-weight:700;margin-bottom:0.5rem;color:#334155;">[설비 및 금형 청소]</div>
                      <div style="display:flex;gap:0.25rem;margin-bottom:0.5rem;">
                        <input type="time" class="form-control" style="padding:0.2rem;font-size:0.8rem;" id="joint-clean-before" />
                        <input type="time" class="form-control" style="padding:0.2rem;font-size:0.8rem;" id="joint-clean-during" />
                        <input type="time" class="form-control" style="padding:0.2rem;font-size:0.8rem;" id="joint-clean-after" />
                      </div>
                      <select class="form-select" id="joint-clean-result" style="font-size:0.85rem;">
                        <option value="양호">점검결과: 양호</option>
                        <option value="불량">점검결과: 불량</option>
                      </select>
                    </div>
                    <div style="background:#f8fafc;padding:0.75rem;border-radius:6px;border:1px solid #e2e8f0;">
                      <div style="font-size:0.85rem;font-weight:700;margin-bottom:0.5rem;color:#334155;">[금형 에어홀 점검]</div>
                      <div style="display:flex;gap:0.25rem;margin-bottom:0.5rem;">
                        <input type="time" class="form-control" style="padding:0.2rem;font-size:0.8rem;" id="joint-hole-before" />
                        <input type="time" class="form-control" style="padding:0.2rem;font-size:0.8rem;" id="joint-hole-during" />
                        <input type="time" class="form-control" style="padding:0.2rem;font-size:0.8rem;" id="joint-hole-after" />
                      </div>
                      <select class="form-select" id="joint-hole-result" style="font-size:0.85rem;">
                        <option value="양호">점검결과: 양호</option>
                        <option value="막힘">점검결과: 막힘</option>
                      </select>
                    </div>
                  </div>
                </div>

                <!-- 🔴폐기 불량 현황 -->
                <div class="clip-sub-card mt-3">
                  <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:0.5rem;">
                    <label class="form-label" style="font-weight:700;color:var(--accent-rose);margin:0;">✅ 5. 폐기 불량 현황 (EA)</label>
                  </div>
                  <div style="overflow-x:auto;">
                    <table style="width:100%;border-collapse:collapse;font-size:0.85rem;text-align:center;">
                      <thead>
                        <tr style="background:#f1f5f9;">
                          <th style="padding:0.4rem;border:1px solid #cbd5e1;">불량 유형</th>
                          <th style="padding:0.4rem;border:1px solid #cbd5e1;width:15%;">A</th>
                          <th style="padding:0.4rem;border:1px solid #cbd5e1;width:15%;">B</th>
                          <th style="padding:0.4rem;border:1px solid #cbd5e1;width:15%;">C</th>
                          <th style="padding:0.4rem;border:1px solid #cbd5e1;width:20%;font-weight:900;">소계</th>
                        </tr>
                      </thead>
                      <tbody id="joint-defect-matrix-body">
                        <!-- JS injected -->
                      </tbody>
                    </table>
                  </div>
                  <div style="margin-top:0.5rem;text-align:right;">
                    <span style="font-weight:700;">불량 총계:</span>
                    <input type="number" id="joint-defect-grand-total" class="form-control" readonly style="display:inline-block;width:80px;text-align:right;color:var(--accent-rose);font-weight:900;" value="0" /> EA
                  </div>
                </div>

                <!-- 🔴비가동 및 예외사항 -->
                <div class="clip-sub-card mt-3" style="background:#fff1f2;border-color:#fecdd3;">
                  <label class="form-label mb-2" style="font-weight:700;color:#be123c;">✅ 6. 비가동 내역</label>
                  
                  <div style="display:flex;gap:0.5rem;align-items:center;margin-bottom:0.5rem;">
                    <select class="form-select" id="joint-act-type" style="width:140px;">
                      <option value="초물/종물(준비)">초물/종물(준비)</option>
                      <option value="LOT 교체">LOT 교체</option>
                      <option value="고무 교체">고무 교체</option>
                      <option value="금형 청소">금형 청소</option>
                      <option value="설비 고장">설비 고장</option>
                      <option value="기타(휴식 등)">기타(휴식 등)</option>
                    </select>
                    <input type="time" class="form-control" id="joint-act-start" />
                    <span>~</span>
                    <input type="time" class="form-control" id="joint-act-end" />
                    <input type="text" class="form-control" id="joint-act-min" readonly style="width:60px;" placeholder="분" />
                    <button type="button" class="btn btn-primary" id="btn-add-joint-act"><i class="ri-add-line"></i> 추가</button>
                  </div>

                  <div id="joint-act-list" style="background:#fff;border:1px solid #fecdd3;border-radius:4px;padding:0.5rem;min-height:40px;font-size:0.85rem;">
                    <!-- Added items -->
                  </div>
                </div>

              </div>
            </div>
"""
    html = html.replace('<div id="default-prod-card" class="card mb-3">', joint_card_html + '\n            <div id="default-prod-card" class="card mb-3">')

    load_log_orig = """  _loadLog(container) {
    const mfgId = container.querySelector('#w-mfg').value;
    const modelId = container.querySelector('#w-model').value;
    const partId = container.querySelector('#w-part').value;
    const procId = container.querySelector('#w-proc').value;

    const mfg = this.hierarchy.find(m => m.id === mfgId);
    const model = (mfg?.models || []).find(m => m.id === modelId);
    const part = (model?.parts || []).find(p => p.id === partId);
    const proc = (part?.processes || []).find(p => p.id === procId);

    const titleEl = container.querySelector('#prework-title');
    const badgeEl = container.querySelector('#prework-status-badge');
    const subtitleEl = container.querySelector('#prework-subtitle');

    if (titleEl && proc) titleEl.innerHTML = `<i class="ri-shield-check-line"></i> 1. 안전 및 기본 수칙 점검 (${proc.name})`;
    if (subtitleEl && model && part) subtitleEl.textContent = `[${model.name}] ${part.name}`;

    const isClip = (proc?.name === '클립결합');
    const isPrep = (proc?.name === '사상');
    
    container.querySelector('#clip-spec-card').style.display = isClip ? 'block' : 'none';
    container.querySelector('#prep-spec-card').style.display = isPrep ? 'block' : 'none';
    container.querySelector('#default-prod-card').style.display = (isClip || isPrep) ? 'none' : 'block';

    if (isClip) this._initClipCard(container, proc);
    if (isPrep) this._initPrepCard(container, proc);

    if (this.currentLog) {
      this._populateLogUI(container, this.currentLog);"""

    load_log_new = """  _loadLog(container) {
    const mfgId = container.querySelector('#w-mfg').value;
    const modelId = container.querySelector('#w-model').value;
    const partId = container.querySelector('#w-part').value;
    const procId = container.querySelector('#w-proc').value;

    const mfg = this.hierarchy.find(m => m.id === mfgId);
    const model = (mfg?.models || []).find(m => m.id === modelId);
    const part = (model?.parts || []).find(p => p.id === partId);
    const proc = (part?.processes || []).find(p => p.id === procId);

    const titleEl = container.querySelector('#prework-title');
    const badgeEl = container.querySelector('#prework-status-badge');
    const subtitleEl = container.querySelector('#prework-subtitle');

    if (titleEl && proc) titleEl.innerHTML = `<i class="ri-shield-check-line"></i> 1. 안전 및 기본 수칙 점검 (${proc.name})`;
    if (subtitleEl && model && part) subtitleEl.textContent = `[${model.name}] ${part.name}`;

    const isClip = (proc?.name === '클립결합');
    const isPrep = (proc?.name === '사상');
    const isJoint = (proc?.name === '조인트');
    
    container.querySelector('#clip-spec-card').style.display = isClip ? 'block' : 'none';
    container.querySelector('#prep-spec-card').style.display = isPrep ? 'block' : 'none';
    container.querySelector('#joint-spec-card').style.display = isJoint ? 'block' : 'none';
    container.querySelector('#default-prod-card').style.display = (isClip || isPrep || isJoint) ? 'none' : 'block';

    if (isClip) this._initClipCard(container, proc);
    if (isPrep) this._initPrepCard(container, proc);
    if (isJoint) this._initJointCard(container, proc);

    if (this.currentLog) {
      this._populateLogUI(container, this.currentLog);"""
    
    html = html.replace(load_log_orig, load_log_new)

    save_log_orig = """    let clipData = null;
    let prepData = null;
    
    if (isClip) {
      clipData = {
        workerStart: container.querySelector('#clip-worker-start')?.value || '',
        workerEnd: container.querySelector('#clip-worker-end')?.value || '',
        type: container.querySelector('#clip-type')?.value || 'YELLOW',
        lot: container.querySelector('#clip-lot')?.value || '',
        boxWeight: container.querySelector('#clip-box-weight')?.value || '',
        boxType: container.querySelector('#clip-box-type')?.value || '대(A)',
        clipStart: container.querySelector('#clip-chk-start')?.checked || false,
        clipMiddle: container.querySelector('#clip-chk-middle')?.checked || false,
        clipEnd: container.querySelector('#clip-chk-end')?.checked || false,
      };
    }

    if (isPrep) {
      prepData = {
        bladeChecked: container.querySelector('#prep-chk-blade')?.checked || false
      };
    }

    Object.assign(this.currentLog, {
      timeStart, timeEnd, plannedQuantity,
      totalQuantity: total, defectQuantity: defect, passQuantity: Math.max(0, total - defect),
      defectDetails, hasDowntime, downtimeReason, downtimeLineNo, downtimeDuration, downtimeNote, note, status,
      clipData, prepData
    });"""

    save_log_new = """    let clipData = null;
    let prepData = null;
    let jointData = null;
    
    if (isClip) {
      clipData = {
        workerStart: container.querySelector('#clip-worker-start')?.value || '',
        workerEnd: container.querySelector('#clip-worker-end')?.value || '',
        type: container.querySelector('#clip-type')?.value || 'YELLOW',
        lot: container.querySelector('#clip-lot')?.value || '',
        boxWeight: container.querySelector('#clip-box-weight')?.value || '',
        boxType: container.querySelector('#clip-box-type')?.value || '대(A)',
        clipStart: container.querySelector('#clip-chk-start')?.checked || false,
        clipMiddle: container.querySelector('#clip-chk-middle')?.checked || false,
        clipEnd: container.querySelector('#clip-chk-end')?.checked || false,
      };
    }

    if (isPrep) {
      prepData = {
        bladeChecked: container.querySelector('#prep-chk-blade')?.checked || false
      };
    }

    if (isJoint) {
      jointData = {
        timeStart, timeEnd, plannedQty: plannedQuantity, totalQty: total,
        partSide: container.querySelector('#joint-part-side')?.value || '',
        m1No: container.querySelector('#joint-m1-no')?.value || '',
        m1Pos: container.querySelector('#joint-m1-pos')?.value || '',
        m2No: container.querySelector('#joint-m2-no')?.value || '',
        m2Pos: container.querySelector('#joint-m2-pos')?.value || '',
        m3No: container.querySelector('#joint-m3-no')?.value || '',
        m3Pos: container.querySelector('#joint-m3-pos')?.value || '',
        rubberLot: container.querySelector('#joint-rubber-lot')?.value || '',
        cleanBefore: container.querySelector('#joint-clean-before')?.value || '',
        cleanDuring: container.querySelector('#joint-clean-during')?.value || '',
        cleanAfter: container.querySelector('#joint-clean-after')?.value || '',
        cleanResult: container.querySelector('#joint-clean-result')?.value || '',
        holeBefore: container.querySelector('#joint-hole-before')?.value || '',
        holeDuring: container.querySelector('#joint-hole-during')?.value || '',
        holeAfter: container.querySelector('#joint-hole-after')?.value || '',
        holeResult: container.querySelector('#joint-hole-result')?.value || '',
        downtimeEntries: (this.currentLog.jointData?.downtimeEntries || [])
      };
    }

    Object.assign(this.currentLog, {
      timeStart, timeEnd, plannedQuantity,
      totalQuantity: total, defectQuantity: defect, passQuantity: Math.max(0, total - defect),
      defectDetails, hasDowntime, downtimeReason, downtimeLineNo, downtimeDuration, downtimeNote, note, status,
      clipData, prepData, jointData
    });"""

    html = html.replace(save_log_orig, save_log_new)

    init_joint_card = """  _initJointCard(container, proc) {
    const jointCard = container.querySelector('#joint-spec-card');
    if (!jointCard) return;

    const updateLabel = () => {
      const m1 = container.querySelector('#joint-m1-no')?.value || '1호기';
      const m2 = container.querySelector('#joint-m2-no')?.value || '2호기';
      const m3 = container.querySelector('#joint-m3-no')?.value || '3호기';
      
      const l1 = container.querySelector('#joint-lbl-m1');
      const l2 = container.querySelector('#joint-lbl-m2');
      const l3 = container.querySelector('#joint-lbl-m3');
      
      if (l1) l1.textContent = `#1 (${m1})`;
      if (l2) l2.textContent = `#2 (${m2})`;
      if (l3) l3.textContent = `#3 (${m3})`;
    };

    ['#joint-m1-no', '#joint-m2-no', '#joint-m3-no'].forEach(selId => {
      const el = container.querySelector(selId);
      if (el) {
        el.addEventListener('change', updateLabel);
      }
    });
    updateLabel();

    container.querySelectorAll('.joint-temp').forEach(inp => {
      inp.addEventListener('input', (e) => {
        const val = parseFloat(e.target.value);
        if (!isNaN(val) && (val < 191 || val > 211)) {
          e.target.style.backgroundColor = '#fecdd3';
          e.target.style.color = '#be123c';
        } else {
          e.target.style.backgroundColor = '';
          e.target.style.color = '';
        }
      });
    });

    container.querySelectorAll('.joint-time').forEach(inp => {
      inp.addEventListener('input', (e) => {
        const val = parseFloat(e.target.value);
        if (!isNaN(val) && (val < 80 || val > 100)) {
          e.target.style.backgroundColor = '#fecdd3';
          e.target.style.color = '#be123c';
        } else {
          e.target.style.backgroundColor = '';
          e.target.style.color = '';
        }
      });
    });

    const defectTypes = ['떨어짐/찢어짐', '양 부족', '밀림/크랙', '기포', '씹힘/삽입불량', '겹침/오버랩', '찍힘', '이물질', '꼬임', '기타'];
    const tbody = container.querySelector('#joint-defect-matrix-body');
    if (tbody && tbody.children.length === 0) {
      let rowsHtml = '';
      defectTypes.forEach(type => {
        rowsHtml += `<tr>
          <td style="font-weight:700;">${type}</td>
          <td><input type="number" min="0" value="0" class="form-control joint-def-input joint-def-a" data-type="${type}" data-cat="A" /></td>
          <td><input type="number" min="0" value="0" class="form-control joint-def-input joint-def-b" data-type="${type}" data-cat="B" /></td>
          <td><input type="number" min="0" value="0" class="form-control joint-def-input joint-def-c" data-type="${type}" data-cat="C" /></td>
          <td style="font-weight:700;color:var(--accent-rose);" class="joint-def-row-subtotal">0</td>
        </tr>`;
      });
      tbody.innerHTML = rowsHtml;

      const calcTotal = () => {
        let gTot = 0;
        tbody.querySelectorAll('tr').forEach(tr => {
          let rowTot = 0;
          tr.querySelectorAll('.joint-def-input').forEach(inp => {
            rowTot += parseInt(inp.value) || 0;
          });
          tr.querySelector('.joint-def-row-subtotal').textContent = rowTot;
          gTot += rowTot;
        });
        const gTotalEl = container.querySelector('#joint-defect-grand-total');
        if (gTotalEl) gTotalEl.value = gTot;
      };

      tbody.querySelectorAll('.joint-def-input').forEach(inp => {
        inp.addEventListener('input', calcTotal);
      });
    }

    const startInp = container.querySelector('#joint-act-start');
    const endInp = container.querySelector('#joint-act-end');
    const minInp = container.querySelector('#joint-act-min');
    const addBtn = container.querySelector('#btn-add-joint-act');
    const actList = container.querySelector('#joint-act-list');
    
    const calcMin = () => {
      if (startInp.value && endInp.value) {
        const [h1, m1] = startInp.value.split(':').map(Number);
        const [h2, m2] = endInp.value.split(':').map(Number);
        let diff = (h2 * 60 + m2) - (h1 * 60 + m1);
        if (diff < 0) diff += 24 * 60;
        minInp.value = diff;
      } else {
        minInp.value = '';
      }
    };
    if(startInp) startInp.addEventListener('change', calcMin);
    if(endInp) endInp.addEventListener('change', calcMin);

    if (addBtn) {
      addBtn.addEventListener('click', () => {
        const type = container.querySelector('#joint-act-type').value;
        if (!startInp.value || !endInp.value) {
          alert('발생시간과 종료시간을 모두 입력하세요!'); return;
        }
        const itemHtml = `<div style="display:flex;justify-content:space-between;padding:0.25rem 0;border-bottom:1px solid #eee;">
          <span><strong>${type}</strong> (${startInp.value} ~ ${endInp.value})</span>
          <span style="color:var(--accent-rose);font-weight:700;">${minInp.value}분</span>
        </div>`;
        actList.insertAdjacentHTML('beforeend', itemHtml);
        startInp.value = ''; endInp.value = ''; minInp.value = '';
      });
    }
  }

  _initPrepCard(container, proc) {"""
    
    html = html.replace("  _initPrepCard(container, proc) {", init_joint_card)

    with io.open('index.html', 'w', encoding='utf-8') as f:
        f.write(html)
    print("Patched successfully!")

if __name__ == '__main__':
    patch_index()
