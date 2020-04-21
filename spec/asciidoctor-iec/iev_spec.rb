require "spec_helper"
require "fileutils"

RSpec.describe Asciidoctor::Iec do
  it "generates reference boilerplate for IEV" do
     expect(xmlpp(strip_guid(Asciidoctor.convert(<<~"INPUT", backend: :iec, header_footer: true)))).to be_equivalent_to xmlpp(<<~"OUTPUT")
      = Document title
      Author
      :docfile: test.adoc
      :nodoc:
      :novalid:
      :no-isobib:
      :docnumber: 60050

      [bibliography]
      == Normative References

      * [[[A,B]]], _TITLE_
    INPUT
<?xml version='1.0' encoding='UTF-8'?>
       <iec-standard xmlns='https://www.metanorma.org/ns/iec'>
         <bibdata type='standard'>
           <docidentifier type='iso'>IEC 60050 ED 1</docidentifier>
           <docnumber>60050</docnumber>
           <contributor>
             <role type='author'/>
             <organization>
               <name>International Electrotechnical Commission</name>
               <abbreviation>IEC</abbreviation>
             </organization>
           </contributor>
           <contributor>
             <role type='publisher'/>
             <organization>
               <name>International Electrotechnical Commission</name>
               <abbreviation>IEC</abbreviation>
             </organization>
           </contributor>
           <language>en</language>
           <script>Latn</script>
           <status>
             <stage abbreviation="PPUB">60</stage>
             <substage abbreviation="PPUB">60</substage>
           </status>
           <copyright>
             <from>2020</from>
             <owner>
               <organization>
                 <name>International Electrotechnical Commission</name>
                 <abbreviation>IEC</abbreviation>
               </organization>
             </owner>
           </copyright>
           <ext>
             <doctype>article</doctype>
             <editorialgroup>
               <technical-committee/>
               <subcommittee/>
               <workgroup/>
             </editorialgroup>
             <structuredidentifier>
               <project-number>IEC 60050</project-number>
             </structuredidentifier>
                   <stagename>International standard</stagename>
           </ext>
         </bibdata>
         #{BOILERPLATE}
         <sections> </sections>
         <bibliography>
           <references id='_' obligation='informative'>
             <title>Normative References</title>
             <p id='_'>There are no normative references in this document.</p>
             <bibitem id='A'>
               <formattedref format='application/x-isodoc+xml'>
                 <em>TITLE</em>
               </formattedref>
               <docidentifier>B</docidentifier>
             </bibitem>
           </references>
         </bibliography>
       </iec-standard>
    OUTPUT
  end

      it "generates terms boilerplate for IEV" do
     expect(xmlpp(strip_guid(Asciidoctor.convert(<<~"INPUT", backend: :iec, header_footer: true)))).to be_equivalent_to xmlpp(<<~"OUTPUT")
      = Document title
      Author
      :docfile: test.adoc
      :nodoc:
      :novalid:
      :no-isobib:
      :docnumber: 60050

      == Terms and definitions
      === General
      ==== Term 1
INPUT
<iec-standard xmlns='https://www.metanorma.org/ns/iec'>
  <bibdata type='standard'>
    <docidentifier type='iso'>IEC 60050 ED 1</docidentifier>
    <docnumber>60050</docnumber>
    <contributor>
      <role type='author'/>
      <organization>
        <name>International Electrotechnical Commission</name>
        <abbreviation>IEC</abbreviation>
      </organization>
    </contributor>
    <contributor>
      <role type='publisher'/>
      <organization>
        <name>International Electrotechnical Commission</name>
        <abbreviation>IEC</abbreviation>
      </organization>
    </contributor>
    <language>en</language>
    <script>Latn</script>
    <status>
      <stage abbreviation="PPUB">60</stage>
      <substage abbreviation="PPUB">60</substage>
    </status>
    <copyright>
      <from>2020</from>
      <owner>
        <organization>
          <name>International Electrotechnical Commission</name>
          <abbreviation>IEC</abbreviation>
        </organization>
      </owner>
    </copyright>
    <ext>
      <doctype>article</doctype>
      <editorialgroup>
        <technical-committee/>
        <subcommittee/>
        <workgroup/>
      </editorialgroup>
      <structuredidentifier>
        <project-number>IEC 60050</project-number>
      </structuredidentifier>
      <stagename>International standard</stagename>
    </ext>
  </bibdata>
           #{BOILERPLATE}
  <sections>
    <clause id='_' obligation='normative'>
      <title>Terms and definitions</title>
      <terms id='_' obligation='normative'>
        <title>General</title>
        <term id='_'>
          <preferred>Term 1</preferred>
        </term>
      </terms>
    </clause>
  </sections>
</iec-standard>

OUTPUT
  end
end
