require "spec_helper"

RSpec.describe IsoDoc do
  it "processes IsoXML bibliographies" do
    expect(IsoDoc::HtmlConvert.new({}).convert("test", <<~"INPUT", true)).to be_equivalent_to <<~"OUTPUT"
    <iso-standard xmlns="http://riboseinc.com/isoxml">
    <bibdata>
    <language>en</language>
    </bibdata>
    <preface><foreword>
  <p id="_f06fd0d1-a203-4f3d-a515-0bdba0f8d83f">
  <eref bibitemid="ISO712"/>
  <eref bibitemid="ISBN"/>
  <eref bibitemid="ISSN"/>
  <eref bibitemid="ISO16634"/>
  <eref bibitemid="ref1"/>
  <eref bibitemid="ref10"/>
  </p>
    </foreword></preface>
    <bibliography><references id="_normative_references" obligation="informative"><title>Normative References</title>
    <p>The following documents are referred to in the text in such a way that some or all of their content constitutes requirements of this document. For dated references, only the edition cited applies. For undated references, the latest edition of the referenced document (including any amendments) applies.</p>
<bibitem id="ISO712" type="standard">
  <title format="text/plain">Cereals or cereal products</title>
  <title type="main" format="text/plain">Cereals and cereal products</title>
  <docidentifier type="ISO">ISO 712</docidentifier>
  <contributor>
    <role type="publisher"/>
    <organization>
      <name>International Organization for Standardization</name>
    </organization>
  </contributor>
</bibitem>
<bibitem id="ISO16634" type="standard">
  <title language="x" format="text/plain">Cereals, pulses, milled cereal products, xxxx, oilseeds and animal feeding stuffs</title>
  <title language="en" format="text/plain">Cereals, pulses, milled cereal products, oilseeds and animal feeding stuffs</title>
  <docidentifier type="ISO">ISO 16634:-- (all parts)</docidentifier>
  <date type="published"><on>--</on></date>
  <contributor>
    <role type="publisher"/>
    <organization>
      <abbreviation>ISO</abbreviation>
    </organization>
  </contributor>
  <note format="text/plain" reference="1">ISO DATE: Under preparation. (Stage at the time of publication ISO/DIS 16634)</note>
  <extent type="part">
  <referenceFrom>all</referenceFrom>
  </extent>

</bibitem>
<bibitem id="ISO20483" type="standard">
  <title format="text/plain">Cereals and pulses</title>
  <docidentifier type="ISO">ISO 20483:2013-2014</docidentifier>
  <date type="published"><from>2013</from><to>2014</to></date>
  <contributor>
    <role type="publisher"/>
    <organization>
      <name>International Organization for Standardization</name>
    </organization>
  </contributor>
</bibitem>
<bibitem id="ref1">
  <formattedref format="application/x-isodoc+xml"><smallcap>Standard No I.C.C 167</smallcap>. <em>Determination of the protein content in cereal and cereal products for food and animal feeding stuffs according to the Dumas combustion method</em> (see <link target="http://www.icc.or.at"/>)</formattedref>
  <docidentifier type="ICC">167</docidentifier>
</bibitem>

</references><references id="_bibliography" obligation="informative">
  <title>Bibliography</title>
<bibitem id="ISBN" type="ISBN">
  <title format="text/plain">Chemicals for analytical laboratory use</title>
  <docidentifier type="ISBN">ISBN</docidentifier>
  <contributor>
    <role type="publisher"/>
    <organization>
      <abbreviation>ISBN</abbreviation>
    </organization>
  </contributor>
</bibitem>
<bibitem id="ISSN" type="ISSN">
  <title format="text/plain">Instruments for analytical laboratory use</title>
  <docidentifier type="ISSN">ISSN</docidentifier>
  <contributor>
    <role type="publisher"/>
    <organization>
      <abbreviation>ISSN</abbreviation>
    </organization>
  </contributor>
</bibitem>
<bibitem id="ISO3696" type="standard">
  <title format="text/plain">Water for analytical laboratory use</title>
  <docidentifier type="ISO">ISO 3696</docidentifier>
  <contributor>
    <role type="publisher"/>
    <organization>
      <abbreviation>ISO</abbreviation>
    </organization>
  </contributor>
</bibitem>
<bibitem id="ref10">
  <formattedref format="application/x-isodoc+xml"><smallcap>Standard No I.C.C 167</smallcap>. <em>Determination of the protein content in cereal and cereal products for food and animal feeding stuffs according to the Dumas combustion method</em> (see <link target="http://www.icc.or.at"/>)</formattedref>
  <docidentifier type="metanorma">[10]</docidentifier>
</bibitem>
<bibitem id="ref11">
  <title>Internet Calendaring and Scheduling Core Object Specification (iCalendar)</title>
  <docidentifier type="IETF">RFC 10</docidentifier>
</bibitem>
<bibitem id="ref12">
  <formattedref format="application/x-isodoc+xml">CitationWorks. 2019. <em>How to cite a reference</em>.</formattedref>
  <docidentifier type="metanorma">[Citn]</docidentifier>
</bibitem>


</references>
</bibliography>
    </iso-standard>
    INPUT
    #{HTML_HDR}
               <br/>
               <div>
                 <h1 class="ForewordTitle">Foreword</h1>
                 <p id="_f06fd0d1-a203-4f3d-a515-0bdba0f8d83f">
         <a href="#ISO712">ISO 712</a>
         <a href="#ISO16634">ISO 16634:-- (all parts)</a>
         <a href="#ref1">ICC 167</a>
         <a href="#ref10">[10]</a>
         </p>
               </div>
               <p class="zzSTDTitle1"/>
               <div>
                 <h1>1.&#160; Normative references</h1>
                 <p>The following documents are referred to in the text in such a way that some or all of their content constitutes requirements of this document. For dated references, only the edition cited applies. For undated references, the latest edition of the referenced document (including any amendments) applies.</p>
                 <p id="ISO712" class="NormRef">ISO 712, <i> Cereals and cereal products</i></p>
                 <p id="ISO16634" class="NormRef">ISO 16634:-- (all parts)<a rel="footnote" href="#fn:1" epub:type="footnote"><sup>1</sup></a>, <i> Cereals, pulses, milled cereal products, oilseeds and animal feeding stuffs</i></p>
                 <p id="ISO20483" class="NormRef">ISO 20483:2013-2014, <i> Cereals and pulses</i></p>
                 <p id="ref1" class="NormRef">ICC 167, <span style="font-variant:small-caps;">Standard No I.C.C 167</span>. <i>Determination of the protein content in cereal and cereal products for food and animal feeding stuffs according to the Dumas combustion method</i> (see <a href="http://www.icc.or.at">http://www.icc.or.at</a>)</p>
               </div>
               <br/>
               <div>
                 <h1 class="Section3">Bibliography</h1>
                 <p id="ISO3696" class="Biblio">[1]&#160; ISO 3696, <i> Water for analytical laboratory use</i></p>
                 <p id="ref10" class="Biblio">[10]&#160; <span style="font-variant:small-caps;">Standard No I.C.C 167</span>. <i>Determination of the protein content in cereal and cereal products for food and animal feeding stuffs according to the Dumas combustion method</i> (see <a href="http://www.icc.or.at">http://www.icc.or.at</a>)</p>
                  <p id="ref11" class="Biblio">[3]&#160; IETF RFC 10, <i>Internet Calendaring and Scheduling Core Object Specification (iCalendar)</i></p>
               </div>
               <aside id="fn:1" class="footnote">
         <p>Under preparation. (Stage at the time of publication ISO/DIS 16634)</p>
       </aside>
             </div>
           </body>
       </html>
    OUTPUT
  end

end
