$filePath = Join-Path $PSScriptRoot "index.html"
$html = [System.IO.File]::ReadAllText($filePath, [System.Text.Encoding]::UTF8)

$methodCode = @'

  _initJointCard(container, proc) {
    const jointCard = container.querySelector('#joint-spec-card');
    if (!jointCard) return;

    // 1) Update Mold Machine labels dynamically when selection changes
    const updateMoldLabels = () => {
      const m1 = container.querySelector('#joint-m1-no')?.value || '1호기';
      const m2 = container.querySelector('#joint-m2-no')?.value || '2호기';
      const m3 = container.querySelector('#joint-m3-no')?.value || '3호기';

      const l1 = container.querySelector('#joint-lbl-m1');
      const l2 = container.querySelector('#joint-lbl-m2');
      const l3 = container.querySelector('#joint-lbl-m3');

      if (l1) l1.textContent = "#1 (" + m1 + ")";
      if (l2) l2.textContent = "#2 (" + m2 + ")";
      if (l3) l3.textContent = "#3 (" + m3 + ")";
    };

    ['#joint-m1-no', '#joint-m2-no', '#joint-m3-no'].forEach(selId => {
      const sel = container.querySelector(selId);
      if (sel) sel.onchange = updateMoldLabels;
    });
    updateMoldLabels();

    // 2) Validation for Temp (201 +- 10 : 191 ~ 211) & Sec (90 +- 10 : 80 ~ 100)
    container.querySelectorAll('.joint-temp').forEach(inp => {
      inp.oninput = () => {
        const val = parseFloat(inp.value);
        if (isNaN(val)) {
          inp.style.border = '1px solid var(--border-color)';
          inp.style.color = 'var(--text-main)';
        } else if (val < 191 || val > 211) {
          inp.style.border = '2px solid var(--accent-rose)';
          inp.style.color = 'var(--accent-rose)';
        } else {
          inp.style.border = '1px solid var(--accent-emerald)';
          inp.style.color = 'var(--accent-emerald)';
        }
      };
    });

    container.querySelectorAll('.joint-time').forEach(inp => {
      inp.oninput = () => {
        const val = parseFloat(inp.value);
        if (isNaN(val)) {
          inp.style.border = '1px solid var(--border-color)';
          inp.style.color = 'var(--text-main)';
        } else if (val < 80 || val > 100) {
          inp.style.border = '2px solid var(--accent-rose)';
          inp.style.color = 'var(--accent-rose)';
        } else {
          inp.style.border = '1px solid var(--accent-emerald)';
          inp.style.color = 'var(--accent-emerald)';
        }
      };
    });

    // 3) Render Defect Matrix (10 Defect Types)
    const defectTypes = [
      '떨어짐/찢어짐', '양 부족', '밀림/크랙', '기포', '씹힘/삽입불량',
      '넘침/오버랩', '후변형', '이물질', '꼬임', '기타'
    ];

    const tbody = container.querySelector('#joint-defect-matrix-body');
    if (tbody && tbody.children.length === 0) {
      tbody.innerHTML = defectTypes.map((type, idx) => 
        '<tr>' +
          '<td style="font-weight:700;">' + (idx + 1) + '. ' + type + '</td>' +
          '<td><input type="number" min="0" value="0" class="form-control joint-def-input joint-def-a" data-type="' + type + '" data-cat="A" /></td>' +
          '<td><input type="number" min="0" value="0" class="form-control joint-def-input joint-def-b" data-type="' + type + '" data-cat="B" /></td>' +
          '<td><input type="number" min="0" value="0" class="form-control joint-def-input joint-def-c" data-type="' + type + '" data-cat="C" /></td>' +
          '<td style="font-weight:700;color:var(--accent-rose);" class="joint-def-row-subtotal">0</td>' +
        '</tr>'
      ).join('');

      const calcDefectTotals = () => {
        let grandTotal = 0;
        tbody.querySelectorAll('tr').forEach(tr => {
          let rowTot = 0;
          tr.querySelectorAll('.joint-def-input').forEach(inp => {
            rowTot += parseInt(inp.value) || 0;
          });
          tr.querySelector('.joint-def-row-subtotal').textContent = rowTot;
          grandTotal += rowTot;
        });
        const gTotalEl = container.querySelector('#joint-defect-grand-total');
        if (gTotalEl) gTotalEl.value = grandTotal;
      };

      tbody.querySelectorAll('.joint-def-input').forEach(inp => {
        inp.oninput = calcDefectTotals;
      });
    }

    // 4) Activity duration calculation
    const startInp = container.querySelector('#joint-act-start');
    const endInp = container.querySelector('#joint-act-end');
    const minInp = container.querySelector('#joint-act-min');
    const addBtn = container.querySelector('#btn-add-joint-act');
    const actList = container.querySelector('#joint-act-list');

    const calcDuration = () => {
      if (!startInp.value || !endInp.value) {
        if (minInp) minInp.value = '';
        return;
      }
      const [sH, sM] = startInp.value.split(':').map(Number);
      const [eH, eM] = endInp.value.split(':').map(Number);
      let diff = (eH * 60 + eM) - (sH * 60 + sM);
      if (diff < 0) diff += 1440; // overnight
      if (minInp) minInp.value = diff;
    };

    if (startInp) startInp.onchange = calcDuration;
    if (endInp) endInp.onchange = calcDuration;

    if (addBtn && actList) {
      const loggedActs = [];
      addBtn.onclick = () => {
        const type = container.querySelector('#joint-act-type').value;
        const dur = minInp.value;
        if (!dur || dur <= 0) {
          alert("시작 시각과 종료 시각을 정확히 지정해 주세요.");
          return;
        }
        loggedActs.push(type + " (" + startInp.value + " ~ " + endInp.value + ", " + dur + "분)");
        actList.innerHTML = loggedActs.map(item => '<span class="badge badge-rose mr-1 mb-1" style="display:inline-block;padding:0.3rem 0.6rem;">' + item + '</span>').join(' ');
      };
    }
  }
'@

if (-not $html.Contains("_initJointCard(container, proc)")) {
    $marker = @"
    container.querySelectorAll('.prep-LH-def').forEach(inp => inp.addEventListener('input', () => calcPrepDef('LH')));
    container.querySelectorAll('.prep-RH-def').forEach(inp => inp.addEventListener('input', () => calcPrepDef('RH')));
  }
"@
    if ($html.Contains($marker)) {
        $html = $html.Replace($marker, $marker + "`n" + $methodCode)
        [System.IO.File]::WriteAllText($filePath, $html, [System.Text.Encoding]::UTF8)
        Write-Host "_initJointCard method appended successfully."
    } else {
        Write-Host "Marker string not found in index.html"
    }
} else {
    Write-Host "_initJointCard method already present in index.html."
}
