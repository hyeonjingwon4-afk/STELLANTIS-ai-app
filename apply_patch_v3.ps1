$ErrorActionPreference = "Stop"
$backupPath = "c:\Users\KwonHyeonjin\Documents\?ㅽ뀛??곗뒪 ai ?깊뙆??extracted_backup\index.html"
$destPath = "c:\Users\KwonHyeonjin\Documents\?ㅽ뀛??곗뒪 ai ?깊뙆??index.html"

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
                <div class="card-title" style="color:var(--accent-rose);"><i class="ri-tools-fill"></i> 議곗씤??怨듭젙 ?묒뾽?쇰낫 (DT CREW / QUAD D/SIDE)</div>
                <span class="badge badge-rose">媛瑜섏삩??201짹10??/ 媛瑜섏떆媛?90짹10珥?/span>
              </div>
              <div class="card-body" style="padding:1rem;">

                <!-- ??湲곕낯 ?뺣낫 : 遺?? ?묒뾽?쒓컙, ?앹궛??-->
                <div class="clip-sub-card">
                  <label class="form-label mb-2" style="font-weight:700;color:var(--accent-rose);">?뵻 1. 遺??/ ?묒뾽?쒓컙 / ?앹궛??/label>
                  <div style="display:grid;grid-template-columns:repeat(auto-fit,minmax(160px,1fr));gap:0.6rem;">
                    <div>
                      <label class="form-label" style="font-size:0.8rem;">?묒뾽 ???遺??/label>
                      <select class="form-select" id="joint-part-side">
                        <option value="FR RH">FR RH</option>
                        <option value="FR LH">FR LH</option>
                        <option value="RR RH">RR RH</option>
                        <option value="RR LH">RR LH</option>
                      </select>
                    </div>
                    <div>
                      <label class="form-label" style="font-size:0.8rem;">?묒뾽 ?쒖옉 ?쒓컙</label>
                      <input type="time" class="form-control" id="joint-work-start" />
                    </div>
                    <div>
                      <label class="form-label" style="font-size:0.8rem;">?묒뾽 醫낅즺 ?쒓컙</label>
                      <input type="time" class="form-control" id="joint-work-end" />
                    </div>
                    <div>
                      <label class="form-label" style="font-size:0.8rem;">怨꾪쉷 ?앹궛??(EA)</label>
                      <input type="number" class="form-control" id="joint-prod-planned" value="0" min="0" />
                    </div>
                    <div>
                      <label class="form-label" style="font-size:0.8rem;">?ㅼ쟻 ?앹궛??(EA) *</label>
                      <input type="number" class="form-control" id="joint-prod-total" value="0" min="0" />
                    </div>
                  </div>
                </div>

                <!-- ??湲덊삎湲??좏깮 (3?) -->
                <div class="clip-sub-card">
                  <label class="form-label mb-2" style="font-weight:700;color:var(--accent-cyan);">?뵻 2. 湲덊삎 ?멸린 ?좏깮 & 遺???ㅼ젙 (3? / 1~6?멸린)</label>
                  <div style="display:grid;grid-template-columns:repeat(3,1fr);gap:0.75rem;">
                    <div style="background:var(--surface);padding:0.75rem;border-radius:10px;border:1px solid var(--border-color);">
                      <strong style="color:var(--accent-cyan);font-size:0.85rem;display:block;margin-bottom:0.4rem;">湲덊삎湲?#1</strong>
                      <div class="form-group mb-1">
                        <label class="form-label" style="font-size:0.75rem;">湲덊삎 ?멸린</label>
                        <select class="form-select joint-mould-num" id="joint-m1-no" style="font-size:0.8rem;">
                          <option value="1?멸린">1?멸린</option><option value="2?멸린">2?멸린</option><option value="3?멸린">3?멸린</option>
                          <option value="4?멸린">4?멸린</option><option value="5?멸린">5?멸린</option><option value="6?멸린">6?멸린</option>
                        </select>
                      </div>
                      <div class="form-group mb-1">
                        <label class="form-label" style="font-size:0.75rem;">遺??遺꾨쪟</label>
                        <select class="form-select" id="joint-m1-pos" style="font-size:0.8rem;">
                          <option value="吏곴컖">吏곴컖</option><option value="?붽컖">?붽컖</option><option value="吏곸꽑">吏곸꽑</option><option value="?붾뱶">?붾뱶</option>
                        </select>
                      </div>
                      <div class="form-group">
                        <label class="form-label" style="font-size:0.75rem;">湲덊삎 No.</label>
                        <input type="text" class="form-control" id="joint-m1-code" placeholder="?? M-01" style="font-size:0.8rem;" />
                      </div>
                    </div>
                    <div style="background:var(--surface);padding:0.75rem;border-radius:10px;border:1px solid var(--border-color);">
                      <strong style="color:var(--accent-cyan);font-size:0.85rem;display:block;margin-bottom:0.4rem;">湲덊삎湲?#2</strong>
                      <div class="form-group mb-1">
                        <label class="form-label" style="font-size:0.75rem;">湲덊삎 ?멸린</label>
                        <select class="form-select joint-mould-num" id="joint-m2-no" style="font-size:0.8rem;">
                          <option value="1?멸린">1?멸린</option><option value="2?멸린" selected>2?멸린</option><option value="3?멸린">3?멸린</option>
                          <option value="4?멸린">4?멸린</option><option value="5?멸린">5?멸린</option><option value="6?멸린">6?멸린</option>
                        </select>
                      </div>
                      <div class="form-group mb-1">
                        <label class="form-label" style="font-size:0.75rem;">遺??遺꾨쪟</label>
                        <select class="form-select" id="joint-m2-pos" style="font-size:0.8rem;">
                          <option value="吏곴컖">吏곴컖</option><option value="?붽컖" selected>?붽컖</option><option value="吏곸꽑">吏곸꽑</option><option value="?붾뱶">?붾뱶</option>
                        </select>
                      </div>
                      <div class="form-group">
                        <label class="form-label" style="font-size:0.75rem;">湲덊삎 No.</label>
                        <input type="text" class="form-control" id="joint-m2-code" placeholder="?? M-02" style="font-size:0.8rem;" />
                      </div>
                    </div>
                    <div style="background:var(--surface);padding:0.75rem;border-radius:10px;border:1px solid var(--border-color);">
                      <strong style="color:var(--accent-cyan);font-size:0.85rem;display:block;margin-bottom:0.4rem;">湲덊삎湲?#3</strong>
                      <div class="form-group mb-1">
                        <label class="form-label" style="font-size:0.75rem;">湲덊삎 ?멸린</label>
                        <select class="form-select joint-mould-num" id="joint-m3-no" style="font-size:0.8rem;">
                          <option value="1?멸린">1?멸린</option><option value="2?멸린">2?멸린</option><option value="3?멸린" selected>3?멸린</option>
                          <option value="4?멸린">4?멸린</option><option value="5?멸린">5?멸린</option><option value="6?멸린">6?멸린</option>
                        </select>
                      </div>
                      <div class="form-group mb-1">
                        <label class="form-label" style="font-size:0.75rem;">遺??遺꾨쪟</label>
                        <select class="form-select" id="joint-m3-pos" style="font-size:0.8rem;">
                          <option value="吏곴컖">吏곴컖</option><option value="?붽컖">?붽컖</option><option value="吏곸꽑" selected>吏곸꽑</option><option value="?붾뱶">?붾뱶</option>
                        </select>
                      </div>
                      <div class="form-group">
                        <label class="form-label" style="font-size:0.75rem;">湲덊삎 No.</label>
                        <input type="text" class="form-control" id="joint-m3-code" placeholder="?? M-03" style="font-size:0.8rem;" />
                      </div>
                    </div>
                  </div>
                </div>

                <!-- ???뺤텧?뚯옱 LOT / 遺?먯옱 LOT / 怨좊Т LOT -->
                <div class="clip-sub-card">
                  <label class="form-label mb-2" style="font-weight:700;color:var(--accent-amber);">?뵻 3. ?뺤텧?뚯옱 / 遺?먯옱 / 怨좊Т LOT No.</label>

                  <div style="font-size:0.8rem;font-weight:700;margin-bottom:0.35rem;color:var(--text-muted);">???뺤텧?뚯옱 LOT (A LH / B LH / C LH 횞 珥덈Ъ/以묐Ъ/醫낅Ъ)</div>
                  <div class="table-responsive mb-3">
                    <table class="data-table" style="font-size:0.8rem;">
                      <thead><tr><th>?뚯옱</th><th>珥덈Ъ LOT</th><th>以묐Ъ LOT</th><th>醫낅Ъ LOT</th></tr></thead>
                      <tbody>
                        <tr>
                          <td style="font-weight:700;">A LH</td>
                          <td><input type="text" class="form-control" id="joint-lot-a-init" placeholder="珥덈Ъ" /></td>
                          <td><input type="text" class="form-control" id="joint-lot-a-mid" placeholder="以묐Ъ" /></td>
                          <td><input type="text" class="form-control" id="joint-lot-a-fin" placeholder="醫낅Ъ" /></td>
                        </tr>
                        <tr>
                          <td style="font-weight:700;">B LH</td>
                          <td><input type="text" class="form-control" id="joint-lot-b-init" placeholder="珥덈Ъ" /></td>
                          <td><input type="text" class="form-control" id="joint-lot-b-mid" placeholder="以묐Ъ" /></td>
                          <td><input type="text" class="form-control" id="joint-lot-b-fin" placeholder="醫낅Ъ" /></td>
                        </tr>
                        <tr>
                          <td style="font-weight:700;">C LH</td>
                          <td><input type="text" class="form-control" id="joint-lot-c-init" placeholder="珥덈Ъ" /></td>
                          <td><input type="text" class="form-control" id="joint-lot-c-mid" placeholder="以묐Ъ" /></td>
                          <td><input type="text" class="form-control" id="joint-lot-c-fin" placeholder="醫낅Ъ" /></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>

                  <div class="grid-2">
                    <div>
                      <div style="font-size:0.8rem;font-weight:700;margin-bottom:0.4rem;color:var(--text-muted);">??遺?먯옱 LOT</div>
                      <div style="background:var(--surface);padding:0.5rem 0.6rem;border-radius:8px;border:1px solid var(--border-color);margin-bottom:0.4rem;">
                        <div style="font-size:0.75rem;font-weight:700;color:var(--accent-cyan);margin-bottom:0.3rem;">??DT CREW (吏곴컖)</div>
                        <div class="grid-2" style="gap:0.25rem;">
                          <div><label class="form-label" style="font-size:0.75rem;">吏곴컖 RH LOT</label><input type="text" class="form-control" id="joint-sub-crew-rh" placeholder="DT CREW 吏곴컖 RH" /></div>
                          <div><label class="form-label" style="font-size:0.75rem;">吏곴컖 LH LOT</label><input type="text" class="form-control" id="joint-sub-crew-lh" placeholder="DT CREW 吏곴컖 LH" /></div>
                        </div>
                      </div>
                      <div style="background:var(--surface);padding:0.5rem 0.6rem;border-radius:8px;border:1px solid var(--border-color);">
                        <div style="font-size:0.75rem;font-weight:700;color:var(--accent-purple);margin-bottom:0.3rem;">??DT QUAD (吏곴컖 + ?붽컖)</div>
                        <div class="grid-2" style="gap:0.25rem;">
                          <div><label class="form-label" style="font-size:0.75rem;">吏곴컖 RH LOT</label><input type="text" class="form-control" id="joint-sub-quad-ang-rh" placeholder="DT QUAD 吏곴컖 RH" /></div>
                          <div><label class="form-label" style="font-size:0.75rem;">吏곴컖 LH LOT</label><input type="text" class="form-control" id="joint-sub-quad-ang-lh" placeholder="DT QUAD 吏곴컖 LH" /></div>
                          <div><label class="form-label" style="font-size:0.75rem;">?붽컖 RH LOT</label><input type="text" class="form-control" id="joint-sub-quad-obt-rh" placeholder="DT QUAD ?붽컖 RH" /></div>
                          <div><label class="form-label" style="font-size:0.75rem;">?붽컖 LH LOT</label><input type="text" class="form-control" id="joint-sub-quad-obt-lh" placeholder="DT QUAD ?붽컖 LH" /></div>
                        </div>
                      </div>
                    </div>
                    <div>
                      <div style="font-size:0.8rem;font-weight:700;margin-bottom:0.4rem;color:var(--text-muted);">??怨좊Т紐?& 洹쒓꺽</div>
                      <div style="background:var(--surface);padding:0.75rem;border-radius:8px;border:1px solid var(--border-color);height:100%;">
                        <div style="font-size:0.85rem;font-weight:800;color:var(--accent-emerald);margin-bottom:0.5rem;">怨좊Т 洹쒓꺽: 60664$OS</div>
                        <label class="form-label" style="font-size:0.75rem;">怨좊Т LOT No.</label>
                        <input type="text" class="form-control" id="joint-rubber-lot" placeholder="怨좊Т LOT 踰덊샇 湲곗엯" />
                      </div>
                    </div>
                  </div>
                </div>

                <!-- ??媛瑜?議곌굔 痢≪젙 -->
                <div class="clip-sub-card">
                  <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:0.5rem;">
                    <label class="form-label mb-0" style="font-weight:700;color:var(--accent-purple);">?뵻 4. 媛瑜?議곌굔 痢≪젙 (?⑤룄 湲곗? 201짹10??/ ?쒓컙 湲곗? 90짹10珥?</label>
                    <span class="badge badge-purple" style="font-size:0.75rem;">踰붿쐞 珥덇낵 ???곸깋 ?쒖떆</span>
                  </div>
                  <div class="table-responsive">
                    <table class="data-table" style="font-size:0.78rem;">
                      <thead>
                        <tr>
                          <th rowspan="2" style="min-width:80px;">湲덊삎湲?/th>
                          <th colspan="3">珥덈Ъ</th>
                          <th colspan="3">以묐Ъ</th>
                          <th colspan="3">醫낅Ъ</th>
                        </tr>
                        <tr>
                          <th>?⑤룄 ??(??</th><th>?⑤룄 ??(??</th><th>?쒓컙 (珥?</th>
                          <th>?⑤룄 ??(??</th><th>?⑤룄 ??(??</th><th>?쒓컙 (珥?</th>
                          <th>?⑤룄 ??(??</th><th>?⑤룄 ??(??</th><th>?쒓컙 (珥?</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td style="font-weight:700;" id="joint-lbl-m1">#1 (1?멸린)</td>
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
                          <td style="font-weight:700;" id="joint-lbl-m2">#2 (2?멸린)</td>
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
                          <td style="font-weight:700;" id="joint-lbl-m3">#3 (3?멸린)</td>
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

                <!-- ???먭린遺덈웾 ?꾪솴 Matrix -->
                <div class="clip-sub-card">
                  <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:0.5rem;">
                    <label class="form-label mb-0" style="font-weight:700;color:var(--accent-amber);">?뵻 5. ?먭린遺덈웾 ?꾪솴 (A / B / C 횞 10醫?</label>
                    <div style="display:flex;align-items:center;gap:0.5rem;">
                      <span style="font-size:0.8rem;color:var(--text-muted);">珥?遺덈웾 ?⑷퀎:</span>
                      <input type="number" class="form-control" id="joint-defect-grand-total" readonly style="width:80px;color:var(--accent-rose);font-weight:800;" value="0" />
                    </div>
                  </div>
                  <div class="table-responsive">
                    <table class="data-table" style="font-size:0.78rem;">
                      <thead>
                        <tr>
                          <th>遺덈웾 ?좏삎</th>
                          <th>A (EA)</th><th>B (EA)</th><th>C (EA)</th>
                          <th>?뚭퀎</th>
                        </tr>
                      </thead>
                      <tbody id="joint-defect-matrix-body">
                        <!-- Dynamically rendered 10 items in JS -->
                      </tbody>
                    </table>
                  </div>
                </div>

                <!-- ??鍮꾧???諛쒖깮 湲곕줉 -->
                <div class="clip-sub-card">
                  <label class="form-label mb-2" style="font-weight:700;color:var(--accent-rose);">?뵻 6. 鍮꾧???諛쒖깮 湲곕줉 (?좏삎 / 諛쒖깮?쒓컙 / ?꾨즺?쒓컙 / ?뚯슂?쒓컙)</label>
                  <div style="display:grid;grid-template-columns:1.3fr 1.8fr 0.7fr auto;gap:0.5rem;align-items:end;margin-bottom:0.5rem;">
                    <div>
                      <label class="form-label" style="font-size:0.75rem;">諛쒖깮 ?좏삎</label>
                      <select class="form-select" id="joint-act-type">
                        <option value="?먯옱寃고뭹">?먯옱寃고뭹</option>
                        <option value="?ㅻ퉬?섎━">?ㅻ퉬?섎━</option>
                        <option value="湲덊삎?섎━">湲덊삎?섎━</option>
                        <option value="?묒뾽以鍮?>?묒뾽以鍮?/option>
                        <option value="3??S">3??S</option>
                        <option value="洹쇳깭愿由?>洹쇳깭愿由?/option>
                        <option value="援먯쑁">援먯쑁</option>
                        <option value="湲고?">湲고?</option>
                      </select>
                    </div>
                    <div>
                      <label class="form-label" style="font-size:0.75rem;">諛쒖깮?쒓컙 &nbsp;/&nbsp; ?꾨즺?쒓컙</label>
                      <div style="display:flex;gap:0.3rem;align-items:center;">
                        <input type="time" class="form-control" id="joint-act-start" />
                        <span style="color:var(--text-muted);font-size:0.8rem;">~</span>
                        <input type="time" class="form-control" id="joint-act-end" />
                      </div>
                    </div>
                    <div>
                      <label class="form-label" style="font-size:0.75rem;">?뚯슂?쒓컙 (遺?</label>
                      <input type="number" class="form-control" id="joint-act-min" readonly placeholder="?먮룞?곗텧" />
                    </div>
                    <div>
                      <button type="button" class="btn btn-primary btn-sm" id="btn-add-joint-act" style="margin-bottom:2px;">+ 異붽?</button>
                    </div>
                  </div>
                  <div id="joint-act-list" style="font-size:0.8rem;min-height:28px;">
                    <!-- Logged items appear here -->
                  </div>
                </div>

                <!-- ????3???먭? -->
                <div class="clip-sub-card mb-0">
                  <label class="form-label mb-2" style="font-weight:700;color:var(--accent-emerald);">?뵻 7. ??3???먭? ???쒖뾽 ??/ ?묒뾽 以?/ ?묒뾽 ??(湲덊삎 泥?냼 & ?留됲옒)</label>
                  <div class="table-responsive">
                    <table class="data-table" style="font-size:0.8rem;">
                      <thead>
                        <tr>
                          <th style="min-width:90px;">援щ텇</th>
                          <th>?쒖뾽 ???쒓컖</th>
                          <th>?묒뾽 以??쒓컖</th>
                          <th>?묒뾽 ???쒓컖</th>
                          <th>?댁긽 ?좊Т</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td style="font-weight:700;">湲덊삎 泥?냼<br/><span style="font-size:0.7rem;color:var(--text-muted);font-weight:400;">??3???ㅼ떆</span></td>
                          <td><input type="time" class="form-control" id="joint-clean-before" /></td>
                          <td><input type="time" class="form-control" id="joint-clean-during" /></td>
                          <td><input type="time" class="form-control" id="joint-clean-after" /></td>
                          <td>
                            <select class="form-select" id="joint-clean-result" style="font-size:0.78rem;">
                              <option value="?뺤긽">???뺤긽</option>
                              <option value="?댁긽">?좑툘 ?댁긽</option>
                            </select>
                          </td>
                        </tr>
                        <tr>
                          <td style="font-weight:700;">?留됲옒 ?뺤씤<br/><span style="font-size:0.7rem;color:var(--text-muted);font-weight:400;">??3???ㅼ떆</span></td>
                          <td><input type="time" class="form-control" id="joint-hole-before" /></td>
                          <td><input type="time" class="form-control" id="joint-hole-during" /></td>
                          <td><input type="time" class="form-control" id="joint-hole-after" /></td>
                          <td>
                            <select class="form-select" id="joint-hole-result" style="font-size:0.78rem;">
                              <option value="?뺤긽">???뺤긽</option>
                              <option value="?댁긽">?좑툘 ?댁긽</option>
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
                <div class="card-title"><i class="ri-file-edit-line"></i> 2. ?앹궛 ?섎웾 &amp; 鍮꾧????낅젰</div>',
$jointCardHTML + '              <div class="card-header">
                <div class="card-title"><i class="ri-file-edit-line"></i> 2. ?앹궛 ?섎웾 &amp; 鍮꾧????낅젰</div>'
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

    const isClip = (proc?.name || '').includes('?대┰癒몄떊') || (proc?.id || '').includes('clip');
    container.querySelector('#clip-spec-card').style.display = isClip ? 'block' : 'none';
    if (isClip) this._initClipCard(container);

    const isPrep = (proc?.name || '').includes('?뚯옱以鍮?) || (proc?.id || '').includes('prep');
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

    const isClip = (proc?.name || '').includes('?대┰癒몄떊') || (proc?.id || '').includes('clip');
    container.querySelector('#clip-spec-card').style.display = isClip ? 'block' : 'none';
    if (isClip) this._initClipCard(container);

    const isPrep = (proc?.name || '').includes('?뚯옱以鍮?) || (proc?.id || '').includes('prep');
    container.querySelector('#prep-spec-card').style.display = isPrep ? 'block' : 'none';
    if (isPrep) this._initPrepCard(container, proc);
    
    const isJoint = (proc?.name || '').includes('議곗씤??) || (proc?.id || '').includes('joint');
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
'@

$pop_log_new = @'
  _populateLogUI(container) {
    const log = this.currentLog;
    const pwBadge = container.querySelector('#prework-status-badge');
    const pwBtn = container.querySelector('#btn-prework-submit');

    if (pwBadge && pwBtn) {
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
'@

$save_log_new = @'
  _saveLog(container, status) {
    if (!this.currentLog) return;
    if (!this.currentLog.preWorkDone) { alert('?묒뾽 ?쒖옉 ???먭? ?쇱?瑜?癒쇱? ?쒖텧??二쇱꽭??'); return; }
    if (status === 'SUBMITTED' && !confirm('理쒖쥌 ?쒖텧 ?꾩뿉???섏젙??遺덇??ν빀?덈떎. ?쒖텧?섏떆寃좎뒿?덇퉴?')) return;

    const isJoint = this.currentLog.processName?.includes('議곗씤??) || this.currentLog.processId?.includes('joint');

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

    const isClip = this.currentLog.processName?.includes('?대┰癒몄떊') || this.currentLog.processId?.includes('clip');
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
      const m1 = container.querySelector('#joint-m1-no')?.value || '1?멸린';
      const m2 = container.querySelector('#joint-m2-no')?.value || '2?멸린';
      const m3 = container.querySelector('#joint-m3-no')?.value || '3?멸린';
      
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

    const defectTypes = ['?⑥뼱吏?李?뼱吏?, '??遺議?, '諛由??щ옓', '湲고룷', '?뱁옒/?쎌엯遺덈웾', '?섏묠/?ㅻ쾭??, '?꾨???, '?대Ъ吏?, '瑗ъ엫', '湲고?'];
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
          alert('諛쒖깮?쒓컙怨??꾨즺?쒓컙??紐⑤몢 ?낅젰?섏꽭??'); return;
        }
        const itemHtml = `<div style="display:flex;justify-content:space-between;padding:0.25rem 0;border-bottom:1px solid #eee;">
          <span><strong>${type}</strong> (${startInp.value} ~ ${endInp.value})</span>
          <span style="color:var(--accent-rose);font-weight:700;">${minInp.value}遺?/span>
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
