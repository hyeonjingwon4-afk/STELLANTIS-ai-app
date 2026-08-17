
const INITIAL_HIERARCHY = [
  {
    id: 'mfg_stellantis',
    name: '?ㅽ뀛??곗뒪 (Stellantis)',
    models: [
      {
        id: 'mod_dt_crew',
        name: 'DT CREW',
        parts: [
          {
            id: 'part_dtc_dside',
            name: 'D/SIDE',
            processes: [
              { id: 'proc_dtc_clip', name: '?대┰癒몄떊', isMachine: true, target: 1200 },
              { id: 'proc_dtc_prep', name: '?뚯옱以鍮?, isMachine: true, target: 1200 },
              { id: 'proc_dtc_joint', name: '議곗씤??, isMachine: false, target: 1200 },
              { id: 'proc_dtc_post', name: '?꾧?怨?, isMachine: false, target: 1200 },
              { id: 'proc_dtc_pack', name: '寃?ы룷??, isMachine: false, target: 1200 }
            ]
          }
        ]
      },
      {
        id: 'mod_dt_quad',
        name: 'DT QUAD',
        parts: [
          {
            id: 'part_dtq_dside',
            name: 'D/SIDE',
            processes: [
              { id: 'proc_dtq_clip', name: '?대┰癒몄떊', isMachine: true, target: 1000 },
              { id: 'proc_dtq_prep', name: '?뚯옱以鍮?, isMachine: true, target: 1000 },
              { id: 'proc_dtq_joint', name: '議곗씤??, isMachine: false, target: 1000 },
              { id: 'proc_dtq_post', name: '?꾧?怨?, isMachine: false, target: 1000 },
              { id: 'proc_dtq_pack', name: '寃?ы룷??, isMachine: false, target: 1000 }
            ]
          }
        ]
      },
      {
        id: 'mod_ds_crew',
        name: 'DS CREW',
        parts: [
          {
            id: 'part_dsc_dside',
            name: 'D/SIDE',
            processes: [
              { id: 'proc_dsc_prep_a', name: '?뚯옱以鍮?A)', isMachine: true, target: 1000 },
              { id: 'proc_dsc_prep_c', name: '?뚯옱以鍮?C)', isMachine: true, target: 1000 },
              { id: 'proc_dsc_prep_d', name: '?뚯옱以鍮?D)', isMachine: true, target: 1000 },
              { id: 'proc_dsc_joint', name: '議곗씤??, isMachine: false, target: 1000 },
              { id: 'proc_dsc_post', name: '?꾧?怨?, isMachine: false, target: 1000 },
              { id: 'proc_dsc_pack', name: '寃?ы룷??, isMachine: false, target: 1000 }
            ]
          }
        ]
      },
      {
        id: 'mod_ds_std',
        name: 'DS STD',
        parts: [
          {
            id: 'part_dss_dside',
            name: 'D/SIDE',
            processes: [
              { id: 'proc_dss_prep_a', name: '?뚯옱以鍮?A)', isMachine: true, target: 1000 },
              { id: 'proc_dss_prep_c', name: '?뚯옱以鍮?C)', isMachine: true, target: 1000 },
              { id: 'proc_dss_joint', name: '議곗씤??, isMachine: false, target: 1000 },
              { id: 'proc_dss_post', name: '?꾧?怨?, isMachine: false, target: 1000 },
              { id: 'proc_dss_pack', name: '寃?ы룷??, isMachine: false, target: 1000 }
            ]
          }
        ]
      },
      {
        id: 'mod_km_kx',
        name: 'KM/KX',
        parts: [
          {
            id: 'part_kmkx_hood',
            name: 'HOOD SURROUND',
            processes: [
              { id: 'proc_kmkx_clip', name: '?대┰癒몄떊', isMachine: true, target: 1000 },
              { id: 'proc_kmkx_joint', name: '議곗씤??, isMachine: false, target: 1000 },
              { id: 'proc_kmkx_post', name: '?꾧?怨?, isMachine: false, target: 1000 },
              { id: 'proc_kmkx_pack', name: '寃?ы룷??, isMachine: false, target: 1000 }
            ]
          }
        ]
      }
    ]
  }
];

const DEFECT_TYPES = [
  { id: 'def_dim', name: '移섏닔 ?ㅼ감 / 洹쒓꺽 誘몃떖' },
  { id: 'def_crack', name: '?щ옓 / 湲곹옒 / 蹂?? },
  { id: 'def_burr', name: '踰?Burr) / ?꾧?怨?誘명씉' },
  { id: 'def_foreign', name: '?대Ъ吏?/ ?꾩옣 遺덈웾' },
  { id: 'def_clip', name: '?대┰ 泥닿껐 ?꾨씫 / ?뚯넀' },
  { id: 'def_joint', name: '議곗씤???묓빀 ?⑹젒 遺덈웾' }
];

const LINE_LABELS = ['1?멸린', '2?멸린', '3?멸린', '4?멸린'];

const DEFAULT_CLIP_WASTE_TYPES = [
  '湲몄씠 誘몃떖',
  '湲몄씠 珥덇낵',
  '?앸떒遺 遺덈웾',
  '?대┰? 李?뼱吏?,
  '?대┰媛꾧꺽 遺덈웾',
  '?쒕젅?명? 遺덈웾',
  '?ㅼ퐫移?,
  '湲고?'
];

const CLIP_LINE_ITEMS = {
  '1?멸린': [
    { id: 'item_1_1', name: 'DT CREW A LH', lenSpec: '779 짹 5mm', gapSpec: '121 짹 1mm / 28 짹 1mm' },
    { id: 'item_1_2', name: 'DT CREW A RH', lenSpec: '779 짹 5mm', gapSpec: '28 짹 1mm / 121 짹 1mm' },
    { id: 'item_1_3', name: 'DT QUAD A LH', lenSpec: '509 짹 5mm', gapSpec: '121 짹 1mm / 28 짹 1mm' },
    { id: 'item_1_4', name: 'DT QUAD A RH', lenSpec: '509 짹 5mm', gapSpec: '28 짹 1mm / 121 짹 1mm' }
  ],
  '2?멸린': [
    { id: 'item_2_1', name: 'DT CREW B RH', lenSpec: '2,699 짹 6mm', gapSpec: '28 짹 1mm' },
    { id: 'item_2_2', name: 'DT QUAD B LH', lenSpec: '2,463 짹 10mm', gapSpec: '28 짹 1mm' }
  ],
  '3?멸린': [
    { id: 'item_3_1', name: 'DT CREW B LH', lenSpec: '2,699 짹 6mm', gapSpec: '28 짹 1mm' },
    { id: 'item_3_2', name: 'DT QUAD B RH', lenSpec: '2,463 짹 10mm', gapSpec: '28 짹 1mm' }
  ],
  '4?멸린': [
    { id: 'item_4_1', name: 'DT CREW B LH', lenSpec: '2,699 짹 6mm', gapSpec: '28 짹 1mm' },
    { id: 'item_4_2', name: 'DT CREW B RH', lenSpec: '2,699 짹 6mm', gapSpec: '28 짹 1mm' }
  ]
};

const DOWNTIME_REASONS = [
  '?숋툘 ?ㅻ퉬 怨좎옣 / ?뚯넀', '?벀 ?뚯옱 / 遺??寃고뭹',
  '?썱截?怨듦뎄 / 移섍났援?援먯껜', '?좑툘 ?덉쭏 ?댁긽 / 移섏닔 ?ㅼ감',
  '?슚 ?덉쟾 ?먭? / ?꾨젰 ?먭?', '?뱷 湲고? 鍮꾧????ъ쑀'
];

const MODEL_BADGE = {
  'DT CREW': 'badge-blue', 'DT QUAD': 'badge-purple'
};

const KEYS = { H: 'app_h_v6', L: 'app_l_v6', D: 'app_d_v6', WC: 'app_wc_v1' };

// ?덉쟾???ㅽ넗由ъ?: localStorage媛 李⑤떒?섎㈃ 硫붾え由?湲곕컲?쇰줈 ?숈옉
const _memStore = {};
const _safeStorage = {
  _ok: (() => { try { localStorage.setItem('__test__', '1'); localStorage.removeItem('__test__'); return true; } catch(e) { return false; } })(),
  getItem(k) { try { return this._ok ? localStorage.getItem(k) : (_memStore[k] ?? null); } catch { return _memStore[k] ?? null; } },
  setItem(k, v) { try { if (this._ok) localStorage.setItem(k, v); else _memStore[k] = v; } catch { _memStore[k] = v; } },
  removeItem(k) { try { if (this._ok) localStorage.removeItem(k); else delete _memStore[k]; } catch { delete _memStore[k]; } }
};

function getWeekString(d = new Date()) {
  const date = new Date(d.getTime());
  date.setHours(0, 0, 0, 0);
  date.setDate(date.getDate() + 3 - (date.getDay() + 6) % 7);
  const week1 = new Date(date.getFullYear(), 0, 4);
  const weekNumber = 1 + Math.round(((date.getTime() - week1.getTime()) / 86400000 - 3 + (week1.getDay() + 6) % 7) / 7);
  return `${date.getFullYear()}-W${weekNumber.toString().padStart(2, '0')}`;
}

class DataStore {
  constructor() { this._listeners = []; this._init(); }
  _init() {
    if (!_safeStorage.getItem(KEYS.H)) _safeStorage.setItem(KEYS.H, JSON.stringify(INITIAL_HIERARCHY));
    if (!_safeStorage.getItem(KEYS.D)) _safeStorage.setItem(KEYS.D, JSON.stringify(DEFECT_TYPES));
    
    let currentLogs = [];
    try { currentLogs = JSON.parse(_safeStorage.getItem(KEYS.L) || '[]'); } catch(e) {}
    
    if (currentLogs.length === 0) {
      const today = new Date().toISOString().split('T')[0];
      const sampleLogs = [];
      const parts = INITIAL_HIERARCHY[0].models[0].parts[0].processes;
      parts.forEach((p, idx) => {
        sampleLogs.push({
          id: 'sample_' + idx,
          date: today, workerName: '?뚯뒪??,
          modelId: INITIAL_HIERARCHY[0].models[0].id, modelName: INITIAL_HIERARCHY[0].models[0].name,
          partId: INITIAL_HIERARCHY[0].models[0].parts[0].id, partName: INITIAL_HIERARCHY[0].models[0].parts[0].name,
          processId: p.id, processName: p.name,
          totalQuantity: 1000 + (idx * 250),
          passQuantity: 950 + (idx * 240),
          defectQuantity: 50 + (idx * 10),
          achieveRate: 0, defectRate: 0, hasDowntime: idx % 2 === 0, status: 'SUBMITTED'
        });
      });
      _safeStorage.setItem(KEYS.L, JSON.stringify(sampleLogs));
    }

    if (!_safeStorage.getItem(KEYS.WC)) {
      _safeStorage.setItem(KEYS.WC, JSON.stringify({ week: getWeekString(), counts: {} }));
    }
  }
  getHierarchy() { return INITIAL_HIERARCHY; }
  getDefectTypes() { return DEFECT_TYPES; }
  getLogs() { try { return JSON.parse(_safeStorage.getItem(KEYS.L)) || []; } catch { return []; } }
  saveLogs(logs) { _safeStorage.setItem(KEYS.L, JSON.stringify(logs)); this._notify(); }
  getClipWasteCounts() {
    try {
      const data = JSON.parse(_safeStorage.getItem(KEYS.WC));
      if (!data) return {};
      if (!data.week) return data; // legacy
      if (data.week !== getWeekString()) return {};
      return data.counts || {};
    }
    catch { return {}; }
  }
  recordClipWaste(typeName) {
    if (!typeName || typeName === '?놁쓬' || typeName === '湲고?' || typeName === '?좏깮 ?덊븿 (?뺤긽)') return;
    const counts = this.getClipWasteCounts();
    counts[typeName] = (counts[typeName] || 0) + 1;
    _safeStorage.setItem(KEYS.WC, JSON.stringify({ week: getWeekString(), counts }));
    this._notify();
  }

  findOrCreateLog(params) {
    const logs = this.getLogs();
    let log = logs.find(l => l.date === params.date && l.processId === params.processId && l.workerName === params.workerName && l.birthDate === params.birthDate);
    if (!log) {
      log = {
        id: `log_${Date.now()}_${Math.random().toString(36).substr(2,5)}`,
        ...params,
        preWorkDone: false, clockInTime: null,
        totalQuantity: 0, passQuantity: 0, defectQuantity: 0,
        defectDetails: {}, hasDowntime: false, downtimeReason: '', downtimeLineNo: '', downtimeDuration: 0, downtimeNote: '',
        note: '', status: 'DRAFT',
        createdAt: new Date().toISOString(), updatedAt: new Date().toISOString()
      };
      logs.unshift(log);
      this.saveLogs(logs);
    }
    return log;
  }
  updateLog(log) {
    const logs = this.getLogs();
    const idx = logs.findIndex(l => l.id === log.id);
    if (idx !== -1) { logs[idx] = { ...logs[idx], ...log, updatedAt: new Date().toISOString() }; this.saveLogs(logs); return logs[idx]; }
    return null;
  }
  deleteLog(id) {
    const logs = this.getLogs();
    const updated = logs.filter(l => l.id !== id);
    if (updated.length !== logs.length) {
      this.saveLogs(updated);
      return true;
    }
    return false;
  }
  subscribe(fn) { this._listeners.push(fn); }
  _notify() { this._listeners.forEach(fn => fn()); }
}
const store = new DataStore();


class WorkerManager {
  constructor() { this.currentLog = null; this.workerName = ''; this.birthDate = ''; this.hierarchy = store.getHierarchy(); }

  render(container) {
    this._bindStepEvents(container);
  }

  _bindStepEvents(container) {
    this._bindPopupEvents(container);
    container.querySelector('#btn-step1-next')?.addEventListener('click', () => {
      try {
        const wn = container.querySelector('#w-name').value.trim();
        const bd = container.querySelector('#w-birth').value.trim();
        if (!wn || bd.length !== 6) { alert('?깊븿怨??앸뀈?붿씪 6?먮━瑜??щ컮瑜닿쾶 ?낅젰?댁＜?몄슂!'); return; }
        this.workerName = wn; this.birthDate = bd;
        this._populateSelects(container);
        this._goStep(container, 2);
      } catch(e) {
        alert('[?붾쾭洹? ?ㅻ쪟 諛쒖깮:\n' + e.message);
        console.error(e);
      }
    });

    container.querySelector('#btn-step2-back')?.addEventListener('click', () => this._goStep(container, 1));
    container.querySelector('#btn-step2-next')?.addEventListener('click', () => {
      this._loadLog(container);
      this._goStep(container, 3);
    });

    container.querySelector('#w-mfg')?.addEventListener('change', () => this._updateModels(container));
    container.querySelector('#w-model')?.addEventListener('change', () => this._updateParts(container));
    container.querySelector('#w-part')?.addEventListener('change', () => this._updateProcs(container));

    const calcPass = () => {
      const t = parseInt(container.querySelector('#prod-total')?.value) || 0;
      const d = parseInt(container.querySelector('#prod-defect')?.value) || 0;
      const passEl = container.querySelector('#prod-pass');
      if (passEl) passEl.value = Math.max(0, t - d);
    };
    container.querySelector('#prod-total')?.addEventListener('input', calcPass);
    container.querySelector('#prod-defect')?.addEventListener('input', calcPass);

    container.querySelector('#chk-has-downtime')?.addEventListener('change', (e) => {
      const section = container.querySelector('#downtime-section');
      if (e.target.checked) {
        section?.classList.remove('hidden');
        const dtTime = container.querySelector('#dt-time');
        if (dtTime) dtTime.value = new Date().toISOString().substring(0,16);
        if (this.currentLog) {
          const dtPart = container.querySelector('#dt-part-name');
          if (dtPart) dtPart.value = this.currentLog.partName || '';
        }
      } else {
        section?.classList.add('hidden');
      }
    });

    container.querySelector('#dt-duration')?.addEventListener('input', (e) => {
      const warn = container.querySelector('#dt-duration-warn');
      if (warn) warn.style.display = parseInt(e.target.value) >= 10 ? 'inline' : 'none';
    });

    container.addEventListener('click', (e) => {
      if (e.target.classList.contains('line-btn')) {
        container.querySelectorAll('.line-btn').forEach(b => b.classList.remove('selected'));
        e.target.classList.add('selected');
        const lineNo = container.querySelector('#dt-line-no');
        if (lineNo) lineNo.value = e.target.dataset.line;
      }
    });

    container.querySelector('#btn-add-downtime-entry')?.addEventListener('click', () => this._addDowntimeEntry(container));
    container.querySelector('#btn-prework-submit')?.addEventListener('click', () => this._submitPrework(container));
    container.querySelector('#btn-save-draft')?.addEventListener('click', () => this._saveLog(container, 'DRAFT'));
    container.querySelector('#btn-submit-final')?.addEventListener('click', () => this._saveLog(container, 'SUBMITTED'));
    container.querySelector('#btn-refresh-history')?.addEventListener('click', () => this._renderHistory(container));
  }

  _goStep(container, step) {
    container.querySelector('#step1').style.display = step === 1 ? 'block' : 'none';
    container.querySelector('#step2').style.display = step === 2 ? 'block' : 'none';
    container.querySelector('#step3').style.display = step === 3 ? 'block' : 'none';

    container.querySelector('#pill-1').className = `step-pill ${step === 1 ? 'active' : 'done'}`;
    container.querySelector('#pill-2').className = `step-pill ${step === 2 ? 'active' : step > 2 ? 'done' : ''}`;
    container.querySelector('#pill-3').className = `step-pill ${step === 3 ? 'active' : ''}`;

    const floatBtn = container.querySelector('#btn-floating-logs');
    if (floatBtn) {
      if (step > 1 && this.workerName) {
        floatBtn.classList.add('visible');
        this._updateFloatingLogsCount(container);
      } else {
        floatBtn.classList.remove('visible');
      }
    }
  }

  _populateSelects(container) {
    container.querySelector('#w-mfg').innerHTML = this.hierarchy.map(m => `<option value="${m.id}">${m.name}</option>`).join('');
    this._updateModels(container);
  }
  _updateModels(container) {
    const mfgId = container.querySelector('#w-mfg').value;
    const mfg = this.hierarchy.find(m => m.id === mfgId);
    container.querySelector('#w-model').innerHTML = (mfg?.models || []).map(m => `<option value="${m.id}">${m.name}</option>`).join('');
    this._updateParts(container);
  }
  _updateParts(container) {
    const mfgId = container.querySelector('#w-mfg').value;
    const modelId = container.querySelector('#w-model').value;
    const mfg = this.hierarchy.find(m => m.id === mfgId);
    const model = (mfg?.models || []).find(m => m.id === modelId);
    container.querySelector('#w-part').innerHTML = (model?.parts || []).map(p => `<option value="${p.id}">${p.name}</option>`).join('');
    this._updateProcs(container);
  }
  _updateProcs(container) {
    const mfgId = container.querySelector('#w-mfg').value;
    const modelId = container.querySelector('#w-model').value;
    const partId = container.querySelector('#w-part').value;
    const mfg = this.hierarchy.find(m => m.id === mfgId);
    const model = (mfg?.models || []).find(m => m.id === modelId);
    const part = (model?.parts || []).find(p => p.id === partId);
    container.querySelector('#w-proc').innerHTML = (part?.processes || []).map(pr => `<option value="${pr.id}">${pr.name}</option>`).join('');
  }

  _loadLog(container) {
    const mfgId = container.querySelector('#w-mfg').value;
    const modelId = container.querySelector('#w-model').value;
    const partId = container.querySelector('#w-part').value;
    const processId = container.querySelector('#w-proc').value;

    const mfg = this.hierarchy.find(m => m.id === mfgId);
    const model = (mfg?.models || []).find(m => m.id === modelId);
    const part = (model?.parts || []).find(p => p.id === partId);
    const proc = (part?.processes || []).find(pr => pr.id === processId);

    const today = new Date().toISOString().split('T')[0];
    this.currentLog = store.findOrCreateLog({
      date: today, workerName: this.workerName, birthDate: this.birthDate,
      mfgName: mfg?.name || '', modelId: model?.id || '', modelName: model?.name || '',
      partId: part?.id || '', partName: part?.name || '', processId: proc?.id || '', processName: proc?.name || '',
      isMachine: proc?.isMachine || false
    });

    const isClip = (proc?.name || '').includes('?대┰癒몄떊') || (proc?.id || '').includes('clip');
    container.querySelector('#clip-spec-card').style.display = isClip ? 'block' : 'none';
    if (isClip) this._initClipCard(container);

    const isPrep = (proc?.name || '').includes('?뚯옱以鍮?) || (proc?.id || '').includes('prep');
    container.querySelector('#prep-spec-card').style.display = isPrep ? 'block' : 'none';
    if (isPrep) this._initPrepCard(container, proc);

    this._renderPrework(container, proc?.isMachine || false);
    this._renderDefectGrid(container);
    this._populateLogUI(container);
    this._renderHistory(container);
  }

  _initClipCard(container) {
    const clipCard = container.querySelector('#clip-spec-card');
    if (!clipCard) return;

    let activeLine = '1?멸린';

    const renderLine = (lineNo) => {
      activeLine = lineNo;
      container.querySelector('#clip-active-line-title').innerHTML = `<i class="ri-cpu-line"></i> [ ${lineNo} ?쇱? ?묒꽦 ]`;
      container.querySelector('#clip-active-line-badge').textContent = `${lineNo} ?꾩슜 ?앹궛?덈ぉ`;

      const itemSel = container.querySelector('#clip-single-item-sel');
      const items = CLIP_LINE_ITEMS[lineNo] || [];
      itemSel.innerHTML = items.map(it => `<option value="${it.name}" data-len="${it.lenSpec}" data-gap="${it.gapSpec}">${it.name}</option>`).join('');

      updateSpecTag();
    };

    const updateSpecTag = () => {
      const itemSel = container.querySelector('#clip-single-item-sel');
      const opt = itemSel.options[itemSel.selectedIndex];
      const tag = container.querySelector('#clip-single-spec-tag');
      if (opt && tag) tag.textContent = `?뱪 ?꾩옣: ${opt.dataset.len} | ?앸떒 ?대┰ 媛꾧꺽(?쒖옉/??: ${opt.dataset.gap}`;
    };

    const populateWasteTypes = () => {
      const wasteSel = container.querySelector('#clip-single-waste-type');
      if (!wasteSel) return;
      const counts = store.getClipWasteCounts();
      const sortedTypes = [...DEFAULT_CLIP_WASTE_TYPES].sort((a, b) => {
        const cA = counts[a] || 0;
        const cB = counts[b] || 0;
        if (a === '湲고?') return 1;
        if (b === '湲고?') return -1;
        return cB - cA;
      });

      wasteSel.innerHTML = '<option value="">?좏깮 ?덊븿 (?뺤긽)</option>' + sortedTypes.map(name => {
        const cnt = counts[name] || 0;
        const badgeStr = cnt > 0 ? ` (?뵦 ${cnt}??` : '';
        return `<option value="${name}">${name}${badgeStr}</option>`;
      }).join('');

      const etcInput = container.querySelector('#clip-single-waste-etc');
      wasteSel.onchange = () => {
        if (etcInput) etcInput.style.display = wasteSel.value === '湲고?' ? 'block' : 'none';
      };
    };

    populateWasteTypes();

    clipCard.querySelectorAll('.clip-line-tab').forEach(tab => {
      tab.onclick = (e) => {
        clipCard.querySelectorAll('.clip-line-tab').forEach(t => t.classList.remove('active'));
        const btn = e.currentTarget;
        btn.classList.add('active');
        renderLine(btn.dataset.cline);
      };
    });

    container.querySelector('#clip-single-item-sel').onchange = updateSpecTag;
    renderLine('1?멸린');
  }

  _initJointCard(container, proc) {
    const jointCard = container.querySelector('#joint-spec-card');
    if (!jointCard) return;

    const updateLabel = () => {
      const m1 = container.querySelector('#joint-m1-no')?.value || '1?硫몃┛';
      const m2 = container.querySelector('#joint-m2-no')?.value || '2?硫몃┛';
      const m3 = container.querySelector('#joint-m3-no')?.value || '3?硫몃┛';
      
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

    const defectTypes = ['??λ선筌?筌?堉깍쭪?, '???봔鈺?, '獄쎛??????, '疫꿸퀬猷?, '?諭곸삋/??뚯뿯?븍뜄??, '??뤿쵟/??살쒔??, '?袁???, '??窺筌?, '?쀑딆뿫', '疫꿸퀬?'];
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
          alert('獄쏆뮇源??볦퍢???袁⑥┷??볦퍢??筌뤴뫀紐???낆젾??뤾쉭??'); return;
        }
        const itemHtml = `<div style="display:flex;justify-content:space-between;padding:0.25rem 0;border-bottom:1px solid #eee;">
          <span><strong>${type}</strong> (${startInp.value} ~ ${endInp.value})</span>
          <span style="color:var(--accent-rose);font-weight:700;">${minInp.value}??/span>
        </div>`;
        actList.insertAdjacentHTML('beforeend', itemHtml);
        startInp.value = ''; endInp.value = ''; minInp.value = '';
      });
    }
  }

  _initPrepCard(container, proc) {
    const isCrew = (this.currentLog?.modelName || '').includes('CREW');
    const targetLen = isCrew ? '779짹5' : '509짹5';
    container.querySelectorAll('.prep-spec-len').forEach(el => el.textContent = targetLen);

    const tabs = container.querySelectorAll('.prep-tab-btn');
    tabs.forEach(btn => {
      btn.onclick = () => {
        tabs.forEach(t => t.classList.remove('active'));
        btn.classList.add('active');
        const side = btn.dataset.side;
        container.querySelector('#prep-tab-content-LH').style.display = side === 'LH' ? 'block' : 'none';
        container.querySelector('#prep-tab-content-RH').style.display = side === 'RH' ? 'block' : 'none';
        container.querySelectorAll('.prep-side-label').forEach(el => el.textContent = side);
      };
    });

    const calcPrepDef = (side) => {
      let tot = 0;
      container.querySelectorAll(`.prep-${side}-def`).forEach(inp => {
        tot += parseInt(inp.value) || 0;
      });
      const totalEl = container.querySelector(`#prep-${side}-def-total`);
      if (totalEl) totalEl.value = tot;
    };
    container.querySelectorAll('.prep-LH-def').forEach(inp => inp.addEventListener('input', () => calcPrepDef('LH')));
    container.querySelectorAll('.prep-RH-def').forEach(inp => inp.addEventListener('input', () => calcPrepDef('RH')));
  }

  _renderPrework(container, isMachine) {
    container.querySelector('#prework-title').innerHTML = isMachine
      ? '<i class="ri-settings-4-line"></i> 1. TPM 湲곌퀎 ?먭? ?쇱?'
      : '<i class="ri-shield-user-line"></i> 1. ?묒뾽 ???덉쟾 ?먭? ?쇱?';
    container.querySelector('#checklist-container').innerHTML = isMachine ? `
      <label class="custom-checkbox-card"><input type="checkbox" /> <span>???꾩썝 諛?鍮꾩긽?뺤? ?ㅼ쐞移??뺤긽 ?숈옉</span></label>
      <label class="custom-checkbox-card"><input type="checkbox" /> <span>?썴截??ㅼ씪/媛怨듭쑀 ?꾩쑀 ?щ? 諛?寃뚯씠吏 ?뺤긽</span></label>
      <label class="custom-checkbox-card"><input type="checkbox" /> <span>?뵄 援щ룞 ???댁긽?뚯쓬 諛?吏꾨룞 ?놁쓬</span></label>
      <label class="custom-checkbox-card"><input type="checkbox" /> <span>?㏏ 湲덊삎/移섍났援??대Ъ吏??쒓굅 諛?泥?껐</span></label>
    ` : `
      <label class="custom-checkbox-card"><input type="checkbox" /> <span>?? 媛쒖씤 蹂댄샇援??덉쟾紐? ?덉쟾?? ?κ컩) 李⑹슜</span></label>
      <label class="custom-checkbox-card"><input type="checkbox" /> <span>?㏏ ?묒뾽??二쇰? ?뺣━?뺣룉 ?곹깭 ?뺤씤</span></label>
      <label class="custom-checkbox-card"><input type="checkbox" /> <span>?뮞 ?뚯＜ 諛?吏덊솚 ?놁쓬 (嫄닿컯 ?곹깭 苡뚯쟻)</span></label>
      <label class="custom-checkbox-card"><input type="checkbox" /> <span>?썱截??묒뾽 ?섍났援??뚯넀 ?щ? ?먭? ?꾨즺</span></label>
    `;
  }

  _renderDefectGrid(container) {
    const defects = store.getDefectTypes();
    container.querySelector('#defect-types-grid').innerHTML = defects.map(d => `
      <div class="form-group mb-1">
        <label class="form-label" style="font-size:0.78rem;">${d.name}</label>
        <input type="number" class="form-control defect-input" data-did="${d.id}" min="0" value="0" style="padding:0.4rem;" />
      </div>
    `).join('');
  }

  _populateLogUI(container) {
    const log = this.currentLog;
    const pwBadge = container.querySelector('#prework-status-badge');
    const pwBtn = container.querySelector('#btn-prework-submit');

    if (log.preWorkDone) {
      pwBadge.className = 'badge badge-emerald'; pwBadge.textContent = '?먭? ?꾨즺';
      pwBtn.disabled = true; pwBtn.innerHTML = '???먭? ?꾨즺??;
      container.querySelectorAll('#checklist-container input').forEach(c => { c.checked = true; c.disabled = true; });
    } else {
      pwBadge.className = 'badge badge-amber'; pwBadge.textContent = '誘몄셿猷?;
      pwBtn.disabled = false;
      const today = new Date().toISOString().split('T')[0];
      const hasClockedIn = store.getLogs().some(l => l.workerName === this.workerName && l.date === today && l.preWorkDone && l.id !== log.id);
      pwBtn.innerHTML = hasClockedIn ? '<i class="ri-check-double-line"></i> TPM ?먭? ?꾨즺' : '<i class="ri-check-double-line"></i> ?먭? ?꾨즺 諛?洹쇰Т ?쒖옉 湲곕줉';
      container.querySelectorAll('#checklist-container input').forEach(c => { c.checked = false; c.disabled = false; });
    }

    container.querySelector('#prod-time-start').value = log.timeStart || '';
    container.querySelector('#prod-time-end').value = log.timeEnd || '';
    container.querySelector('#prod-planned').value = log.plannedQuantity || 0;
    container.querySelector('#prod-total').value = log.totalQuantity || 0;
    container.querySelector('#prod-pass').value = log.passQuantity || 0;
    container.querySelector('#prod-defect').value = log.defectQuantity || 0;
    container.querySelector('#prod-note').value = log.note || '';

    container.querySelectorAll('.defect-input').forEach(inp => {
      inp.value = log.defectDetails?.[inp.dataset.did] || 0;
    });

    container.querySelector('#chk-has-downtime').checked = !!log.hasDowntime;
    const dtSec = container.querySelector('#downtime-section');
    if (log.hasDowntime) dtSec.classList.remove('hidden'); else dtSec.classList.add('hidden');

    if (log.downtimeReason) {
      const dtReasonSel = container.querySelector('#dt-reason');
      const opt = Array.from(dtReasonSel.options).find(o => o.value === log.downtimeReason);
      if (opt) dtReasonSel.value = log.downtimeReason;
    }
    container.querySelector('#dt-note').value = log.downtimeNote || '';
    container.querySelector('#dt-part-name').value = log.partName || '';
    const dur = log.downtimeDuration || 0;
    container.querySelector('#dt-duration').value = dur;
    container.querySelector('#dt-duration-warn').style.display = (dur >= 10 && log.hasDowntime) ? 'inline' : 'none';

    const lineNo = log.downtimeLineNo || '';
    container.querySelectorAll('.line-btn').forEach(b => {
      b.classList.toggle('selected', b.dataset.line === lineNo);
    });
    container.querySelector('#dt-line-no').value = lineNo;

    this._renderDowntimeEntries(container);

    if (log.clipData && (log.processName?.includes('?대┰癒몄떊') || log.processId?.includes('clip'))) {
      const cd = log.clipData;
      if (cd.lineNo) {
        const lineTab = container.querySelector(`.clip-line-tab[data-cline="${cd.lineNo}"]`);
        if (lineTab) lineTab.click();
      }
      if (container.querySelector('#clip-single-item-sel') && cd.itemName) container.querySelector('#clip-single-item-sel').value = cd.itemName;
      if (container.querySelector('#clip-single-t-start')) container.querySelector('#clip-single-t-start').value = cd.timeStart || '08:00';
      if (container.querySelector('#clip-single-t-end')) container.querySelector('#clip-single-t-end').value = cd.timeEnd || '17:00';
      if (container.querySelector('#clip-single-lot-init')) container.querySelector('#clip-single-lot-init').value = cd.lotInit || '';
      if (container.querySelector('#clip-single-lot-mid')) container.querySelector('#clip-single-lot-mid').value = cd.lotMid || '';
      if (container.querySelector('#clip-single-lot-fin')) container.querySelector('#clip-single-lot-fin').value = cd.lotFin || '';
      if (container.querySelector('#dim-single-init-len')) container.querySelector('#dim-single-init-len').value = cd.dimInitLen || '';
      if (container.querySelector('#dim-single-init-gap')) container.querySelector('#dim-single-init-gap').value = cd.dimInitGap || '';
      if (container.querySelector('#dim-single-mid-len')) container.querySelector('#dim-single-mid-len').value = cd.dimMidLen || '';
      if (container.querySelector('#dim-single-mid-gap')) container.querySelector('#dim-single-mid-gap').value = cd.dimMidGap || '';
      if (container.querySelector('#dim-single-fin-len')) container.querySelector('#dim-single-fin-len').value = cd.dimFinLen || '';
      if (container.querySelector('#dim-single-fin-gap')) container.querySelector('#dim-single-fin-gap').value = cd.dimFinGap || '';
      if (container.querySelector('#clip-single-loss-join')) container.querySelector('#clip-single-loss-join').value = cd.lossJoin || 0;
      if (container.querySelector('#clip-single-loss-defect')) container.querySelector('#clip-single-loss-defect').value = cd.lossDefect || 0;
      if (container.querySelector('#clip-single-waste-total')) container.querySelector('#clip-single-waste-total').value = cd.wasteTotal || 0;
      if (container.querySelector('#clip-single-waste-type') && cd.wasteType) {
        container.querySelector('#clip-single-waste-type').value = cd.wasteType;
        const etcInp = container.querySelector('#clip-single-waste-etc');
        if (etcInp) {
          etcInp.style.display = cd.wasteType === '湲고?' ? 'block' : 'none';
          etcInp.value = cd.wasteNote || '';
        }
      }
    }

    if (log.prepData && (log.processName?.includes('?뚯옱以鍮?) || log.processId?.includes('prep'))) {
      const pd = log.prepData;
      ['LH', 'RH'].forEach(side => {
        if (container.querySelector(`#prep-${side}-lot-init`)) container.querySelector(`#prep-${side}-lot-init`).value = pd[`${side}_lotInit`] || '';
        if (container.querySelector(`#prep-${side}-lot-mid`)) container.querySelector(`#prep-${side}-lot-mid`).value = pd[`${side}_lotMid`] || '';
        if (container.querySelector(`#prep-${side}-lot-fin`)) container.querySelector(`#prep-${side}-lot-fin`).value = pd[`${side}_lotFin`] || '';
        for (let i=1; i<=4; i++) {
          for (let j=1; j<=3; j++) {
            if (container.querySelector(`#prep-${side}-dim-${i}-${j}`)) {
              container.querySelector(`#prep-${side}-dim-${i}-${j}`).value = pd[`${side}_dim_${i}_${j}`] || '';
            }
          }
        }
        if (container.querySelector(`#prep-${side}-def-ext-1`)) container.querySelector(`#prep-${side}-def-ext-1`).value = pd[`${side}_def_ext_1`] || 0;
        if (container.querySelector(`#prep-${side}-def-ext-2`)) container.querySelector(`#prep-${side}-def-ext-2`).value = pd[`${side}_def_ext_2`] || 0;
        if (container.querySelector(`#prep-${side}-def-ext-3`)) container.querySelector(`#prep-${side}-def-ext-3`).value = pd[`${side}_def_ext_3`] || 0;
        if (container.querySelector(`#prep-${side}-def-prc-1`)) container.querySelector(`#prep-${side}-def-prc-1`).value = pd[`${side}_def_prc_1`] || 0;
        if (container.querySelector(`#prep-${side}-def-prc-2`)) container.querySelector(`#prep-${side}-def-prc-2`).value = pd[`${side}_def_prc_2`] || 0;
        if (container.querySelector(`#prep-${side}-def-prc-3`)) container.querySelector(`#prep-${side}-def-prc-3`).value = pd[`${side}_def_prc_3`] || 0;
        if (container.querySelector(`#prep-${side}-def-total`)) container.querySelector(`#prep-${side}-def-total`).value = pd[`${side}_def_total`] || 0;
      });
      if (container.querySelector('#prep-chk-blade')) container.querySelector('#prep-chk-blade').checked = pd.chkBlade || false;
    }

    const statusBadge = container.querySelector('#log-status-badge');
    const locked = container.querySelector('#log-locked-notice');
    const draftBtn = container.querySelector('#btn-save-draft');
    const finalBtn = container.querySelector('#btn-submit-final');
    if (log.status === 'SUBMITTED') {
      statusBadge.className = 'badge badge-emerald'; statusBadge.innerHTML = '??理쒖쥌 ?쒖텧 ?꾨즺';
      locked.style.display = 'block'; draftBtn.disabled = true; finalBtn.disabled = true;
      finalBtn.textContent = '??理쒖쥌 ?쒖텧 ?꾨즺??;
    } else {
      statusBadge.className = 'badge badge-amber'; statusBadge.innerHTML = '?랃툘 ?묒꽦 以?(以묎컙???媛??';
      locked.style.display = 'none'; draftBtn.disabled = false; finalBtn.disabled = false;
      finalBtn.innerHTML = '<i class="ri-send-plane-fill"></i> 理쒖쥌 ?쒖텧';
    }
  }

  _addDowntimeEntry(container) {
    if (!this.currentLog) return;
    if (!this.currentLog.downtimeEntries) this.currentLog.downtimeEntries = [];

    const time = container.querySelector('#dt-time').value || new Date().toISOString().substring(0,16);
    const duration = parseInt(container.querySelector('#dt-duration').value) || 0;
    const lineNo = container.querySelector('#dt-line-no').value || '1?멸린';
    const reason = container.querySelector('#dt-reason').value || '?ㅻ퉬 ?먭?';
    const note = container.querySelector('#dt-note').value || '';

    const entry = { id: 'dt_' + Date.now(), time, duration, lineNo, reason, note };
    this.currentLog.downtimeEntries.push(entry);
    this.currentLog.hasDowntime = true;
    container.querySelector('#chk-has-downtime').checked = true;
    container.querySelector('#downtime-section').classList.remove('hidden');

    this._renderDowntimeEntries(container);
    alert(`[${lineNo}] ${duration}遺?以묐떒 ?댁뿭(?뚯감)???붿빟 紐⑸줉??異붽??섏뿀?듬땲??`);
  }

  _renderDowntimeEntries(container) {
    if (!this.currentLog) return;
    const entries = this.currentLog.downtimeEntries || [];
    const countBadge = container.querySelector('#dt-entry-count-badge');
    if (countBadge) countBadge.textContent = `${entries.length} 嫄?湲곕줉??;
    const tbody = container.querySelector('#tbl-downtime-entries-body');
    if (!tbody) return;

    if (!entries.length) {
      tbody.innerHTML = '<tr><td colspan="6" class="text-center" style="color:var(--text-muted);">?깅줉??以묐떒 ?댁뿭???놁뒿?덈떎. (???묒떇 ?묒꽦 ??異붽? 踰꾪듉 ?대┃)</td></tr>';
      return;
    }

    tbody.innerHTML = entries.map((e, idx) => `
      <tr>
        <td><strong>${idx + 1}?뚯감</strong></td>
        <td style="font-size:0.75rem;">${(e.time||'').replace('T', ' ')}</td>
        <td><span class="badge badge-purple">${e.lineNo||'1?멸린'}</span></td>
        <td><span class="badge ${e.duration>=10?'badge-rose':'badge-amber'}">${e.duration||0}遺?/span></td>
        <td style="font-size:0.78rem;"><strong>${e.reason}</strong><br/><span style="color:var(--text-secondary);">${e.note||'-'}</span></td>
        <td><button type="button" class="btn btn-outline btn-sm btn-del-dt-entry" data-id="${e.id}" style="color:var(--accent-rose);padding:0.15rem 0.35rem;font-size:0.75rem;">&times;</button></td>
      </tr>
    `).join('');

    tbody.querySelectorAll('.btn-del-dt-entry').forEach(btn => {
      btn.onclick = (evt) => {
        const id = evt.currentTarget.dataset.id;
        this.currentLog.downtimeEntries = this.currentLog.downtimeEntries.filter(x => x.id !== id);
        if (!this.currentLog.downtimeEntries.length) {
          this.currentLog.hasDowntime = false;
        }
        this._renderDowntimeEntries(container);
      };
    });
  }

  _submitPrework(container) {
    if (!this.currentLog) return;
    
    const today = new Date().toISOString().split('T')[0];
    const pastLogs = store.getLogs().filter(l => l.workerName === this.workerName && l.date === today && l.preWorkDone && l.id !== this.currentLog.id);
    
    this.currentLog.preWorkDone = true;

    if (pastLogs.length === 0) {
      const clockIn = new Date().toISOString();
      this.currentLog.clockInTime = clockIn;
      store.updateLog(this.currentLog);
      this._populateLogUI(container);
      this._renderHistory(container);
      alert(`洹쇰Т ?쒖옉 ?쒓컙: ${new Date(clockIn).toLocaleTimeString('ko-KR')} 湲곕줉 ?꾨즺!`);
    } else {
      const firstClockIn = pastLogs.find(l => l.clockInTime)?.clockInTime || new Date().toISOString();
      this.currentLog.clockInTime = firstClockIn; 
      store.updateLog(this.currentLog);
      this._populateLogUI(container);
      this._renderHistory(container);
      alert(`??TPM ?먭? ?꾨즺! (?ㅻ뒛 理쒖큹 異쒓렐 湲곕줉 ?좎???`);
    }
  }

  _saveLog(container, status) {
    if (!this.currentLog) return;
    if (!this.currentLog.preWorkDone) { alert('?묒뾽 ?쒖옉 ???먭? ?쇱?瑜?癒쇱? ?쒖텧??二쇱꽭??'); return; }
    if (status === 'SUBMITTED' && !confirm('理쒖쥌 ?쒖텧 ?꾩뿉???섏젙??遺덇??ν빀?덈떎. ?쒖텧?섏떆寃좎뒿?덇퉴?')) return;

    const timeStart = container.querySelector('#prod-time-start').value || '';
    const timeEnd = container.querySelector('#prod-time-end').value || '';
    const plannedQuantity = parseInt(container.querySelector('#prod-planned').value) || 0;
    const total = parseInt(container.querySelector('#prod-total').value) || 0;
    const defect = parseInt(container.querySelector('#prod-defect').value) || 0;
    const defectDetails = {};
    container.querySelectorAll('.defect-input').forEach(inp => {
      const v = parseInt(inp.value) || 0;
      if (v > 0) defectDetails[inp.dataset.did] = v;
    });
    const hasDowntime = container.querySelector('#chk-has-downtime').checked;
    const downtimeReason = hasDowntime ? container.querySelector('#dt-reason').value : '';
    const downtimeLineNo = hasDowntime ? (container.querySelector('#dt-line-no').value || '') : '';
    const downtimeDuration = hasDowntime ? (parseInt(container.querySelector('#dt-duration').value) || 0) : 0;
    const downtimeNote = hasDowntime ? container.querySelector('#dt-note').value : '';
    const note = container.querySelector('#prod-note').value;

    const isClip = this.currentLog.processName?.includes('?대┰癒몄떊') || this.currentLog.processId?.includes('clip');
    let clipData = null;
    if (isClip) {
      const activeTab = container.querySelector('.clip-line-tab.active')?.dataset.cline || '1?멸린';
      clipData = {
        lineNo: activeTab,
        itemName: container.querySelector('#clip-single-item-sel')?.value || '',
        timeStart: container.querySelector('#clip-single-t-start')?.value || '',
        timeEnd: container.querySelector('#clip-single-t-end')?.value || '',
        lotInit: container.querySelector('#clip-single-lot-init')?.value || '',
        lotMid: container.querySelector('#clip-single-lot-mid')?.value || '',
        lotFin: container.querySelector('#clip-single-lot-fin')?.value || '',
        dimInitLen: container.querySelector('#dim-single-init-len')?.value || '',
        dimInitGap: container.querySelector('#dim-single-init-gap')?.value || '',
        dimMidLen: container.querySelector('#dim-single-mid-len')?.value || '',
        dimMidGap: container.querySelector('#dim-single-mid-gap')?.value || '',
        dimFinLen: container.querySelector('#dim-single-fin-len')?.value || '',
        dimFinGap: container.querySelector('#dim-single-fin-gap')?.value || '',
        lossJoin: parseInt(container.querySelector('#clip-single-loss-join')?.value) || 0,
        lossDefect: parseInt(container.querySelector('#clip-single-loss-defect')?.value) || 0,
        wasteType: container.querySelector('#clip-single-waste-type')?.value || '',
        wasteNote: container.querySelector('#clip-single-waste-type')?.value === '湲고?' ? (container.querySelector('#clip-single-waste-etc')?.value || '湲고?') : (container.querySelector('#clip-single-waste-type')?.value || ''),
        wasteTotal: parseInt(container.querySelector('#clip-single-waste-total')?.value) || 0
      };
    }

    const isPrep = this.currentLog.processName?.includes('?뚯옱以鍮?) || this.currentLog.processId?.includes('prep');
    let prepData = null;
    if (isPrep) {
      prepData = {};
      ['LH', 'RH'].forEach(side => {
        prepData[`${side}_lotInit`] = container.querySelector(`#prep-${side}-lot-init`)?.value || '';
        prepData[`${side}_lotMid`] = container.querySelector(`#prep-${side}-lot-mid`)?.value || '';
        prepData[`${side}_lotFin`] = container.querySelector(`#prep-${side}-lot-fin`)?.value || '';
        for (let i=1; i<=4; i++) {
          for (let j=1; j<=3; j++) {
            prepData[`${side}_dim_${i}_${j}`] = container.querySelector(`#prep-${side}-dim-${i}-${j}`)?.value || '';
          }
        }
        prepData[`${side}_def_ext_1`] = parseInt(container.querySelector(`#prep-${side}-def-ext-1`)?.value) || 0;
        prepData[`${side}_def_ext_2`] = parseInt(container.querySelector(`#prep-${side}-def-ext-2`)?.value) || 0;
        prepData[`${side}_def_ext_3`] = parseInt(container.querySelector(`#prep-${side}-def-ext-3`)?.value) || 0;
        prepData[`${side}_def_prc_1`] = parseInt(container.querySelector(`#prep-${side}-def-prc-1`)?.value) || 0;
        prepData[`${side}_def_prc_2`] = parseInt(container.querySelector(`#prep-${side}-def-prc-2`)?.value) || 0;
        prepData[`${side}_def_prc_3`] = parseInt(container.querySelector(`#prep-${side}-def-prc-3`)?.value) || 0;
        prepData[`${side}_def_total`] = parseInt(container.querySelector(`#prep-${side}-def-total`)?.value) || 0;
      });
      prepData.chkBlade = container.querySelector('#prep-chk-blade')?.checked || false;
    }

    let jointData = null;
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
    });
    store.updateLog(this.currentLog);
    if (clipData && clipData.wasteType) {
      store.recordClipWaste(clipData.wasteType);
    }
    this._populateLogUI(container);
    this._renderHistory(container);
    alert(status === 'SUBMITTED' ? '理쒖쥌 ?쒖텧 ?꾨즺!' : '以묎컙 ????꾨즺! ?몄젣???섏젙?섏떎 ???덉뒿?덈떎.');
  }

  _renderHistory(container) {
    const tbody = container.querySelector('#tbl-my-history');
    if (!this.workerName || !this.birthDate) {
      tbody.innerHTML = '<tr><td colspan="8" class="text-center" style="color:var(--text-muted);">?묒냽 ???대젰???쒖떆?⑸땲??</td></tr>';
      return;
    }

    const logs = store.getLogs().filter(l => l.workerName === this.workerName && l.birthDate === this.birthDate);
    if (!logs.length) {
      tbody.innerHTML = '<tr><td colspan="8" class="text-center" style="color:var(--text-muted);">?쒖텧???쇱? ?대젰???놁뒿?덈떎.</td></tr>';
      return;
    }

    tbody.innerHTML = logs.map(l => {
      const rate = l.totalQuantity > 0 ? ((l.defectQuantity / l.totalQuantity) * 100).toFixed(2) : '0.00';
      return `<tr>
        <td>${l.date}</td>
        <td><span class="badge ${MODEL_BADGE[l.modelName]||'badge-blue'}">${l.modelName}</span> ${l.partName} - ${l.processName}</td>
        <td>${l.totalQuantity.toLocaleString()}</td>
        <td style="color:var(--accent-rose);">${l.defectQuantity.toLocaleString()}</td>
        <td>${rate}%</td>
        <td>${l.hasDowntime ? '<span class="badge badge-rose">?슚以묐떒</span>' : '-'}</td>
        <td style="display:flex; align-items:center; gap:0.5rem;">
          ${l.status === 'SUBMITTED' ? '<span class="badge badge-emerald">?낆젣異?/span>' : '<span class="badge badge-amber">?랃툘?묒꽦以?/span>'}
          <button type="button" class="btn btn-outline btn-sm btn-delete-log" data-id="${l.id}" style="color:var(--accent-rose); border-color:transparent; padding:0.2rem; font-size:1rem;" title="??젣">
            <i class="ri-delete-bin-line"></i>
          </button>
        </td>
      </tr>`;
    }).join('');

    tbody.querySelectorAll('.btn-delete-log').forEach(btn => {
      btn.addEventListener('click', (e) => {
        if(confirm('?뺣쭚濡????묒뾽 ?쇱?瑜???젣?섏떆寃좎뒿?덇퉴?')) {
          const logId = e.currentTarget.dataset.id;
          store.deleteLog(logId);
          if (this.currentLog && this.currentLog.id === logId) {
            this.currentLog = null;
            this._goStep(container, 2);
          }
          this._renderHistory(container);
          this._updateFloatingLogsCount(container);
          alert('?쇱?媛 ??젣?섏뿀?듬땲??');
        }
      });
    });
  }

  _bindPopupEvents(container) {
    const floatBtn = container.querySelector('#btn-floating-logs');
    const overlay = container.querySelector('#log-popup-overlay');
    const closeBtn = container.querySelector('#btn-close-log-popup');
    const newLogBtn = container.querySelector('#btn-popup-new-log');

    floatBtn?.addEventListener('click', () => {
      this._renderTodayLogsList(container);
      overlay?.classList.add('active');
    });
    
    closeBtn?.addEventListener('click', () => {
      overlay?.classList.remove('active');
    });
    
    overlay?.addEventListener('click', (e) => {
      if (e.target === overlay) overlay.classList.remove('active');
    });
    
    newLogBtn?.addEventListener('click', () => {
      overlay?.classList.remove('active');
      this.currentLog = null; // reset to create a new one
      this._goStep(container, 2); // Go back to process selection
    });
  }

  _updateFloatingLogsCount(container) {
    const today = new Date().toISOString().split('T')[0];
    const logs = store.getLogs().filter(l => l.date === today && l.workerName === this.workerName && l.birthDate === this.birthDate);
    const countBadge = container.querySelector('#floating-logs-count');
    if (countBadge) countBadge.textContent = logs.length.toString();
  }

  _renderTodayLogsList(container) {
    const listEl = container.querySelector('#log-popup-list');
    if (!listEl) return;
    
    const today = new Date().toISOString().split('T')[0];
    const logs = store.getLogs().filter(l => l.date === today && l.workerName === this.workerName && l.birthDate === this.birthDate);
    
    if (logs.length === 0) {
      listEl.innerHTML = '<div style="color:var(--text-muted);text-align:center;padding:2rem;">?ㅻ뒛 ?묒꽦???쇱?媛 ?놁뒿?덈떎.</div>';
      return;
    }
    
    listEl.innerHTML = logs.map(l => {
      const isActive = this.currentLog && this.currentLog.id === l.id;
      const statusBadge = l.status === 'SUBMITTED' ? '<span class="badge badge-emerald" style="float:right;">?낆젣異쒕맖</span>' : '<span class="badge badge-amber" style="float:right;">?랃툘?묒꽦以?/span>';
      return `
        <div class="log-popup-item ${isActive ? 'active-item' : ''}" data-logid="${l.id}">
          <div style="font-weight:700;margin-bottom:0.25rem;">${l.modelName} - ${l.partName}</div>
          <div style="font-size:0.85rem;color:var(--text-secondary);">
            <i class="ri-git-merge-line"></i> ${l.processName}
            ${statusBadge}
          </div>
        </div>
      `;
    }).join('');
    
    listEl.querySelectorAll('.log-popup-item').forEach(item => {
      item.addEventListener('click', () => {
        const id = item.dataset.logid;
        const log = store.getLogs().find(l => l.id === id);
        if (log) {
          this.currentLog = log;
          container.querySelector('#w-mfg').value = 'mfg_stellantis';
          this._updateModels(container);
          container.querySelector('#w-model').value = log.modelId;
          this._updateParts(container);
          container.querySelector('#w-part').value = log.partId;
          this._updateProcs(container);
          container.querySelector('#w-proc').value = log.processId;
          
          container.querySelector('#log-popup-overlay').classList.remove('active');
          this._loadLog(container);
          this._goStep(container, 3);
        }
      });
    });
  }
}

class ManagerDashboard {
  constructor() {
    this.selDate = new Date().toISOString().split('T')[0];
    this.chartProd = null;
    this.chartDefect = null;
    this.sortCol = null;
    this.sortDesc = true;
  }

  render(container) {
    container.querySelector('#mgr-date').value = this.selDate;
    this._bindEvents(container);
    this.refresh(container);
  }

  refresh(container) {
    const filtered = this._getFiltered();
    this._renderKPI(container, filtered);
    this._renderCharts(container, filtered);
    this._renderProcessOverview(container);
    this._renderDowntimeTable(container);
    this._renderLogs(container);
    this._checkLineRepeatAlert();
  }

  _bindEvents(container) {
    container.querySelector('#mgr-date').addEventListener('change', e => { this.selDate = e.target.value; this.refresh(container); });
    container.querySelector('#mgr-filter-model').addEventListener('change', () => this.refresh(container));
    container.querySelector('#log-search').addEventListener('input', () => this._renderLogs(container));
    container.querySelector('#btn-csv').addEventListener('click', () => this._exportCSV());

    container.querySelectorAll('.sortable').forEach(th => {
      th.addEventListener('click', () => {
        const col = th.dataset.sort;
        if (this.sortCol === col) {
          if (!this.sortDesc) {
            this.sortDesc = true; // Ascending -> Descending
          } else {
            this.sortCol = null; // Descending -> Default
          }
        } else {
          this.sortCol = col;
          this.sortDesc = false; // New column -> Ascending
          this.sortDesc = false;
        }
        
        container.querySelectorAll('.sortable i').forEach(i => i.className = 'ri-arrow-up-down-line');
        container.querySelectorAll('.sortable').forEach(t => t.classList.remove('active'));
        if (this.sortCol) {
          th.classList.add('active');
          th.querySelector('i').className = this.sortDesc ? 'ri-arrow-down-line' : 'ri-arrow-up-line';
        }
        
        this.refresh(container);
      });
    });

    container.querySelector('#btn-qr-open').addEventListener('click', () => {
      this._populateQR();
      document.querySelector('#modal-qr-tool').classList.add('open');
    });

    container.querySelector('#btn-open-line-alert-manual')?.addEventListener('click', () => {
      const hasAlerts = this._checkLineRepeatAlert(true);
      if (!hasAlerts) {
        alert('?꾩옱 議곌굔(2???댁긽 以묐떒)???대떦?섎뒗 ?쇱씤 鍮꾩긽 ?뚮┝???놁뒿?덈떎.');
      }
    });

    document.querySelector('#btn-close-qr-modal').addEventListener('click', () => document.querySelector('#modal-qr-tool').classList.remove('open'));
    document.querySelector('#btn-close-proc-detail-modal').addEventListener('click', () => document.querySelector('#modal-process-detail-logs').classList.remove('open'));
    document.querySelector('#btn-close-proc-detail-modal-2').addEventListener('click', () => document.querySelector('#modal-process-detail-logs').classList.remove('open'));
  }

  _getFiltered() {
    return store.getLogs().filter(l => l.date === this.selDate);
  }

  _renderKPI(container, logs) {
    const totalLogs = logs.length;
    const totalProd = logs.reduce((a, b) => a + (b.totalQuantity || 0), 0);
    const totalDefect = logs.reduce((a, b) => a + (b.defectQuantity || 0), 0);
    const rate = totalProd > 0 ? ((totalDefect / totalProd) * 100).toFixed(2) : '0.00';
    const dtCount = logs.filter(l => l.hasDowntime).length;

    container.querySelector('#kpi-total-logs').textContent = totalLogs;
    container.querySelector('#kpi-total-prod').textContent = totalProd.toLocaleString();
    container.querySelector('#kpi-defect-rate').textContent = `${rate}%`;
    container.querySelector('#kpi-downtime-count').textContent = dtCount;
  }

  _renderCharts(container, logs) {
    const ctxProd = container.querySelector('#chart-prod').getContext('2d');
    const ctxDefect = container.querySelector('#chart-defect').getContext('2d');

    const procMap = {};
    logs.forEach(l => {
      const key = `${l.modelName} ${l.processName}`;
      procMap[key] = (procMap[key] || 0) + (l.totalQuantity || 0);
    });

    if (this.chartProd) this.chartProd.destroy();
    this.chartProd = new Chart(ctxProd, {
      type: 'bar',
      data: {
        labels: Object.keys(procMap).length ? Object.keys(procMap) : ['?곗씠???놁쓬'],
        datasets: [{ label: '珥??앹궛??, data: Object.values(procMap).length ? Object.values(procMap) : [0], backgroundColor: '#3b82f6', borderRadius: 4 }]
      },
      options: { responsive: true, maintainAspectRatio: false, plugins: { legend: { display: false } } }
    });

    const defectTypes = store.getDefectTypes();
    const defectMap = {};
    defectTypes.forEach(d => defectMap[d.name] = 0);
    logs.forEach(l => {
      if (l.defectDetails) {
        Object.entries(l.defectDetails).forEach(([did, qty]) => {
          const dt = defectTypes.find(x => x.id === did);
          if (dt) defectMap[dt.name] += qty;
        });
      }
    });

    if (this.chartDefect) this.chartDefect.destroy();
    this.chartDefect = new Chart(ctxDefect, {
      type: 'doughnut',
      data: {
        labels: Object.keys(defectMap),
        datasets: [{ data: Object.values(defectMap), backgroundColor: ['#ef4444', '#f59e0b', '#10b981', '#3b82f6', '#8b5cf6', '#ec4899'] }]
      },
      options: { responsive: true, maintainAspectRatio: false }
    });
  }

  _renderProcessOverview(container) {
    const logs = this._getFiltered();
    const selectedModel = container.querySelector('#mgr-filter-model').value;
    const hierarchy = store.getHierarchy();
    const rows = [];

    hierarchy[0].models.forEach(model => {
      if (selectedModel !== 'ALL' && model.name !== selectedModel) return;
      model.parts.forEach(part => {
        part.processes.forEach(proc => {
          const matched = logs.filter(l => l.processId === proc.id && l.modelId === model.id);
          const totalProd = matched.reduce((a, b) => a + (b.totalQuantity || 0), 0);
          const passQty = matched.reduce((a, b) => a + (b.passQuantity || 0), 0);
          const defectQty = matched.reduce((a, b) => a + (b.defectQuantity || 0), 0);
          const target = proc.target || 1000;
          const achieveRate = ((totalProd / target) * 100).toFixed(1);
          const defectRate = totalProd > 0 ? ((defectQty / totalProd) * 100).toFixed(2) : '0.00';
          const hasDt = matched.some(l => l.hasDowntime);

          rows.push({
            modelName: model.name, partName: part.name, procName: proc.name, procId: proc.id,
            target, totalProd, passQty, defectQty, achieveRate: parseFloat(achieveRate), defectRate: parseFloat(defectRate), hasDt, logCount: matched.length
          });
        });
      });
    });

    if (this.sortCol) {
      rows.sort((a, b) => {
        let valA = a[this.sortCol];
        let valB = b[this.sortCol];
        if (valA < valB) return this.sortDesc ? 1 : -1;
        if (valA > valB) return this.sortDesc ? -1 : 1;
        return 0;
      });
    }

    const tbody = container.querySelector('#tbl-mgr-processes');
    tbody.innerHTML = rows.map(r => `
      <tr>
        <td><span class="badge ${MODEL_BADGE[r.modelName]||'badge-blue'}">${r.modelName}</span> ${r.partName}</td>
        <td><strong>${r.procName}</strong></td>
        <td>${r.target.toLocaleString()}</td>
        <td style="font-weight:700;">${r.totalProd.toLocaleString()}</td>
        <td style="color:var(--accent-emerald);">${r.passQty.toLocaleString()}</td>
        <td style="color:var(--accent-rose);">${r.defectQty.toLocaleString()}</td>
        <td>${r.achieveRate}%</td>
        <td>${r.defectRate}%</td>
        <td>${r.hasDt ? '<span class="badge badge-rose">?슚以묐떒</span>' : '-'}</td>
        <td><button type="button" class="btn btn-outline btn-sm btn-open-proc-modal" data-pid="${r.procId}" data-mname="${r.modelName}" style="padding:0.25rem 0.5rem;font-size:0.75rem;"><i class="ri-search-eye-line"></i> ?곸꽭(${r.logCount})</button></td>
      </tr>
    `).join('');

    tbody.querySelectorAll('.btn-open-proc-modal').forEach(b => {
      b.onclick = (e) => {
        const pid = e.currentTarget.dataset.pid;
        const mname = e.currentTarget.dataset.mname;
        this._openProcModal(pid, mname);
      };
    });
  }

  _openProcModal(procId, modelName) {
    const logs = this._getFiltered().filter(l => l.processId === procId && l.modelName === modelName);
    document.querySelector('#proc-detail-title').innerHTML = `<i class="ri-file-search-line"></i> [${modelName}] 媛쒕퀎 ?쇱? ?곸꽭 議고쉶 (${logs.length}嫄?`;
    
    const tbody = document.querySelector('#tbl-proc-detail-logs-body');
    if (!logs.length) {
      tbody.innerHTML = '<tr><td colspan="8" class="text-center" style="color:var(--text-muted);">?대떦 怨듭젙???쒖텧??媛쒕퀎 ?쇱?媛 ?놁뒿?덈떎.</td></tr>';
    } else {
      tbody.innerHTML = logs.map(l => {
        const rate = l.totalQuantity > 0 ? ((l.defectQuantity / l.totalQuantity) * 100).toFixed(2) : '0.00';
        let detailHtml = '-';
        if (l.clipData) {
          const cd = l.clipData;
          detailHtml = `
            <div style="font-size:0.78rem;line-height:1.4;">
              <span class="badge badge-purple">${cd.lineNo||'1?멸린'}</span> <strong>${cd.itemName||'-'}</strong> (${cd.timeStart||''}~${cd.timeEnd||''})<br/>
              LOT: 珥덈Ъ(${cd.lotInit||'-'}) / 以묐Ъ(${cd.lotMid||'-'}) / 醫낅Ъ(${cd.lotFin||'-'})<br/>
              ?꾩옣: 珥덈Ъ(${cd.dimInitLen||'-'}) 以묐Ъ(${cd.dimMidLen||'-'}) 醫낅Ъ(${cd.dimFinLen||'-'})<br/>
              媛꾧꺽: 珥덈Ъ(${cd.dimInitGap||'-'}) 以묐Ъ(${cd.dimMidGap||'-'}) 醫낅Ъ(${cd.dimFinGap||'-'})<br/>
              LOSS: ?곌껐(${cd.lossJoin||0}) 遺덈웾(${cd.lossDefect||0}) ?먭린(${cd.wasteTotal||0}EA: ${cd.wasteNote||'-'})
            </div>
          `;
        }
        
        let dtHtml = '';
        if (l.downtimeEntries && l.downtimeEntries.length) {
          dtHtml = l.downtimeEntries.map((e, idx) => `
            <div style="color:var(--accent-rose);font-size:0.75rem;margin-top:0.2rem;">
              ?슚 ${idx+1}?뚯감: [${e.lineNo||'1?멸린'}] ${e.reason} (${e.duration}遺? - ${e.note||'-'}
            </div>
          `).join('');
        } else if (l.hasDowntime) {
          dtHtml = `<div style="color:var(--accent-rose);font-size:0.75rem;">?슚 [${l.downtimeLineNo||'1?멸린'}] ${l.downtimeReason} (${l.downtimeDuration}遺?</div>`;
        }

        return `
          <tr>
            <td>${l.date}</td>
            <td><strong>${l.workerName}</strong><br/><span style="font-size:0.75rem;color:var(--text-muted);">(${l.birthDate})</span></td>
            <td>珥?${l.totalQuantity.toLocaleString()} / ?묓뭹 ${l.passQuantity.toLocaleString()}</td>
            <td><strong style="color:var(--accent-rose);">${l.defectQuantity.toLocaleString()}</strong> (${rate}%)</td>
            <td>${detailHtml}${dtHtml}</td>
            <td>${l.note || '-'}</td>
            <td><button type="button" class="btn btn-outline btn-sm btn-delete-log" data-id="${l.id}" style="color:var(--accent-rose);border-color:var(--accent-rose);padding:0.2rem 0.5rem;font-size:0.75rem;"><i class="ri-delete-bin-line"></i></button></td>
        <td>${l.status === 'SUBMITTED' ? '<span class="badge badge-emerald">?낆젣異?/span>' : '<span class="badge badge-amber">?랃툘?묒꽦以?/span>'}</td>
          </tr>
        `;
      }).join('');
    }

    document.querySelector('#modal-process-detail-logs').classList.add('open');
  }

  _renderDowntimeTable(container) {
    const logs = this._getFiltered().filter(l => l.hasDowntime);
    container.querySelector('#downtime-count-badge').textContent = `${logs.length} 嫄?;
    const tbody = container.querySelector('#tbl-downtime');

    if (!logs.length) {
      tbody.innerHTML = '<tr><td colspan="8" class="text-center" style="color:var(--text-muted);">?ㅻ뒛 諛쒖깮???앹궛 以묐떒 ?좉퀬媛 ?놁뒿?덈떎. (?뺤긽 媛??以?</td></tr>';
      return;
    }

    tbody.innerHTML = logs.map(l => {
      if (l.downtimeEntries && l.downtimeEntries.length) {
        return l.downtimeEntries.map((e, idx) => `
          <tr>
            <td>${l.date}</td>
            <td><strong>${l.workerName}</strong></td>
            <td><span class="badge ${MODEL_BADGE[l.modelName]||'badge-blue'}">${l.modelName}</span> ${l.processName}</td>
            <td><span class="badge badge-purple">${e.lineNo||'1?멸린'}</span> (${idx+1}?뚯감)</td>
            <td><span class="badge ${e.duration>=10?'badge-rose':'badge-amber'}">${e.duration||0}遺?/span></td>
            <td><strong style="color:var(--accent-rose);">${e.reason}</strong></td>
            <td style="font-size:0.8rem;">${e.note||'-'}</td>
          </tr>
        `).join('');
      } else {
        return `
          <tr>
            <td>${l.date}</td>
            <td><strong>${l.workerName}</strong></td>
            <td><span class="badge ${MODEL_BADGE[l.modelName]||'badge-blue'}">${l.modelName}</span> ${l.processName}</td>
            <td><span class="badge badge-purple">${l.downtimeLineNo||'1?멸린'}</span></td>
            <td><span class="badge ${l.downtimeDuration>=10?'badge-rose':'badge-amber'}">${l.downtimeDuration||0}遺?/span></td>
            <td><strong style="color:var(--accent-rose);">${l.downtimeReason}</strong></td>
            <td style="font-size:0.8rem;">${l.downtimeNote||'-'}</td>
          </tr>
        `;
      }
    }).join('');
  }

  _renderLogs(container) {
    const q = (container.querySelector('#log-search').value || '').toLowerCase();
    const logs = store.getLogs().filter(l => !q || l.workerName?.toLowerCase().includes(q) || l.processName?.toLowerCase().includes(q) || l.modelName?.toLowerCase().includes(q));
    container.querySelector('#tbl-logs').innerHTML = logs.slice(0, 25).map(l => {
      const rate = l.totalQuantity > 0 ? ((l.defectQuantity / l.totalQuantity) * 100).toFixed(2) : '0.00';
      return `<tr>
        <td>${l.date}</td>
        <td><strong>${l.workerName}</strong> <span style="font-size:0.75rem;color:var(--text-muted);">(${l.birthDate||''})</span></td>
        <td><span class="badge ${MODEL_BADGE[l.modelName]||'badge-blue'}">${l.modelName}</span> ${l.processName}</td>
        <td>${l.clockInTime ? new Date(l.clockInTime).toLocaleTimeString('ko-KR') : '-'}</td>
        <td style="font-weight:700;">${(l.totalQuantity||0).toLocaleString()}</td>
        <td style="color:var(--accent-rose);">${(l.defectQuantity||0).toLocaleString()}</td>
        <td>${rate}%</td>
        <td>${l.hasDowntime ? '<span class="badge badge-rose">?슚以묐떒</span>' : '-'}</td>
        <td>${l.status==='SUBMITTED' ? '<span class="badge badge-emerald">?낆젣異?/span>' : '<span class="badge badge-amber">?랃툘?묒꽦以?/span>'}</td>
      </tr>`;
    }).join('');
  }

  _checkLineRepeatAlert(forceManual = false) {
    if (!document.querySelector('#view-manager').classList.contains('active')) return false;

    const logs = store.getLogs();
    const today = new Date().toISOString().split('T')[0];
    const dtLogs = logs.filter(l => l.date === today && l.hasDowntime);
    if (!dtLogs.length) return false;

    const lineMap = {};
    dtLogs.forEach(l => {
      const entries = (l.downtimeEntries && l.downtimeEntries.length) ? l.downtimeEntries : [
        { lineNo: l.downtimeLineNo || '1?멸린', duration: l.downtimeDuration || 0, reason: l.downtimeReason || '以묐떒 諛쒖깮', note: l.downtimeNote || '' }
      ];
      entries.forEach(e => {
        const lineKey = e.lineNo || '1?멸린';
        const key = `${l.modelName || 'DT CREW'}|${l.partName || 'D/SIDE'}|${l.processName || '?대┰癒몄떊'}|${lineKey}`;
        if (!lineMap[key]) {
          lineMap[key] = {
            model: l.modelName || 'DT CREW',
            part: l.partName || 'D/SIDE',
            proc: l.processName || '?대┰癒몄떊',
            line: lineKey,
            count: 0,
            items: []
          };
        }
        lineMap[key].count++;
        lineMap[key].items.push(e);
      });
    });

    let dismissedAlerts = {};
    try {
      dismissedAlerts = JSON.parse(_safeStorage.getItem('dismissedAlerts') || '{}');
    } catch(e) {
      dismissedAlerts = {};
    }
    
    const alertLines = Object.values(lineMap).filter(m => {
      if (m.count < 2) return false;
      if (forceManual) return true; // Show even if dismissed when manually triggered
      const ackKey = `${today}_${m.model}_${m.part}_${m.proc}_${m.line}_${m.count}`;
      return !dismissedAlerts[ackKey];
    });

    if (!alertLines.length) return false;
    const target = alertLines[0];

    const pop = document.querySelector('#modal-line-alert-popup');
    if (pop) {
      document.querySelector('#alert-pop-model').textContent = target.model;
      document.querySelector('#alert-pop-part').textContent = target.part;
      document.querySelector('#alert-pop-proc').textContent = target.proc;
      document.querySelector('#alert-pop-line').textContent = target.line;
      document.querySelector('#alert-pop-count').textContent = target.count;

      document.querySelector('#alert-pop-history-list').innerHTML = target.items.map((it, idx) => `
        <div style="padding:0.35rem 0;border-bottom:1px dashed #e2e8f0;color:#1e293b;">
          <strong>${idx + 1}?뚯감:</strong> <span class="badge badge-rose">${it.reason || '以묐떒'}</span> (${it.duration}遺? - <span style="color:#475569;">${it.note || '?몃??댁슜 ?놁쓬'}</span>
        </div>
      `).join('');

      pop.classList.add('open');

      const closeAction = () => pop.classList.remove('open');
      const closeBtn = document.querySelector('#btn-close-line-alert-modal');
      const resolveBtn = document.querySelector('#btn-resolve-line-alert');
      if (closeBtn) closeBtn.onclick = closeAction;
      if (resolveBtn) resolveBtn.onclick = () => {
        const ackKey = `${today}_${target.model}_${target.part}_${target.proc}_${target.line}_${target.count}`;
        dismissedAlerts[ackKey] = true;
        _safeStorage.setItem('dismissedAlerts', JSON.stringify(dismissedAlerts));
        closeAction();
        if (!forceManual) {
          setTimeout(() => this._checkLineRepeatAlert(), 300);
        }
      };
    }
    return true;
  }

  _populateQR() {
    const box = document.querySelector('#qr-code-img-box');
    const urlText = document.querySelector('#qr-code-url-text');
    const currentUrl = window.location.href;
    urlText.textContent = currentUrl;
    box.innerHTML = `<img src="https://api.qrserver.com/v1/create-qr-code/?size=180x180&data=${encodeURIComponent(currentUrl)}" alt="QR Code" style="width:180px;height:180px;display:block;" />`;
  }

  _exportCSV() {
    let csv = "\\uFEFF?쇱옄,?묒뾽???앸뀈?붿씪,李⑥쥌,遺??怨듭젙,洹쇰Т?쒖옉,珥앹깮?곕웾,?묓뭹,遺덈웾,遺덈웾瑜?以묐떒?щ?,以묐떒?먯씤,?뱀씠?ы빆,?곹깭\\n";
    store.getLogs().forEach(l => {
      const rate = l.totalQuantity > 0 ? ((l.defectQuantity / l.totalQuantity) * 100).toFixed(2) : '0.00';
      csv += `"${l.date}","${l.workerName}","${l.birthDate||''}","${l.modelName}","${l.partName}","${l.processName}","${l.clockInTime||''}","${l.totalQuantity}","${l.passQuantity}","${l.defectQuantity}","${rate}%","${l.hasDowntime?'Y':'N'}","${l.downtimeReason||''}","${l.note||''}","${l.status}"\\n`;
    });
    const blob = new Blob([csv], { type: 'text/csv;charset=utf-8;' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = `?ㅽ뀛??곗뒪_?앹궛?쇱?_${new Date().toISOString().split('T')[0]}.csv`;
    a.click();
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const workerMgr = new WorkerManager();
  const mgrDash = new ManagerDashboard();

  const workerSection = document.querySelector('#view-worker');
  const mgrSection = document.querySelector('#view-manager');
  const btnWorker = document.querySelector('#btn-mode-worker');
  const btnMgr = document.querySelector('#btn-mode-manager');

  workerMgr.render(workerSection);
  mgrDash.render(mgrSection);

  const switchMode = (mode) => {
    if (mode === 'WORKER') {
      workerSection.classList.add('active');
      mgrSection.classList.remove('active');
      btnWorker.classList.add('active');
      btnMgr.classList.remove('active');
    } else {
      mgrSection.classList.add('active');
      workerSection.classList.remove('active');
      btnMgr.classList.add('active');
      btnWorker.classList.remove('active');
      mgrDash.refresh(mgrSection);
    }
  };

  btnWorker.addEventListener('click', () => switchMode('WORKER'));
  
  const mgrLoginModal = document.querySelector('#modal-mgr-login');
  const mgrLoginInput = document.querySelector('#mgr-login-pw');
  
  btnMgr.addEventListener('click', () => {
    mgrLoginInput.value = '';
    mgrLoginModal.classList.add('open');
    mgrLoginInput.focus();
  });
  
  document.querySelector('#btn-close-mgr-login').addEventListener('click', () => {
    mgrLoginModal.classList.remove('open');
  });
  
  const submitMgrLogin = () => {
    const pw = mgrLoginInput.value;
    if (pw === '12345604' || pw === '1234') {
      mgrLoginModal.classList.remove('open');
      switchMode('MANAGER');
    } else {
      alert('鍮꾨?踰덊샇媛 ?щ컮瑜댁? ?딆뒿?덈떎.');
    }
  };
  
  document.querySelector('#btn-submit-mgr-login').addEventListener('click', submitMgrLogin);
  mgrLoginInput.addEventListener('keyup', (e) => {
    if (e.key === 'Enter') submitMgrLogin();
  });

  store.subscribe(() => {
    if (mgrSection.classList.contains('active')) {
      mgrDash.refresh(mgrSection);
    }
  });
});
  
