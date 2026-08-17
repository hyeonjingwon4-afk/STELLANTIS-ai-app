$filePath = "c:\Users\KwonHyeonjin\Documents\스텔란티스 ai 앱파일\index.html"
$html = [System.IO.File]::ReadAllText($filePath, [System.Text.Encoding]::UTF8)

# 1. Joint Spec Card HTML
$jointCardHTML = @'
            <div id="joint-spec-card" class="card mb-3" style="display:none;">
              <div class="card-header" style="background: linear-gradient(135deg, rgba(239,68,68,0.12), rgba(245,158,11,0.12));">
                <div class="card-title" style="color:var(--accent-rose);"><i class="ri-tools-fill"></i> 조인트 공정 작업일보 (FR/RR RH/LH & 1인 3대 금형기)</div>
                <span class="badge badge-rose">가류온도 201±10℃ / 가류시간 90±10초</span>
              </div>
              <div class="card-body" style="padding:1rem;">
                <!-- 1. 기본 설정 및 금형 호기 선택 (1인 최대 3대 동시 선택) -->
                <div class="clip-sub-card">
                  <label class="form-label mb-2" style="font-weight:700;color:var(--accent-rose);">📍 ① 부위 선택 & 1인 3대 금형 호기 설정 (1호기~6호기 중 선택)</label>
                  <div class="grid-2 mb-2">
                    <div>
                      <label class="form-label" style="font-size:0.8rem;">작업 대상 부위</label>
                      <select class="form-select" id="joint-part-side">
                        <option value="FR RH">FR RH</option>
                        <option value="FR LH">FR LH</option>
                        <option value="RR RH">RR RH</option>
                        <option value="RR LH">RR LH</option>
                      </select>
                    </div>
                    <div>
                      <label class="form-label" style="font-size:0.8rem;">작업 시간 (시작 ~ 종료)</label>
                      <div style="display:flex;gap:0.25rem;">
                        <input type="time" class="form-control" id="joint-work-start" />
                        <span style="align-self:center;">~</span>
                        <input type="time" class="form-control" id="joint-work-end" />
                      </div>
                    </div>
                  </div>

                  <!-- 3대 금형 호기 지정 카드 -->
                  <div style="display:grid;grid-template-columns:repeat(auto-fit,minmax(220px,1fr));gap:0.75rem;margin-top:0.75rem;">
                    <!-- 금형기 1 -->
                    <div style="background:var(--surface);padding:0.75rem;border-radius:10px;border:1px solid var(--border-color);">
                      <strong style="color:var(--accent-cyan);font-size:0.85rem;display:block;margin-bottom:0.4rem;">금형기 #1</strong>
                      <div class="form-group mb-1">
                        <label class="form-label" style="font-size:0.75rem;">금형 호기 (1~6호기)</label>
                        <select class="form-select joint-mould-num" id="joint-m1-no" style="font-size:0.8rem;">
                          <option value="1호기">1호기</option>
                          <option value="2호기">2호기</option>
                          <option value="3호기">3호기</option>
                          <option value="4호기">4호기</option>
                          <option value="5호기">5호기</option>
                          <option value="6호기">6호기</option>
                        </select>
                      </div>
                      <div class="form-group mb-1">
                        <label class="form-label" style="font-size:0.75rem;">부위 분류</label>
                        <select class="form-select" id="joint-m1-pos" style="font-size:0.8rem;">
                          <option value="직각">직각</option>
                          <option value="둔각">둔각</option>
                          <option value="직선">직선</option>
                          <option value="엔드">엔드</option>
                        </select>
                      </div>
                      <div class="form-group">
                        <label class="form-label" style="font-size:0.75rem;">금형 No. 상세</label>
                        <input type="text" class="form-control" id="joint-m1-code" placeholder="예: M-01" style="font-size:0.8rem;" />
                      </div>
                    </div>

                    <!-- 금형기 2 -->
                    <div style="background:var(--surface);padding:0.75rem;border-radius:10px;border:1px solid var(--border-color);">
                      <strong style="color:var(--accent-cyan);font-size:0.85rem;display:block;margin-bottom:0.4rem;">금형기 #2</strong>
                      <div class="form-group mb-1">
                        <label class="form-label" style="font-size:0.75rem;">금형 호기 (1~6호기)</label>
                        <select class="form-select joint-mould-num" id="joint-m2-no" style="font-size:0.8rem;">
                          <option value="2호기" selected>2호기</option>
                          <option value="1호기">1호기</option>
                          <option value="3호기">3호기</option>
                          <option value="4호기">4호기</option>
                          <option value="5호기">5호기</option>
                          <option value="6호기">6호기</option>
                        </select>
                      </div>
                      <div class="form-group mb-1">
                        <label class="form-label" style="font-size:0.75rem;">부위 분류</label>
                        <select class="form-select" id="joint-m2-pos" style="font-size:0.8rem;">
                          <option value="둔각">둔각</option>
                          <option value="직각">직각</option>
                          <option value="직선">직선</option>
                          <option value="엔드">엔드</option>
                        </select>
                      </div>
                      <div class="form-group">
                        <label class="form-label" style="font-size:0.75rem;">금형 No. 상세</label>
                        <input type="text" class="form-control" id="joint-m2-code" placeholder="예: M-02" style="font-size:0.8rem;" />
                      </div>
                    </div>

                    <!-- 금형기 3 -->
                    <div style="background:var(--surface);padding:0.75rem;border-radius:10px;border:1px solid var(--border-color);">
                      <strong style="color:var(--accent-cyan);font-size:0.85rem;display:block;margin-bottom:0.4rem;">금형기 #3</strong>
                      <div class="form-group mb-1">
                        <label class="form-label" style="font-size:0.75rem;">금형 호기 (1~6호기)</label>
                        <select class="form-select joint-mould-num" id="joint-m3-no" style="font-size:0.8rem;">
                          <option value="3호기" selected>3호기</option>
                          <option value="1호기">1호기</option>
                          <option value="2호기">2호기</option>
                          <option value="4호기">4호기</option>
                          <option value="5호기">5호기</option>
                          <option value="6호기">6호기</option>
                        </select>
                      </div>
                      <div class="form-group mb-1">
                        <label class="form-label" style="font-size:0.75rem;">부위 분류</label>
                        <select class="form-select" id="joint-m3-pos" style="font-size:0.8rem;">
                          <option value="직선">직선</option>
                          <option value="직각">직각</option>
                          <option value="둔각">둔각</option>
                          <option value="엔드">엔드</option>
                        </select>
                      </div>
                      <div class="form-group">
                        <label class="form-label" style="font-size:0.75rem;">금형 No. 상세</label>
                        <input type="text" class="form-control" id="joint-m3-code" placeholder="예: M-03" style="font-size:0.8rem;" />
                      </div>
                    </div>
                  </div>
                </div>

                <!-- 2. 압출소재 / 부자재 / 고무 LOT 관리 -->
                <div class="clip-sub-card">
                  <label class="form-label mb-2" style="font-weight:700;color:var(--accent-cyan);">📦 ② 압출소재, 부자재 & 고무 LOT No.</label>
                  
                  <div style="font-size:0.8rem;font-weight:700;margin-bottom:0.4rem;color:var(--accent-amber);">1) 압출소재 LOT (A LH / B LH / C LH)</div>
                  <div class="table-responsive mb-2">
                    <table class="data-table" style="font-size:0.8rem;">
                      <thead>
                        <tr><th>소재 구분</th><th>초물 LOT</th><th>중물 LOT</th><th>종물 LOT</th></tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td style="font-weight:700;">A LH</td>
                          <td><input type="text" class="form-control" id="joint-lot-a-init" placeholder="A LH 초물" /></td>
                          <td><input type="text" class="form-control" id="joint-lot-a-mid" placeholder="A LH 중물" /></td>
                          <td><input type="text" class="form-control" id="joint-lot-a-fin" placeholder="A LH 종물" /></td>
                        </tr>
                        <tr>
                          <td style="font-weight:700;">B LH</td>
                          <td><input type="text" class="form-control" id="joint-lot-b-init" placeholder="B LH 초물" /></td>
                          <td><input type="text" class="form-control" id="joint-lot-b-mid" placeholder="B LH 중물" /></td>
                          <td><input type="text" class="form-control" id="joint-lot-b-fin" placeholder="B LH 종물" /></td>
                        </tr>
                        <tr>
                          <td style="font-weight:700;">C LH</td>
                          <td><input type="text" class="form-control" id="joint-lot-c-init" placeholder="C LH 초물" /></td>
                          <td><input type="text" class="form-control" id="joint-lot-c-mid" placeholder="C LH 중물" /></td>
                          <td><input type="text" class="form-control" id="joint-lot-c-fin" placeholder="C LH 종물" /></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>

                  <div class="grid-2 mb-2">
                    <div>
                      <div style="font-size:0.8rem;font-weight:700;margin-bottom:0.4rem;color:var(--accent-amber);">2) 부자재 LOT (DT CREW / DT QUAD)</div>
                      <div class="grid-2" style="gap:0.25rem;">
                        <div><label class="form-label" style="font-size:0.75rem;">직각 RH LOT</label><input type="text" class="form-control" id="joint-sub-rh" /></div>
                        <div><label class="form-label" style="font-size:0.75rem;">직각 LH LOT</label><input type="text" class="form-control" id="joint-sub-lh" /></div>
                        <div><label class="form-label" style="font-size:0.75rem;">둔각 RH LOT (QUAD)</label><input type="text" class="form-control" id="joint-sub-quad-rh" /></div>
                        <div><label class="form-label" style="font-size:0.75rem;">둔각 LH LOT (QUAD)</label><input type="text" class="form-control" id="joint-sub-quad-lh" /></div>
                      </div>
                    </div>
                    <div>
                      <div style="font-size:0.8rem;font-weight:700;margin-bottom:0.4rem;color:var(--accent-amber);">3) 고무명 & 규격</div>
                      <div style="background:var(--surface);padding:0.5rem;border-radius:8px;border:1px solid var(--border-color);">
                        <div style="font-size:0.85rem;font-weight:800;color:var(--accent-emerald);">고무 규격: 60664$OS</div>
                        <div style="margin-top:0.4rem;">
                          <label class="form-label" style="font-size:0.75rem;">고무 LOT No.</label>
                          <input type="text" class="form-control" id="joint-rubber-lot" placeholder="고무 LOT 번호 기입" />
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <!-- 3. 가류 조건 점검 (온도 201±10℃ / 시간 90±10초) -->
                <div class="clip-sub-card">
                  <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:0.5rem;">
                    <label class="form-label mb-0" style="font-weight:700;color:var(--accent-purple);">🔥 ③ 가류 조건 측정 (온도 201±10℃ / 시간 90±10초)</label>
                    <span class="badge badge-purple" style="font-size:0.75rem;">자동 오차 검증</span>
                  </div>
                  <div class="table-responsive">
                    <table class="data-table" style="font-size:0.8rem;">
                      <thead>
                        <tr>
                          <th rowspan="2">금형기</th>
                          <th colspan="2">초물 가류온도 (℃)</th>
                          <th>초물시간</th>
                          <th colspan="2">중물 가류온도 (℃)</th>
                          <th>중물시간</th>
                          <th colspan="2">종물 가류온도 (℃)</th>
                          <th>종물시간</th>
                        </tr>
                        <tr>
                          <th>상</th><th>하</th><th>(초)</th>
                          <th>상</th><th>하</th><th>(초)</th>
                          <th>상</th><th>하</th><th>(초)</th>
                        </tr>
                      </thead>
                      <tbody>
                        <!-- M1 -->
                        <tr>
                          <td style="font-weight:700;" id="joint-lbl-m1">#1 (1호기)</td>
                          <td><input type="number" class="form-control joint-temp" id="joint-m1-t1-top" placeholder="201" /></td>
                          <td><input type="number" class="form-control joint-temp" id="joint-m1-t1-bot" placeholder="201" /></td>
                          <td><input type="number" class="form-control joint-time" id="joint-m1-sec-1" placeholder="90" /></td>
                          <td><input type="number" class="form-control joint-temp" id="joint-m1-t2-top" placeholder="201" /></td>
                          <td><input type="number" class="form-control joint-temp" id="joint-m1-t2-bot" placeholder="201" /></td>
                          <td><input type="number" class="form-control joint-time" id="joint-m1-sec-2" placeholder="90" /></td>
                          <td><input type="number" class="form-control joint-temp" id="joint-m1-t3-top" placeholder="201" /></td>
                          <td><input type="number" class="form-control joint-temp" id="joint-m1-t3-bot" placeholder="201" /></td>
                          <td><input type="number" class="form-control joint-time" id="joint-m1-sec-3" placeholder="90" /></td>
                        </tr>
                        <!-- M2 -->
                        <tr>
                          <td style="font-weight:700;" id="joint-lbl-m2">#2 (2호기)</td>
                          <td><input type="number" class="form-control joint-temp" id="joint-m2-t1-top" placeholder="201" /></td>
                          <td><input type="number" class="form-control joint-temp" id="joint-m2-t1-bot" placeholder="201" /></td>
                          <td><input type="number" class="form-control joint-time" id="joint-m2-sec-1" placeholder="90" /></td>
                          <td><input type="number" class="form-control joint-temp" id="joint-m2-t2-top" placeholder="201" /></td>
                          <td><input type="number" class="form-control joint-temp" id="joint-m2-t2-bot" placeholder="201" /></td>
                          <td><input type="number" class="form-control joint-time" id="joint-m2-sec-2" placeholder="90" /></td>
                          <td><input type="number" class="form-control joint-temp" id="joint-m2-t3-top" placeholder="201" /></td>
                          <td><input type="number" class="form-control joint-temp" id="joint-m2-t3-bot" placeholder="201" /></td>
                          <td><input type="number" class="form-control joint-time" id="joint-m2-sec-3" placeholder="90" /></td>
                        </tr>
                        <!-- M3 -->
                        <tr>
                          <td style="font-weight:700;" id="joint-lbl-m3">#3 (3호기)</td>
                          <td><input type="number" class="form-control joint-temp" id="joint-m3-t1-top" placeholder="201" /></td>
                          <td><input type="number" class="form-control joint-temp" id="joint-m3-t1-bot" placeholder="201" /></td>
                          <td><input type="number" class="form-control joint-time" id="joint-m3-sec-1" placeholder="90" /></td>
                          <td><input type="number" class="form-control joint-temp" id="joint-m3-t2-top" placeholder="201" /></td>
                          <td><input type="number" class="form-control joint-temp" id="joint-m3-t2-bot" placeholder="201" /></td>
                          <td><input type="number" class="form-control joint-time" id="joint-m3-sec-2" placeholder="90" /></td>
                          <td><input type="number" class="form-control joint-temp" id="joint-m3-t3-top" placeholder="201" /></td>
                          <td><input type="number" class="form-control joint-temp" id="joint-m3-t3-bot" placeholder="201" /></td>
                          <td><input type="number" class="form-control joint-time" id="joint-m3-sec-3" placeholder="90" /></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>

                <!-- 4. 폐기불량 현황 Matrix (A / B / C 구분 10종) -->
                <div class="clip-sub-card">
                  <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:0.5rem;">
                    <label class="form-label mb-0" style="font-weight:700;color:var(--accent-amber);">⚠️ ④ 폐기불량 현황 Matrix (10종 불량 및 자동 합산)</label>
                    <div>
                      <span style="font-size:0.8rem;color:var(--text-muted);margin-right:0.5rem;">총 불량 합계:</span>
                      <input type="number" class="form-control" id="joint-defect-grand-total" readonly style="width:90px;display:inline-block;color:var(--accent-rose);font-weight:800;" value="0" />
                    </div>
                  </div>

                  <div class="table-responsive">
                    <table class="data-table" style="font-size:0.78rem;">
                      <thead>
                        <tr>
                          <th>불량 유형</th>
                          <th>A (EA)</th>
                          <th>B (EA)</th>
                          <th>C (EA)</th>
                          <th>소계</th>
                        </tr>
                      </thead>
                      <tbody id="joint-defect-matrix-body">
                        <!-- Dynamically rendered 10 items in JS -->
                      </tbody>
                    </table>
                  </div>
                </div>

                <!-- 5. 비가동 및 작업 활동 소요시간 기록 -->
                <div class="clip-sub-card">
                  <label class="form-label mb-2" style="font-weight:700;color:var(--accent-rose);">⏱️ ⑤ 비가동 및 작업 활동 소요시간 기록</label>
                  <div class="grid-3 mb-2">
                    <div>
                      <label class="form-label" style="font-size:0.75rem;">발생 유형</label>
                      <select class="form-select" id="joint-act-type">
                        <option value="자재결품">자재결품</option>
                        <option value="설비수리">설비수리</option>
                        <option value="금형수리">금형수리</option>
                        <option value="작업준비">작업준비</option>
                        <option value="3정5S">3정5S</option>
                        <option value="근태관리">근태관리</option>
                        <option value="교육">교육</option>
                        <option value="기타">기타</option>
                      </select>
                    </div>
                    <div>
                      <label class="form-label" style="font-size:0.75rem;">시작 ~ 종료 시각</label>
                      <div style="display:flex;gap:0.2rem;">
                        <input type="time" class="form-control" id="joint-act-start" />
                        <input type="time" class="form-control" id="joint-act-end" />
                      </div>
                    </div>
                    <div>
                      <label class="form-label" style="font-size:0.75rem;">소요시간 (분)</label>
                      <div style="display:flex;gap:0.25rem;">
                        <input type="number" class="form-control" id="joint-act-min" readonly placeholder="자동산출" />
                        <button type="button" class="btn btn-primary btn-sm" id="btn-add-joint-act">추가</button>
                      </div>
                    </div>
                  </div>
                  <div id="joint-act-list" style="font-size:0.8rem;color:var(--text-muted);">
                    <!-- Active logged items -->
                  </div>
                </div>

                <!-- 6. 일 3회 점검 (금형 청소 & 홀막힘 확인) -->
                <div class="clip-sub-card mb-0">
                  <label class="form-label mb-2" style="font-weight:700;color:var(--accent-emerald);">🧹 ⑥ 일 3회 필수 점검 (금형 청소 & 홀막힘 확인)</label>
                  <div class="table-responsive">
                    <table class="data-table" style="font-size:0.8rem;">
                      <thead>
                        <tr>
                          <th>구분</th>
                          <th>시업 전 (시간)</th>
                          <th>시업 중 (시간)</th>
                          <th>시업 후 (시간)</th>
                          <th>이상 유무</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td style="font-weight:700;">금형 청소시간</td>
                          <td><input type="time" class="form-control" id="joint-clean-before" /></td>
                          <td><input type="time" class="form-control" id="joint-clean-during" /></td>
                          <td><input type="time" class="form-control" id="joint-clean-after" /></td>
                          <td><label class="custom-checkbox-card" style="margin:0;padding:0.25rem 0.5rem;"><input type="checkbox" id="joint-clean-ok" checked /> <span>청소 완료</span></label></td>
                        </tr>
                        <tr>
                          <td style="font-weight:700;">홀막힘 확인시간</td>
                          <td><input type="time" class="form-control" id="joint-hole-before" /></td>
                          <td><input type="time" class="form-control" id="joint-hole-during" /></td>
                          <td><input type="time" class="form-control" id="joint-hole-after" /></td>
                          <td><label class="custom-checkbox-card" style="margin:0;padding:0.25rem 0.5rem;"><input type="checkbox" id="joint-hole-ok" checked /> <span>홀막힘 없음</span></label>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
'@

$prepEndMarker = '                <div class="clip-sub-card mt-3">' + "`n" + '                  <label class="custom-checkbox-card" style="margin-bottom:0;">' + "`n" + '                    <input type="checkbox" id="prep-chk-blade" />' + "`n" + '                    <span style="font-weight:700;"><i class="ri-tools-line"></i> 칼날교환주기 확인 완료</span>' + "`n" + '                  </label>' + "`n" + '                </div>' + "`n" + '              </div>' + "`n" + '            </div>'

if ($html.Contains($prepEndMarker)) {
    $html = $html.Replace($prepEndMarker, $prepEndMarker + "`n" + $jointCardHTML)
    Write-Host "Prep card end marker replaced"
} else {
    Write-Host "Prep card end marker NOT found!"
}

# 2. Process Visibility Target
$procTarget = '    const isPrep = (proc?.name || '''').includes(''소재준비'') || (proc?.id || '''').includes(''prep'');' + "`n" + '    container.querySelector(''#prep-spec-card'').style.display = isPrep ? ''block'' : ''none'';' + "`n" + '    if (isPrep) this._initPrepCard(container, proc);'

$procReplacement = $procTarget + "`n`n" + '    const isJoint = (proc?.name || '''').includes(''조인트'') || (proc?.id || '''').includes(''joint'');' + "`n" + '    const jointCard = container.querySelector(''#joint-spec-card'');' + "`n" + '    if (jointCard) jointCard.style.display = isJoint ? ''block'' : ''none'';' + "`n" + '    if (isJoint) this._initJointCard(container, proc);'

if ($html.Contains($procTarget)) {
    $html = $html.Replace($procTarget, $procReplacement)
    Write-Host "Process target replaced"
} else {
    Write-Host "Process target NOT found!"
}

# 3. Method Insertion
$methodTarget = '    container.querySelectorAll(''.prep-LH-def'').forEach(inp => inp.addEventListener(''input'', () => calcPrepDef(''LH'')));' + "`n" + '    container.querySelectorAll(''.prep-RH-def'').forEach(inp => inp.addEventListener(''input'', () => calcPrepDef(''RH'')));' + "`n" + '  }'

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

      if (l1) l1.textContent = `#1 (${m1})`;
      if (l2) l2.textContent = `#2 (${m2})`;
      if (l3) l3.textContent = `#3 (${m3})`;
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
      tbody.innerHTML = defectTypes.map((type, idx) => `
        <tr>
          <td style="font-weight:700;">${idx + 1}. ${type}</td>
          <td><input type="number" min="0" value="0" class="form-control joint-def-input joint-def-a" data-type="${type}" data-cat="A" /></td>
          <td><input type="number" min="0" value="0" class="form-control joint-def-input joint-def-b" data-type="${type}" data-cat="B" /></td>
          <td><input type="number" min="0" value="0" class="form-control joint-def-input joint-def-c" data-type="${type}" data-cat="C" /></td>
          <td style="font-weight:700;color:var(--accent-rose);" class="joint-def-row-subtotal">0</td>
        </tr>
      `).join('');

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
        loggedActs.push(`${type} (${startInp.value} ~ ${endInp.value}, ${dur}분)`);
        actList.innerHTML = loggedActs.map(item => `<span class="badge badge-rose mr-1 mb-1" style="display:inline-block;padding:0.3rem 0.6rem;">${item}</span>`).join(' ');
      };
    }
  }
'@

if ($html.Contains($methodTarget)) {
    $html = $html.Replace($methodTarget, $methodTarget + $methodCode)
    Write-Host "Method target replaced"
} else {
    Write-Host "Method target NOT found!"
}

[System.IO.File]::WriteAllText($filePath, $html, [System.Text.Encoding]::UTF8)
Write-Host "Patch complete."
