$ErrorActionPreference = "Stop"
$backupPath = "c:\Users\KwonHyeonjin\Documents\스텔란티스 ai 앱파일\extracted_backup\index.html"
$destPath = "c:\Users\KwonHyeonjin\Documents\스텔란티스 ai 앱파일\index.html"

# Load the file content
$html = [System.IO.File]::ReadAllText($backupPath, [System.Text.Encoding]::UTF8)

# 1. Prework Card ID
$html = $html.Replace(
'<div class="card mb-3">
              <div class="card-header">
                <div class="card-title" id="prework-title">',
'<div id="prework-card" class="card mb-3">
              <div class="card-header">
                <div class="card-title" id="prework-title">'
)

# 2. Joint Spec Card HTML
$jointCardHTML = @'
            <div id="joint-spec-card" class="card mb-3" style="display:none;">
              <div class="card-header" style="background: linear-gradient(135deg, rgba(239,68,68,0.12), rgba(245,158,11,0.12));">
                <div class="card-title" style="color:var(--accent-rose);"><i class="ri-tools-fill"></i> 조인트 공정 작업일보 (DT CREW / QUAD D/SIDE)</div>
                <span class="badge badge-rose">가류온도 201±10℃ / 가류시간 90±10초</span>
              </div>
              <div class="card-body" style="padding:1rem;">

                <!-- ① 기본 정보 : 부위, 작업시간, 생산량 -->
                <div class="clip-sub-card">
                  <label class="form-label mb-2" style="font-weight:700;color:var(--accent-rose);">🔹 1. 부위 / 작업시간 / 생산량</label>
                  <div style="display:grid;grid-template-columns:repeat(auto-fit,minmax(160px,1fr));gap:0.6rem;">
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
                      <label class="form-label" style="font-size:0.8rem;">작업 시작 시간</label>
                      <input type="time" class="form-control" id="joint-work-start" />
                    </div>
                    <div>
                      <label class="form-label" style="font-size:0.8rem;">작업 종료 시간</label>
                      <input type="time" class="form-control" id="joint-work-end" />
                    </div>
                    <div>
                      <label class="form-label" style="font-size:0.8rem;">계획 생산량 (EA)</label>
                      <input type="number" class="form-control" id="joint-prod-planned" value="0" min="0" />
                    </div>
                    <div>
                      <label class="form-label" style="font-size:0.8rem;">실적 생산량 (EA) *</label>
                      <input type="number" class="form-control" id="joint-prod-total" value="0" min="0" />
                    </div>
                  </div>
                </div>

                <!-- ② 금형기 선택 (3대) -->
                <div class="clip-sub-card">
                  <label class="form-label mb-2" style="font-weight:700;color:var(--accent-cyan);">🔹 2. 금형 호기 선택 & 부위 설정 (3대 / 1~6호기)</label>
                  <div style="display:grid;grid-template-columns:repeat(3,1fr);gap:0.75rem;">
                    <div style="background:var(--surface);padding:0.75rem;border-radius:10px;border:1px solid var(--border-color);">
                      <strong style="color:var(--accent-cyan);font-size:0.85rem;display:block;margin-bottom:0.4rem;">금형기 #1</strong>
                      <div class="form-group mb-1">
                        <label class="form-label" style="font-size:0.75rem;">금형 호기</label>
                        <select class="form-select joint-mould-num" id="joint-m1-no" style="font-size:0.8rem;">
                          <option value="1호기">1호기</option><option value="2호기">2호기</option><option value="3호기">3호기</option>
                          <option value="4호기">4호기</option><option value="5호기">5호기</option><option value="6호기">6호기</option>
                        </select>
                      </div>
                      <div class="form-group mb-1">
                        <label class="form-label" style="font-size:0.75rem;">부위 분류</label>
                        <select class="form-select" id="joint-m1-pos" style="font-size:0.8rem;">
                          <option value="직각">직각</option><option value="둔각">둔각</option><option value="직선">직선</option><option value="엔드">엔드</option>
                        </select>
                      </div>
                      <div class="form-group">
                        <label class="form-label" style="font-size:0.75rem;">금형 No.</label>
                        <input type="text" class="form-control" id="joint-m1-code" placeholder="예: M-01" style="font-size:0.8rem;" />
                      </div>
                    </div>
                    <div style="background:var(--surface);padding:0.75rem;border-radius:10px;border:1px solid var(--border-color);">
                      <strong style="color:var(--accent-cyan);font-size:0.85rem;display:block;margin-bottom:0.4rem;">금형기 #2</strong>
                      <div class="form-group mb-1">
                        <label class="form-label" style="font-size:0.75rem;">금형 호기</label>
                        <select class="form-select joint-mould-num" id="joint-m2-no" style="font-size:0.8rem;">
                          <option value="1호기">1호기</option><option value="2호기" selected>2호기</option><option value="3호기">3호기</option>
                          <option value="4호기">4호기</option><option value="5호기">5호기</option><option value="6호기">6호기</option>
                        </select>
                      </div>
                      <div class="form-group mb-1">
                        <label class="form-label" style="font-size:0.75rem;">부위 분류</label>
                        <select class="form-select" id="joint-m2-pos" style="font-size:0.8rem;">
                          <option value="직각">직각</option><option value="둔각" selected>둔각</option><option value="직선">직선</option><option value="엔드">엔드</option>
                        </select>
                      </div>
                      <div class="form-group">
                        <label class="form-label" style="font-size:0.75rem;">금형 No.</label>
                        <input type="text" class="form-control" id="joint-m2-code" placeholder="예: M-02" style="font-size:0.8rem;" />
                      </div>
                    </div>
                    <div style="background:var(--surface);padding:0.75rem;border-radius:10px;border:1px solid var(--border-color);">
                      <strong style="color:var(--accent-cyan);font-size:0.85rem;display:block;margin-bottom:0.4rem;">금형기 #3</strong>
                      <div class="form-group mb-1">
                        <label class="form-label" style="font-size:0.75rem;">금형 호기</label>
                        <select class="form-select joint-mould-num" id="joint-m3-no" style="font-size:0.8rem;">
                          <option value="1호기">1호기</option><option value="2호기">2호기</option><option value="3호기" selected>3호기</option>
                          <option value="4호기">4호기</option><option value="5호기">5호기</option><option value="6호기">6호기</option>
                        </select>
                      </div>
                      <div class="form-group mb-1">
                        <label class="form-label" style="font-size:0.75rem;">부위 분류</label>
                        <select class="form-select" id="joint-m3-pos" style="font-size:0.8rem;">
                          <option value="직각">직각</option><option value="둔각">둔각</option><option value="직선" selected>직선</option><option value="엔드">엔드</option>
                        </select>
                      </div>
                      <div class="form-group">
                        <label class="form-label" style="font-size:0.75rem;">금형 No.</label>
                        <input type="text" class="form-control" id="joint-m3-code" placeholder="예: M-03" style="font-size:0.8rem;" />
                      </div>
                    </div>
                  </div>
                </div>

                <!-- ③ 압출소재 LOT / 부자재 LOT / 고무 LOT -->
                <div class="clip-sub-card">
                  <label class="form-label mb-2" style="font-weight:700;color:var(--accent-amber);">🔹 3. 압출소재 / 부자재 / 고무 LOT No.</label>

                  <div style="font-size:0.8rem;font-weight:700;margin-bottom:0.35rem;color:var(--text-muted);">① 압출소재 LOT (A LH / B LH / C LH × 초물/중물/종물)</div>
                  <div class="table-responsive mb-3">
                    <table class="data-table" style="font-size:0.8rem;">
                      <thead><tr><th>소재</th><th>초물 LOT</th><th>중물 LOT</th><th>종물 LOT</th></tr></thead>
                      <tbody>
                        <tr>
                          <td style="font-weight:700;">A LH</td>
                          <td><input type="text" class="form-control" id="joint-lot-a-init" placeholder="초물" /></td>
                          <td><input type="text" class="form-control" id="joint-lot-a-mid" placeholder="중물" /></td>
                          <td><input type="text" class="form-control" id="joint-lot-a-fin" placeholder="종물" /></td>
                        </tr>
                        <tr>
                          <td style="font-weight:700;">B LH</td>
                          <td><input type="text" class="form-control" id="joint-lot-b-init" placeholder="초물" /></td>
                          <td><input type="text" class="form-control" id="joint-lot-b-mid" placeholder="중물" /></td>
                          <td><input type="text" class="form-control" id="joint-lot-b-fin" placeholder="종물" /></td>
                        </tr>
                        <tr>
                          <td style="font-weight:700;">C LH</td>
                          <td><input type="text" class="form-control" id="joint-lot-c-init" placeholder="초물" /></td>
                          <td><input type="text" class="form-control" id="joint-lot-c-mid" placeholder="중물" /></td>
                          <td><input type="text" class="form-control" id="joint-lot-c-fin" placeholder="종물" /></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>

                  <div class="grid-2">
                    <div>
                      <div style="font-size:0.8rem;font-weight:700;margin-bottom:0.4rem;color:var(--text-muted);">② 부자재 LOT</div>
                      <div style="background:var(--surface);padding:0.5rem 0.6rem;border-radius:8px;border:1px solid var(--border-color);margin-bottom:0.4rem;">
                        <div style="font-size:0.75rem;font-weight:700;color:var(--accent-cyan);margin-bottom:0.3rem;">▸ DT CREW (직각)</div>
                        <div class="grid-2" style="gap:0.25rem;">
                          <div><label class="form-label" style="font-size:0.75rem;">직각 RH LOT</label><input type="text" class="form-control" id="joint-sub-crew-rh" placeholder="DT CREW 직각 RH" /></div>
                          <div><label class="form-label" style="font-size:0.75rem;">직각 LH LOT</label><input type="text" class="form-control" id="joint-sub-crew-lh" placeholder="DT CREW 직각 LH" /></div>
                        </div>
                      </div>
                      <div style="background:var(--surface);padding:0.5rem 0.6rem;border-radius:8px;border:1px solid var(--border-color);">
                        <div style="font-size:0.75rem;font-weight:700;color:var(--accent-purple);margin-bottom:0.3rem;">▸ DT QUAD (직각 + 둔각)</div>
                        <div class="grid-2" style="gap:0.25rem;">
                          <div><label class="form-label" style="font-size:0.75rem;">직각 RH LOT</label><input type="text" class="form-control" id="joint-sub-quad-ang-rh" placeholder="DT QUAD 직각 RH" /></div>
                          <div><label class="form-label" style="font-size:0.75rem;">직각 LH LOT</label><input type="text" class="form-control" id="joint-sub-quad-ang-lh" placeholder="DT QUAD 직각 LH" /></div>
                          <div><label class="form-label" style="font-size:0.75rem;">둔각 RH LOT</label><input type="text" class="form-control" id="joint-sub-quad-obt-rh" placeholder="DT QUAD 둔각 RH" /></div>
                          <div><label class="form-label" style="font-size:0.75rem;">둔각 LH LOT</label><input type="text" class="form-control" id="joint-sub-quad-obt-lh" placeholder="DT QUAD 둔각 LH" /></div>
                        </div>
                      </div>
                    </div>
                    <div>
                      <div style="font-size:0.8rem;font-weight:700;margin-bottom:0.4rem;color:var(--text-muted);">③ 고무명 & 규격</div>
                      <div style="background:var(--surface);padding:0.75rem;border-radius:8px;border:1px solid var(--border-color);height:100%;">
                        <div style="font-size:0.85rem;font-weight:800;color:var(--accent-emerald);margin-bottom:0.5rem;">고무 규격: 60664$OS</div>
                        <label class="form-label" style="font-size:0.75rem;">고무 LOT No.</label>
                        <input type="text" class="form-control" id="joint-rubber-lot" placeholder="고무 LOT 번호 기입" />
                      </div>
                    </div>
                  </div>
                </div>

                <!-- ④ 가류 조건 측정 -->
                <div class="clip-sub-card">
                  <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:0.5rem;">
                    <label class="form-label mb-0" style="font-weight:700;color:var(--accent-purple);">🔹 4. 가류 조건 측정 (온도 기준 201±10℃ / 시간 기준 90±10초)</label>
                    <span class="badge badge-purple" style="font-size:0.75rem;">범위 초과 시 적색 표시</span>
                  </div>
                  <div class="table-responsive">
                    <table class="data-table" style="font-size:0.78rem;">
                      <thead>
                        <tr>
                          <th rowspan="2" style="min-width:80px;">금형기</th>
                          <th colspan="3">초물</th>
                          <th colspan="3">중물</th>
                          <th colspan="3">종물</th>
                        </tr>
                        <tr>
                          <th>온도 상 (℃)</th><th>온도 하 (℃)</th><th>시간 (초)</th>
                          <th>온도 상 (℃)</th><th>온도 하 (℃)</th><th>시간 (초)</th>
                          <th>온도 상 (℃)</th><th>온도 하 (℃)</th><th>시간 (초)</th>
                        </tr>
                      </thead>
                      <tbody>
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

                <!-- ⑤ 폐기불량 현황 Matrix -->
                <div class="clip-sub-card">
                  <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:0.5rem;">
                    <label class="form-label mb-0" style="font-weight:700;color:var(--accent-amber);">🔹 5. 폐기불량 현황 (A / B / C × 10종)</label>
                    <div style="display:flex;align-items:center;gap:0.5rem;">
                      <span style="font-size:0.8rem;color:var(--text-muted);">총 불량 합계:</span>
                      <input type="number" class="form-control" id="joint-defect-grand-total" readonly style="width:80px;color:var(--accent-rose);font-weight:800;" value="0" />
                    </div>
                  </div>
                  <div class="table-responsive">
                    <table class="data-table" style="font-size:0.78rem;">
                      <thead>
                        <tr>
                          <th>불량 유형</th>
                          <th>A (EA)</th><th>B (EA)</th><th>C (EA)</th>
                          <th>소계</th>
                        </tr>
                      </thead>
                      <tbody id="joint-defect-matrix-body">
                        <!-- Dynamically rendered 10 items in JS -->
                      </tbody>
                    </table>
                  </div>
                </div>

                <!-- ⑥ 비가동 발생 기록 -->
                <div class="clip-sub-card">
                  <label class="form-label mb-2" style="font-weight:700;color:var(--accent-rose);">🔹 6. 비가동 발생 기록 (유형 / 발생시간 / 완료시간 / 소요시간)</label>
                  <div style="display:grid;grid-template-columns:1.3fr 1.8fr 0.7fr auto;gap:0.5rem;align-items:end;margin-bottom:0.5rem;">
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
                      <label class="form-label" style="font-size:0.75rem;">발생시간 &nbsp;/&nbsp; 완료시간</label>
                      <div style="display:flex;gap:0.3rem;align-items:center;">
                        <input type="time" class="form-control" id="joint-act-start" />
                        <span style="color:var(--text-muted);font-size:0.8rem;">~</span>
                        <input type="time" class="form-control" id="joint-act-end" />
                      </div>
                    </div>
                    <div>
                      <label class="form-label" style="font-size:0.75rem;">소요시간 (분)</label>
                      <input type="number" class="form-control" id="joint-act-min" readonly placeholder="자동산출" />
                    </div>
                    <div>
                      <button type="button" class="btn btn-primary btn-sm" id="btn-add-joint-act" style="margin-bottom:2px;">+ 추가</button>
                    </div>
                  </div>
                  <div id="joint-act-list" style="font-size:0.8rem;min-height:28px;">
                    <!-- Logged items appear here -->
                  </div>
                </div>

                <!-- ⑦ 일 3회 점검 -->
                <div class="clip-sub-card mb-0">
                  <label class="form-label mb-2" style="font-weight:700;color:var(--accent-emerald);">🔹 7. 일 3회 점검 — 시업 전 / 작업 중 / 작업 후 (금형 청소 & 홀막힘)</label>
                  <div class="table-responsive">
                    <table class="data-table" style="font-size:0.8rem;">
                      <thead>
                        <tr>
                          <th style="min-width:90px;">구분</th>
                          <th>시업 전 시각</th>
                          <th>작업 중 시각</th>
                          <th>작업 후 시각</th>
                          <th>이상 유무</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td style="font-weight:700;">금형 청소<br/><span style="font-size:0.7rem;color:var(--text-muted);font-weight:400;">일 3회 실시</span></td>
                          <td><input type="time" class="form-control" id="joint-clean-before" /></td>
                          <td><input type="time" class="form-control" id="joint-clean-during" /></td>
                          <td><input type="time" class="form-control" id="joint-clean-after" /></td>
                          <td>
                            <select class="form-select" id="joint-clean-result" style="font-size:0.78rem;">
                              <option value="정상">✅ 정상</option>
                              <option value="이상">⚠️ 이상</option>
                            </select>
                          </td>
                        </tr>
                        <tr>
                          <td style="font-weight:700;">홀막힘 확인<br/><span style="font-size:0.7rem;color:var(--text-muted);font-weight:400;">일 3회 실시</span></td>
                          <td><input type="time" class="form-control" id="joint-hole-before" /></td>
                          <td><input type="time" class="form-control" id="joint-hole-during" /></td>
                          <td><input type="time" class="form-control" id="joint-hole-after" /></td>
                          <td>
                            <select class="form-select" id="joint-hole-result" style="font-size:0.78rem;">
                              <option value="정상">✅ 정상</option>
                              <option value="이상">⚠️ 이상</option>
                            </select>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>

              </div>
            </div>

            <div id="default-prod-card" class="card mb-3">
'

$html = $html.Replace(
'<div class="card mb-3">
              <div class="card-header">
                <div class="card-title"><i class="ri-file-edit-line"></i> 2. 생산 수량 &amp; 비가동 입력</div>',
$jointCardHTML + '              <div class="card-header">
                <div class="card-title"><i class="ri-file-edit-line"></i> 2. 생산 수량 &amp; 비가동 입력</div>'
)


# 3. Update _loadLog
$load_log_orig = @'
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

    const isClip = (proc?.name || '').includes('클립머신') || (proc?.id || '').includes('clip');
    container.querySelector('#clip-spec-card').style.display = isClip ? 'block' : 'none';
    if (isClip) this._initClipCard(container);

    const isPrep = (proc?.name || '').includes('소재준비') || (proc?.id || '').includes('prep');
    container.querySelector('#prep-spec-card').style.display = isPrep ? 'block' : 'none';
    if (isPrep) this._initPrepCard(container, proc);

    try {
      this._renderPrework(container, proc?.isMachine || false);
      this._renderDefectGrid(container);
      this._populateLogUI(container);
      this._renderHistory(container);
    } catch (e) {
      alert("loadLog Error: " + e.message + "\n\n" + e.stack);
    }
  }
'@

$load_log_new = @'
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

    const isClip = (proc?.name || '').includes('클립머신') || (proc?.id || '').includes('clip');
    container.querySelector('#clip-spec-card').style.display = isClip ? 'block' : 'none';
    if (isClip) this._initClipCard(container);

    const isPrep = (proc?.name || '').includes('소재준비') || (proc?.id || '').includes('prep');
    container.querySelector('#prep-spec-card').style.display = isPrep ? 'block' : 'none';
    if (isPrep) this._initPrepCard(container, proc);
    
    const isJoint = (proc?.name || '').includes('조인트') || (proc?.id || '').includes('joint');
    const jointCard = container.querySelector('#joint-spec-card');
    const defaultProdCard = container.querySelector('#default-prod-card');
    if (jointCard) jointCard.style.display = isJoint ? 'block' : 'none';
    if (defaultProdCard) defaultProdCard.style.display = isJoint ? 'none' : 'block';
    if (isJoint) this._initJointCard(container, proc);

    try {
      this._renderPrework(container, proc?.isMachine || false);
      this._renderDefectGrid(container);
      this._populateLogUI(container);
      this._renderHistory(container);
    } catch (e) {
      alert("loadLog Error: " + e.message + "\n\n" + e.stack);
    }
  }
'@

$html = $html.Replace($load_log_orig.Replace("`r`n", "`n"), $load_log_new.Replace("`r`n", "`n"))
$html = $html.Replace($load_log_orig, $load_log_new)

# 4. _populateLogUI
$pop_log_orig = @'
  _populateLogUI(container) {
    const log = this.currentLog;
    const pwBadge = container.querySelector('#prework-status-badge');
    const pwBtn = container.querySelector('#btn-prework-submit');

    if (log.preWorkDone) {
      pwBadge.className = 'badge badge-emerald'; pwBadge.textContent = '점검 완료';
      pwBtn.disabled = true; pwBtn.innerHTML = '✅ 점검 완료됨';
      container.querySelectorAll('#checklist-container input').forEach(c => { c.checked = true; c.disabled = true; });
    } else {
      pwBadge.className = 'badge badge-amber'; pwBadge.textContent = '미완료';
      pwBtn.disabled = false;
      const today = new Date().toISOString().split('T')[0];
      const hasClockedIn = store.getLogs().some(l => l.workerName === this.workerName && l.date === today && l.preWorkDone && l.id !== log.id);
      pwBtn.innerHTML = hasClockedIn ? '<i class="ri-check-double-line"></i> TPM 점검 완료' : '<i class="ri-check-double-line"></i> 점검 완료 및 근무 시작 기록';
      container.querySelectorAll('#checklist-container input').forEach(c => { c.checked = false; c.disabled = false; });
    }

    container.querySelector('#prod-time-start').value = log.timeStart || '';
    container.querySelector('#prod-time-end').value = log.timeEnd || '';
    container.querySelector('#prod-planned').value = log.plannedQuantity || 0;
    container.querySelector('#prod-total').value = log.totalQuantity || 0;
    container.querySelector('#prod-pass').value = log.passQuantity || 0;
    container.querySelector('#prod-defect').value = log.defectQuantity || 0;
    container.querySelector('#prod-note').value = log.note || '';
'@

$pop_log_new = @'
  _populateLogUI(container) {
    const log = this.currentLog;
    const pwBadge = container.querySelector('#prework-status-badge');
    const pwBtn = container.querySelector('#btn-prework-submit');

    if (pwBadge && pwBtn) {
      if (log.preWorkDone) {
        pwBadge.className = 'badge badge-emerald'; pwBadge.textContent = '점검 완료';
        pwBtn.disabled = true; pwBtn.innerHTML = '✅ 점검 완료됨';
        container.querySelectorAll('#checklist-container input').forEach(c => { c.checked = true; c.disabled = true; });
      } else {
        pwBadge.className = 'badge badge-amber'; pwBadge.textContent = '미완료';
        pwBtn.disabled = false;
        const today = new Date().toISOString().split('T')[0];
        const hasClockedIn = store.getLogs().some(l => l.workerName === this.workerName && l.date === today && l.preWorkDone && l.id !== log.id);
        pwBtn.innerHTML = hasClockedIn ? '<i class="ri-check-double-line"></i> TPM 점검 완료' : '<i class="ri-check-double-line"></i> 점검 완료 및 근무 시작 기록';
        container.querySelectorAll('#checklist-container input').forEach(c => { c.checked = false; c.disabled = false; });
      }
    }

    container.querySelector('#prod-time-start')?.value !== undefined && (container.querySelector('#prod-time-start').value = log.timeStart || '');
    container.querySelector('#prod-time-end')?.value !== undefined && (container.querySelector('#prod-time-end').value = log.timeEnd || '');
    container.querySelector('#prod-planned')?.value !== undefined && (container.querySelector('#prod-planned').value = log.plannedQuantity || 0);
    container.querySelector('#prod-total')?.value !== undefined && (container.querySelector('#prod-total').value = log.totalQuantity || 0);
    container.querySelector('#prod-pass')?.value !== undefined && (container.querySelector('#prod-pass').value = log.passQuantity || 0);
    container.querySelector('#prod-defect')?.value !== undefined && (container.querySelector('#prod-defect').value = log.defectQuantity || 0);
    container.querySelector('#prod-note')?.value !== undefined && (container.querySelector('#prod-note').value = log.note || '');

    if (log.jointData) {
      const jd = log.jointData;
      container.querySelector('#joint-work-start') && (container.querySelector('#joint-work-start').value = jd.timeStart || '');
      container.querySelector('#joint-work-end') && (container.querySelector('#joint-work-end').value = jd.timeEnd || '');
      container.querySelector('#joint-prod-planned') && (container.querySelector('#joint-prod-planned').value = jd.plannedQty || 0);
      container.querySelector('#joint-prod-total') && (container.querySelector('#joint-prod-total').value = jd.totalQty || 0);
      container.querySelector('#joint-rubber-lot') && (container.querySelector('#joint-rubber-lot').value = jd.rubberLot || '');
    }
'@

$html = $html.Replace($pop_log_orig.Replace("`r`n", "`n"), $pop_log_new.Replace("`r`n", "`n"))
$html = $html.Replace($pop_log_orig, $pop_log_new)

# 5. _saveLog
$save_log_orig = @'
  _saveLog(container, status) {
    if (!this.currentLog) return;
    if (!this.currentLog.preWorkDone) { alert('작업 시작 전 점검 일지를 먼저 제출해 주세요!'); return; }
    if (status === 'SUBMITTED' && !confirm('최종 제출 후에는 수정이 불가능합니다. 제출하시겠습니까?')) return;

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

    const isClip = this.currentLog.processName?.includes('클립머신') || this.currentLog.processId?.includes('clip');
    let clipData = null;
'@

$save_log_new = @'
  _saveLog(container, status) {
    if (!this.currentLog) return;
    if (!this.currentLog.preWorkDone) { alert('작업 시작 전 점검 일지를 먼저 제출해 주세요!'); return; }
    if (status === 'SUBMITTED' && !confirm('최종 제출 후에는 수정이 불가능합니다. 제출하시겠습니까?')) return;

    const isJoint = this.currentLog.processName?.includes('조인트') || this.currentLog.processId?.includes('joint');

    let timeStart, timeEnd, plannedQuantity, total, defect;
    if (isJoint) {
      timeStart = container.querySelector('#joint-work-start')?.value || '';
      timeEnd = container.querySelector('#joint-work-end')?.value || '';
      plannedQuantity = parseInt(container.querySelector('#joint-prod-planned')?.value) || 0;
      total = parseInt(container.querySelector('#joint-prod-total')?.value) || 0;
      defect = parseInt(container.querySelector('#joint-defect-grand-total')?.value) || 0;
    } else {
      timeStart = container.querySelector('#prod-time-start')?.value || '';
      timeEnd = container.querySelector('#prod-time-end')?.value || '';
      plannedQuantity = parseInt(container.querySelector('#prod-planned')?.value) || 0;
      total = parseInt(container.querySelector('#prod-total')?.value) || 0;
      defect = parseInt(container.querySelector('#prod-defect')?.value) || 0;
    }

    const defectDetails = {};
    container.querySelectorAll('.defect-input').forEach(inp => {
      const v = parseInt(inp.value) || 0;
      if (v > 0) defectDetails[inp.dataset.did] = v;
    });
    const hasDowntime = container.querySelector('#chk-has-downtime')?.checked || false;
    const downtimeReason = hasDowntime ? container.querySelector('#dt-reason')?.value : '';
    const downtimeLineNo = hasDowntime ? (container.querySelector('#dt-line-no')?.value || '') : '';
    const downtimeDuration = hasDowntime ? (parseInt(container.querySelector('#dt-duration')?.value) || 0) : 0;
    const downtimeNote = hasDowntime ? container.querySelector('#dt-note')?.value : '';
    const note = container.querySelector('#prod-note')?.value || '';

    const isClip = this.currentLog.processName?.includes('클립머신') || this.currentLog.processId?.includes('clip');
    let clipData = null;
'@

$html = $html.Replace($save_log_orig.Replace("`r`n", "`n"), $save_log_new.Replace("`r`n", "`n"))
$html = $html.Replace($save_log_orig, $save_log_new)

$save_log_orig_2 = @'
    Object.assign(this.currentLog, {
      timeStart, timeEnd, plannedQuantity,
      totalQuantity: total, defectQuantity: defect, passQuantity: Math.max(0, total - defect),
      defectDetails, hasDowntime, downtimeReason, downtimeLineNo, downtimeDuration, downtimeNote, note, status,
      clipData, prepData
    });
'@

$save_log_new_2 = @'
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
'@

$html = $html.Replace($save_log_orig_2.Replace("`r`n", "`n"), $save_log_new_2.Replace("`r`n", "`n"))
$html = $html.Replace($save_log_orig_2, $save_log_new_2)

# 6. Add _initJointCard
$init_joint_card = @'
  _initJointCard(container, proc) {
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

    const defectTypes = ['떨어짐/찢어짐', '양 부족', '밀림/크랙', '기포', '씹힘/삽입불량', '넘침/오버랩', '후변형', '이물질', '꼬임', '기타'];
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
          alert('발생시간과 완료시간을 모두 입력하세요.'); return;
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

  _initPrepCard(container, proc) {
'@

$html = $html.Replace("  _initPrepCard(container, proc) {", $init_joint_card)

# Save to the main file
[System.IO.File]::WriteAllText($destPath, $html, [System.Text.Encoding]::UTF8)
Write-Host "Replacement complete. File saved to $destPath"
