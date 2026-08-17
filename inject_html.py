import os

file_path = r"c:\Users\KwonHyeonjin\Documents\스텔란티스 ai 앱파일\index.html"

with open(file_path, "r", encoding="utf-8") as f:
    lines = f.readlines()

html_to_inject = """            <div id="post-spec-card" class="card mb-3" style="display:none;">
              <div class="card-header" style="background: linear-gradient(135deg, rgba(139,92,246,0.12), rgba(59,130,246,0.12));">
                <div class="card-title" style="color:var(--accent-purple);"><i class="ri-hammer-line"></i> 후가공 작업일보 (DT CREW / QUAD)</div>
              </div>
              <div class="card-body" style="padding:1rem;">
                
                <!-- 1. 구분 -->
                <div class="clip-sub-card">
                  <label class="form-label mb-2" style="font-weight:700;color:var(--accent-purple);">✅ 1. 구분</label>
                  <div class="grid-2">
                    <div>
                      <select class="form-select" id="post-type">
                        <option value="RH">RH</option>
                        <option value="LH">LH</option>
                      </select>
                    </div>
                  </div>
                </div>

                <!-- 2. 소재 LOT No. -->
                <div class="clip-sub-card mt-3">
                  <label class="form-label mb-2" style="font-weight:700;color:var(--accent-purple);">✅ 2. 소재 LOT No.</label>
                  <div class="table-responsive">
                    <table class="data-table" style="min-width:400px;text-align:center;">
                      <thead>
                        <tr><th>구분</th><th>A부품</th><th>B부품</th><th>C부품</th></tr>
                      </thead>
                      <tbody>
                        <tr>
                          <th>초물</th>
                          <td><input type="text" class="form-control" id="post-lot-early-a" /></td>
                          <td><input type="text" class="form-control" id="post-lot-early-b" /></td>
                          <td><input type="text" class="form-control" id="post-lot-early-c" /></td>
                        </tr>
                        <tr>
                          <th>중물</th>
                          <td><input type="text" class="form-control" id="post-lot-mid-a" /></td>
                          <td><input type="text" class="form-control" id="post-lot-mid-b" /></td>
                          <td><input type="text" class="form-control" id="post-lot-mid-c" /></td>
                        </tr>
                        <tr>
                          <th>종물</th>
                          <td><input type="text" class="form-control" id="post-lot-late-a" /></td>
                          <td><input type="text" class="form-control" id="post-lot-late-b" /></td>
                          <td><input type="text" class="form-control" id="post-lot-late-c" /></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>

                <!-- 3. 외관검사 (O/X) -->
                <div class="clip-sub-card mt-3">
                  <label class="form-label mb-2" style="font-weight:700;color:var(--accent-purple);">✅ 3. 외관검사 (O/X)</label>
                  <div class="table-responsive">
                    <table class="data-table" style="min-width:400px;text-align:center;">
                      <thead>
                        <tr><th>구분</th><th>미사상 (O/X)</th><th>과사상 (O/X)</th></tr>
                      </thead>
                      <tbody>
                        <tr>
                          <th>초물</th>
                          <td>
                            <select class="form-select" id="post-insp-early-mi">
                              <option value="O">O (양호)</option>
                              <option value="X">X (불량)</option>
                            </select>
                          </td>
                          <td>
                            <select class="form-select" id="post-insp-early-gwa">
                              <option value="O">O (양호)</option>
                              <option value="X">X (불량)</option>
                            </select>
                          </td>
                        </tr>
                        <tr>
                          <th>중물</th>
                          <td>
                            <select class="form-select" id="post-insp-mid-mi">
                              <option value="O">O (양호)</option>
                              <option value="X">X (불량)</option>
                            </select>
                          </td>
                          <td>
                            <select class="form-select" id="post-insp-mid-gwa">
                              <option value="O">O (양호)</option>
                              <option value="X">X (불량)</option>
                            </select>
                          </td>
                        </tr>
                        <tr>
                          <th>종물</th>
                          <td>
                            <select class="form-select" id="post-insp-late-mi">
                              <option value="O">O (양호)</option>
                              <option value="X">X (불량)</option>
                            </select>
                          </td>
                          <td>
                            <select class="form-select" id="post-insp-late-gwa">
                              <option value="O">O (양호)</option>
                              <option value="X">X (불량)</option>
                            </select>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>

                <!-- 4. 불량 유형별 기록 -->
                <div class="clip-sub-card mt-3">
                  <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:0.5rem;">
                    <label class="form-label mb-0" style="font-weight:700;color:var(--accent-purple);">✅ 4. 불량 유형별 기록 (EA)</label>
                    <div><span style="font-weight:700;">불량 합계:</span> <input type="number" id="post-defect-total" class="form-control" readonly style="display:inline-block;width:80px;text-align:right;color:var(--accent-rose);font-weight:900;" value="0" /> EA</div>
                  </div>
                  
                  <!-- 외관부 -->
                  <div style="background:#fff;border:1px solid var(--border-color);border-radius:6px;padding:1rem;margin-bottom:1rem;">
                    <div style="font-weight:700;color:#334155;margin-bottom:0.75rem;">[외관부]</div>
                    <div style="display:grid;grid-template-columns:repeat(auto-fill, minmax(140px, 1fr));gap:0.75rem;">
                      <div><label style="font-size:0.75rem;">스코치</label><input type="number" class="form-control post-def-input" data-cat="외관부" data-type="스코치" value="0" min="0" inputmode="decimal" pattern="[0-9]*" /></div>
                      <div><label style="font-size:0.75rem;">외면흠</label><input type="number" class="form-control post-def-input" data-cat="외관부" data-type="외면흠" value="0" min="0" inputmode="decimal" pattern="[0-9]*" /></div>
                      <div><label style="font-size:0.75rem;">오염/코팅불량</label><input type="number" class="form-control post-def-input" data-cat="외관부" data-type="오염/코팅불량" value="0" min="0" inputmode="decimal" pattern="[0-9]*" /></div>
                      <div><label style="font-size:0.75rem;">길이불량</label><input type="number" class="form-control post-def-input" data-cat="외관부" data-type="길이불량" value="0" min="0" inputmode="decimal" pattern="[0-9]*" /></div>
                      <div><label style="font-size:0.75rem;">소재클립누락</label><input type="number" class="form-control post-def-input" data-cat="외관부" data-type="소재클립누락" value="0" min="0" inputmode="decimal" pattern="[0-9]*" /></div>
                      <div><label style="font-size:0.75rem;">기타</label><input type="number" class="form-control post-def-input" data-cat="외관부" data-type="기타" value="0" min="0" inputmode="decimal" pattern="[0-9]*" /></div>
                    </div>
                  </div>

                  <!-- 조인트부 -->
                  <div style="background:#fff;border:1px solid var(--border-color);border-radius:6px;padding:1rem;margin-bottom:1rem;">
                    <div style="font-weight:700;color:#334155;margin-bottom:0.75rem;">[조인트부]</div>
                    <div style="display:grid;grid-template-columns:repeat(auto-fill, minmax(140px, 1fr));gap:0.75rem;">
                      <div><label style="font-size:0.75rem;">떨어짐/찢어짐</label><input type="number" class="form-control post-def-input" data-cat="조인트부" data-type="떨어짐/찢어짐" value="0" min="0" inputmode="decimal" pattern="[0-9]*" /></div>
                      <div><label style="font-size:0.75rem;">양부족</label><input type="number" class="form-control post-def-input" data-cat="조인트부" data-type="양부족" value="0" min="0" inputmode="decimal" pattern="[0-9]*" /></div>
                      <div><label style="font-size:0.75rem;">밀림/크랙</label><input type="number" class="form-control post-def-input" data-cat="조인트부" data-type="밀림/크랙" value="0" min="0" inputmode="decimal" pattern="[0-9]*" /></div>
                      <div><label style="font-size:0.75rem;">기포</label><input type="number" class="form-control post-def-input" data-cat="조인트부" data-type="기포" value="0" min="0" inputmode="decimal" pattern="[0-9]*" /></div>
                      <div><label style="font-size:0.75rem;">씹힘/삽입불량</label><input type="number" class="form-control post-def-input" data-cat="조인트부" data-type="씹힘/삽입불량" value="0" min="0" inputmode="decimal" pattern="[0-9]*" /></div>
                      <div><label style="font-size:0.75rem;">넘침/오버랩</label><input type="number" class="form-control post-def-input" data-cat="조인트부" data-type="넘침/오버랩" value="0" min="0" inputmode="decimal" pattern="[0-9]*" /></div>
                      <div><label style="font-size:0.75rem;">후변형</label><input type="number" class="form-control post-def-input" data-cat="조인트부" data-type="후변형" value="0" min="0" inputmode="decimal" pattern="[0-9]*" /></div>
                      <div><label style="font-size:0.75rem;">이물질</label><input type="number" class="form-control post-def-input" data-cat="조인트부" data-type="이물질" value="0" min="0" inputmode="decimal" pattern="[0-9]*" /></div>
                      <div><label style="font-size:0.75rem;">꼬임</label><input type="number" class="form-control post-def-input" data-cat="조인트부" data-type="꼬임" value="0" min="0" inputmode="decimal" pattern="[0-9]*" /></div>
                      <div><label style="font-size:0.75rem;">기타</label><input type="number" class="form-control post-def-input" data-cat="조인트부" data-type="기타" value="0" min="0" inputmode="decimal" pattern="[0-9]*" /></div>
                    </div>
                  </div>

                  <!-- 후가공부 -->
                  <div style="background:#fff;border:1px solid var(--border-color);border-radius:6px;padding:1rem;">
                    <div style="font-weight:700;color:#334155;margin-bottom:0.75rem;">[후가공부]</div>
                    <div style="display:grid;grid-template-columns:repeat(auto-fill, minmax(140px, 1fr));gap:0.75rem;">
                      <div><label style="font-size:0.75rem;">과사상</label><input type="number" class="form-control post-def-input" data-cat="후가공부" data-type="과사상" value="0" min="0" inputmode="decimal" pattern="[0-9]*" /></div>
                      <div><label style="font-size:0.75rem;">미사상</label><input type="number" class="form-control post-def-input" data-cat="후가공부" data-type="미사상" value="0" min="0" inputmode="decimal" pattern="[0-9]*" /></div>
                      <div><label style="font-size:0.75rem;">본드오염</label><input type="number" class="form-control post-def-input" data-cat="후가공부" data-type="본드오염" value="0" min="0" inputmode="decimal" pattern="[0-9]*" /></div>
                      <div><label style="font-size:0.75rem;">외면오염</label><input type="number" class="form-control post-def-input" data-cat="후가공부" data-type="외면오염" value="0" min="0" inputmode="decimal" pattern="[0-9]*" /></div>
                      <div><label style="font-size:0.75rem;">클립누락/반클립</label><input type="number" class="form-control post-def-input" data-cat="후가공부" data-type="클립누락/반클립" value="0" min="0" inputmode="decimal" pattern="[0-9]*" /></div>
                      <div><label style="font-size:0.75rem;">클립홀 누락</label><input type="number" class="form-control post-def-input" data-cat="후가공부" data-type="클립홀 누락" value="0" min="0" inputmode="decimal" pattern="[0-9]*" /></div>
                      <div><label style="font-size:0.75rem;">드레인홀 불량</label><input type="number" class="form-control post-def-input" data-cat="후가공부" data-type="드레인홀 불량" value="0" min="0" inputmode="decimal" pattern="[0-9]*" /></div>
                      <div><label style="font-size:0.75rem;">클립이종</label><input type="number" class="form-control post-def-input" data-cat="후가공부" data-type="클립이종" value="0" min="0" inputmode="decimal" pattern="[0-9]*" /></div>
                      <div><label style="font-size:0.75rem;">절단누락</label><input type="number" class="form-control post-def-input" data-cat="후가공부" data-type="절단누락" value="0" min="0" inputmode="decimal" pattern="[0-9]*" /></div>
                      <div><label style="font-size:0.75rem;">본드누락/접착불</label><input type="number" class="form-control post-def-input" data-cat="후가공부" data-type="본드누락/접착불" value="0" min="0" inputmode="decimal" pattern="[0-9]*" /></div>
                      <div><label style="font-size:0.75rem;">길이초과</label><input type="number" class="form-control post-def-input" data-cat="후가공부" data-type="길이초과" value="0" min="0" inputmode="decimal" pattern="[0-9]*" /></div>
                      <div><label style="font-size:0.75rem;">클립간격불량</label><input type="number" class="form-control post-def-input" data-cat="후가공부" data-type="클립간격불량" value="0" min="0" inputmode="decimal" pattern="[0-9]*" /></div>
                      <div><label style="font-size:0.75rem;">기타</label><input type="number" class="form-control post-def-input" data-cat="후가공부" data-type="기타" value="0" min="0" inputmode="decimal" pattern="[0-9]*" /></div>
                    </div>
                  </div>

                </div>
              </div>
            </div>
"""

insert_idx = -1
for i, line in enumerate(lines):
    if 'id="default-prod-card"' in line:
        insert_idx = i
        break

if insert_idx != -1:
    lines.insert(insert_idx, html_to_inject)
    with open(file_path, "w", encoding="utf-8") as f:
        f.writelines(lines)
    print("Injected post-spec-card HTML successfully.")
else:
    print("Could not find insertion point!")
