<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<!-- head태그. header.jsp말고 -->
	<%@ include file="../../include/bhead.jsp"%>
</head>
<body class="fix-header card-no-border logo-center">

	<!-- Main wrapper -->
	<div id="main-wrapper">
	
        <!-- Topbar header - style you can find in pages.scss -->
        <header class="topbar">
        	<%@ include file="../../include/btopbarheader.jsp" %>
        </header>
        <!-- End Topbar header -->
        
        <!-- Left-sidebar -->
        <aside class="left-sidebar">
        	<%@ include file="../../include/bsidebar.jsp" %>
        </aside>
        <!-- End of Left-sidebar -->

		<!-- Page wrapper  -->
        <div class="page-wrapper">

        	<!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-5 col-12 align-self-center">
                        <h3 class="text-themecolor mb-0 mt-0">Forms</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                            <li class="breadcrumb-item active">Form</li>
                        </ol>
                    </div>
                    <div class="col-md-7 col-12 align-self-center d-none d-md-block">
                        <div class="d-flex mt-2 justify-content-end">
                            <div class="d-flex mr-3 ml-2">
                                <div class="chart-text mr-2">
                                    <h6 class="mb-0"><small>THIS MONTH</small></h6>
                                    <h4 class="mt-0 text-info">$58,356</h4>
                                </div>
                                <div class="spark-chart">
                                    <div id="monthchart"></div>
                                </div>
                            </div>
                            <div class="d-flex mr-3 ml-2">
                                <div class="chart-text mr-2">
                                    <h6 class="mb-0"><small>LAST MONTH</small></h6>
                                    <h4 class="mt-0 text-primary">$48,356</h4>
                                </div>
                                <div class="spark-chart">
                                    <div id="lastmonthchart"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <!-- Row -->
                <div class="row">
                    <!-- column -->
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Multiple Select</h4>
                                <h6 class="card-subtitle"> Use a <code>select multiple</code> as your input element.
                                </h6>
                                <div class="row">
                                    <div class="col-lg-6 col-xlg-4  mb-4">
                                        <h5 class="p-2 rounded-title">Pre-selected options</h5>
                                        <select id="pre-selected-options" multiple="multiple" style="position: absolute; left: -9999px;">
                                            <option value="elem_1">elem 1</option>
                                            <option value="elem_2">elem 2</option>
                                            <option value="elem_3">elem 3</option>
                                            <option value="elem_4" selected="">elem 4</option>
                                            <option value="elem_5" selected="">elem 5</option>
                                            <option value="elem_6">elem 6</option>
                                            <option value="elem_7">elem 7</option>
                                            <option value="elem_8">elem 8</option>
                                            <option value="elem_9">elem 9</option>
                                            <option value="elem_10">elem 10</option>
                                            <option value="elem_11">elem 11</option>
                                            <option value="elem_12">elem 12</option>
                                            <option value="elem_13">elem 13</option>
                                            <option value="elem_14">elem 14</option>
                                            <option value="elem_15">elem 15</option>
                                            <option value="elem_16">elem 16</option>
                                            <option value="elem_17">elem 17</option>
                                            <option value="elem_18">elem 18</option>
                                            <option value="elem_19">elem 19</option>
                                            <option value="elem_20">elem 20</option>
                                        </select><div class="ms-container" id="ms-pre-selected-options"><div class="ms-selectable"><ul class="ms-list" tabindex="-1"><li class="ms-elem-selectable" id="-1300566143-selectable"><span>elem 1</span></li><li class="ms-elem-selectable ms-hover" id="-1300566142-selectable" style=""><span>elem 2</span></li><li class="ms-elem-selectable" id="-1300566141-selectable" style=""><span>elem 3</span></li><li selected="" class="ms-elem-selectable" id="-1300566140-selectable" style=""><span>elem 4</span></li><li selected="" class="ms-elem-selectable" id="-1300566139-selectable" style=""><span>elem 5</span></li><li class="ms-elem-selectable" id="-1300566138-selectable" style=""><span>elem 6</span></li><li class="ms-elem-selectable" id="-1300566137-selectable" style=""><span>elem 7</span></li><li class="ms-elem-selectable" id="-1300566136-selectable" style=""><span>elem 8</span></li><li class="ms-elem-selectable" id="-1300566135-selectable" style=""><span>elem 9</span></li><li class="ms-elem-selectable" id="-1662844721-selectable" style=""><span>elem 10</span></li><li class="ms-elem-selectable" id="-1662844720-selectable" style=""><span>elem 11</span></li><li class="ms-elem-selectable" id="-1662844719-selectable" style=""><span>elem 12</span></li><li class="ms-elem-selectable" id="-1662844718-selectable" style=""><span>elem 13</span></li><li class="ms-elem-selectable" id="-1662844717-selectable" style=""><span>elem 14</span></li><li class="ms-elem-selectable" id="-1662844716-selectable" style=""><span>elem 15</span></li><li class="ms-elem-selectable" id="-1662844715-selectable" style=""><span>elem 16</span></li><li class="ms-elem-selectable" id="-1662844714-selectable" style=""><span>elem 17</span></li><li class="ms-elem-selectable" id="-1662844713-selectable" style=""><span>elem 18</span></li><li class="ms-elem-selectable" id="-1662844712-selectable" style=""><span>elem 19</span></li><li class="ms-elem-selectable" id="-1662844690-selectable" style=""><span>elem 20</span></li></ul></div><div class="ms-selection"><ul class="ms-list" tabindex="-1"><li class="ms-elem-selection" id="-1300566143-selection" style="display: none;"><span>elem 1</span></li><li class="ms-elem-selection ms-hover" id="-1300566142-selection" style="display: none;"><span>elem 2</span></li><li class="ms-elem-selection ms-hover" id="-1300566141-selection" style="display: none;"><span>elem 3</span></li><li selected="" class="ms-elem-selection ms-hover" id="-1300566140-selection" style="display: none;"><span>elem 4</span></li><li selected="" class="ms-elem-selection ms-hover" id="-1300566139-selection" style="display: none;"><span>elem 5</span></li><li class="ms-elem-selection ms-hover" id="-1300566138-selection" style="display: none;"><span>elem 6</span></li><li class="ms-elem-selection ms-hover" id="-1300566137-selection" style="display: none;"><span>elem 7</span></li><li class="ms-elem-selection ms-hover" id="-1300566136-selection" style="display: none;"><span>elem 8</span></li><li class="ms-elem-selection ms-hover" id="-1300566135-selection" style="display: none;"><span>elem 9</span></li><li class="ms-elem-selection ms-hover" id="-1662844721-selection" style="display: none;"><span>elem 10</span></li><li class="ms-elem-selection ms-hover" id="-1662844720-selection" style="display: none;"><span>elem 11</span></li><li class="ms-elem-selection ms-hover" id="-1662844719-selection" style="display: none;"><span>elem 12</span></li><li class="ms-elem-selection ms-hover" id="-1662844718-selection" style="display: none;"><span>elem 13</span></li><li class="ms-elem-selection ms-hover" id="-1662844717-selection" style="display: none;"><span>elem 14</span></li><li class="ms-elem-selection ms-hover" id="-1662844716-selection" style="display: none;"><span>elem 15</span></li><li class="ms-elem-selection ms-hover" id="-1662844715-selection" style="display: none;"><span>elem 16</span></li><li class="ms-elem-selection ms-hover" id="-1662844714-selection" style="display: none;"><span>elem 17</span></li><li class="ms-elem-selection ms-hover" id="-1662844713-selection" style="display: none;"><span>elem 18</span></li><li class="ms-elem-selection ms-hover" id="-1662844712-selection" style="display: none;"><span>elem 19</span></li><li class="ms-elem-selection ms-hover" id="-1662844690-selection" style="display: none;"><span>elem 20</span></li></ul></div></div>
                                    </div>
                                    <div class="col-lg-6 col-xlg-4">
                                        <h5 class="p-2 rounded-title">Optgroup</h5>
                                        <select multiple="" id="optgroup" name="optgroup[]" style="position: absolute; left: -9999px;">
                                            <optgroup label="Friends">
                                                <option value="1">Yoda</option>
                                                <option value="2" selected="" disabled="">Obiwan</option>
                                            </optgroup>
                                            <optgroup label="Enemies">
                                                <option value="3">Palpatine</option>
                                                <option value="4" disabled="">Darth Vader</option>
                                            </optgroup>
                                        </select><div class="ms-container" id="ms-optgroup"><div class="ms-selectable"><ul class="ms-list" tabindex="-1"><li class="ms-optgroup-container" id="optgroup-selectable-1064558965"><ul class="ms-optgroup"><li class="ms-optgroup-label"><span>Friends</span></li><li class="ms-elem-selectable" id="49-selectable"><span>Yoda</span></li><li selected="" class="ms-elem-selectable disabled ms-selected" id="50-selectable" style="display: none;"><span>Obiwan</span></li></ul></li><li class="ms-optgroup-container" id="optgroup-selectable-59078150"><ul class="ms-optgroup"><li class="ms-optgroup-label"><span>Enemies</span></li><li class="ms-elem-selectable ms-hover" id="51-selectable"><span>Palpatine</span></li><li class="ms-elem-selectable disabled" id="52-selectable"><span>Darth Vader</span></li></ul></li></ul></div><div class="ms-selection"><ul class="ms-list" tabindex="-1"><li class="ms-optgroup-container" id="optgroup-selection-1064558965"><ul class="ms-optgroup"><li class="ms-optgroup-label" style=""><span>Friends</span></li><li class="ms-elem-selection" id="49-selection" style="display: none;"><span>Yoda</span></li><li selected="" class="ms-elem-selection disabled ms-selected" id="50-selection" style=""><span>Obiwan</span></li></ul></li><li class="ms-optgroup-container" id="optgroup-selection-59078150"><ul class="ms-optgroup"><li class="ms-optgroup-label" style="display: none;"><span>Enemies</span></li><li class="ms-elem-selection" id="51-selection" style="display: none;"><span>Palpatine</span></li><li class="ms-elem-selection disabled" id="52-selection" style="display: none;"><span>Darth Vader</span></li></ul></li></ul></div></div>
                                    </div>
                                    <div class="col-lg-12 col-xlg-4">
                                        <h5 class="p-2 rounded-title">Public methods</h5>
                                        <select multiple="" id="public-methods" name="public-methods[]" style="position: absolute; left: -9999px;"><option value="42">test 42</option>
                                            <option value="elem_1">elem 1</option>
                                            <option value="elem_2" disabled="">elem 2</option>
                                            <option value="elem_3">elem 3</option>
                                            <option value="elem_4">elem 4</option>
                                            <option value="elem_5">elem 5</option>
                                            <option value="elem_6">elem 6</option>
                                            <option value="elem_7">elem 7</option>
                                            <option value="elem_8">elem 8</option>
                                            <option value="elem_9">elem 9</option>
                                            <option value="elem_10">elem 10</option>
                                            <option value="elem_11">elem 11</option>
                                            <option value="elem_12">elem 12</option>
                                            <option value="elem_13">elem 13</option>
                                            <option value="elem_14">elem 14</option>
                                            <option value="elem_15">elem 15</option>
                                            <option value="elem_16">elem 16</option>
                                            <option value="elem_17">elem 17</option>
                                            <option value="elem_18">elem 18</option>
                                            <option value="elem_19">elem 19</option>
                                            <option value="elem_20">elem 20</option>
                                            <option value="elem_21">elem 21</option>
                                            <option value="elem_22">elem 22</option>
                                            <option value="elem_23">elem 23</option>
                                            <option value="elem_24">elem 24</option>
                                            <option value="elem_25">elem 25</option>
                                            <option value="elem_26">elem 26</option>
                                            <option value="elem_27">elem 27</option>
                                            <option value="elem_28">elem 28</option>
                                            <option value="elem_29">elem 29</option>
                                            <option value="elem_30">elem 30</option>
                                            <option value="elem_31">elem 31</option>
                                            <option value="elem_32">elem 32</option>
                                            <option value="elem_33">elem 33</option>
                                            <option value="elem_34">elem 34</option>
                                            <option value="elem_35">elem 35</option>
                                            <option value="elem_36">elem 36</option>
                                            <option value="elem_37">elem 37</option>
                                            <option value="elem_38">elem 38</option>
                                            <option value="elem_39">elem 39</option>
                                            <option value="elem_40">elem 40</option>
                                            <option value="elem_41">elem 41</option>
                                            <option value="elem_42">elem 42</option>
                                            <option value="elem_43">elem 43</option>
                                            <option value="elem_44">elem 44</option>
                                            <option value="elem_45">elem 45</option>
                                            <option value="elem_46">elem 46</option>
                                            <option value="elem_47">elem 47</option>
                                            <option value="elem_48">elem 48</option>
                                            <option value="elem_49">elem 49</option>
                                            <option value="elem_50">elem 50</option>
                                            <option value="elem_51">elem 51</option>
                                            <option value="elem_52">elem 52</option>
                                            <option value="elem_53">elem 53</option>
                                            <option value="elem_54">elem 54</option>
                                            <option value="elem_55">elem 55</option>
                                            <option value="elem_56">elem 56</option>
                                            <option value="elem_57">elem 57</option>
                                            <option value="elem_58">elem 58</option>
                                            <option value="elem_59">elem 59</option>
                                            <option value="elem_60">elem 60</option>
                                            <option value="elem_61">elem 61</option>
                                            <option value="elem_62">elem 62</option>
                                            <option value="elem_63">elem 63</option>
                                            <option value="elem_64">elem 64</option>
                                            <option value="elem_65">elem 65</option>
                                            <option value="elem_66">elem 66</option>
                                            <option value="elem_67">elem 67</option>
                                            <option value="elem_68">elem 68</option>
                                            <option value="elem_69">elem 69</option>
                                            <option value="elem_70">elem 70</option>
                                            <option value="elem_71">elem 71</option>
                                            <option value="elem_72">elem 72</option>
                                            <option value="elem_73">elem 73</option>
                                            <option value="elem_74">elem 74</option>
                                            <option value="elem_75">elem 75</option>
                                            <option value="elem_76">elem 76</option>
                                            <option value="elem_77">elem 77</option>
                                            <option value="elem_78">elem 78</option>
                                            <option value="elem_79">elem 79</option>
                                            <option value="elem_80">elem 80</option>
                                            <option value="elem_81">elem 81</option>
                                            <option value="elem_82">elem 82</option>
                                            <option value="elem_83">elem 83</option>
                                            <option value="elem_84">elem 84</option>
                                            <option value="elem_85">elem 85</option>
                                            <option value="elem_86">elem 86</option>
                                            <option value="elem_87">elem 87</option>
                                            <option value="elem_88">elem 88</option>
                                            <option value="elem_89">elem 89</option>
                                            <option value="elem_90">elem 90</option>
                                            <option value="elem_91">elem 91</option>
                                            <option value="elem_92">elem 92</option>
                                            <option value="elem_93">elem 93</option>
                                            <option value="elem_94">elem 94</option>
                                            <option value="elem_95">elem 95</option>
                                            <option value="elem_96">elem 96</option>
                                            <option value="elem_97">elem 97</option>
                                            <option value="elem_98">elem 98</option>
                                            <option value="elem_99">elem 99</option>
                                            <option value="elem_100">elem 100</option>
                                            <option value="elem_101">elem 101</option>
                                            <option value="elem_102">elem 102</option>
                                            <option value="elem_103">elem 103</option>
                                            <option value="elem_104">elem 104</option>
                                            <option value="elem_105">elem 105</option>
                                            <option value="elem_106">elem 106</option>
                                            <option value="elem_107">elem 107</option>
                                            <option value="elem_108">elem 108</option>
                                            <option value="elem_109">elem 109</option>
                                            <option value="elem_110">elem 110</option>
                                            <option value="elem_111">elem 111</option>
                                            <option value="elem_112">elem 112</option>
                                            <option value="elem_113">elem 113</option>
                                            <option value="elem_114">elem 114</option>
                                            <option value="elem_115">elem 115</option>
                                            <option value="elem_116">elem 116</option>
                                            <option value="elem_117">elem 117</option>
                                            <option value="elem_118">elem 118</option>
                                            <option value="elem_119">elem 119</option>
                                            <option value="elem_120">elem 120</option>
                                            <option value="elem_121">elem 121</option>
                                            <option value="elem_122">elem 122</option>
                                            <option value="elem_123">elem 123</option>
                                            <option value="elem_124">elem 124</option>
                                            <option value="elem_125">elem 125</option>
                                            <option value="elem_126">elem 126</option>
                                            <option value="elem_127">elem 127</option>
                                            <option value="elem_128">elem 128</option>
                                            <option value="elem_129">elem 129</option>
                                            <option value="elem_130">elem 130</option>
                                            <option value="elem_131">elem 131</option>
                                            <option value="elem_132">elem 132</option>
                                            <option value="elem_133">elem 133</option>
                                            <option value="elem_134">elem 134</option>
                                            <option value="elem_135">elem 135</option>
                                            <option value="elem_136">elem 136</option>
                                            <option value="elem_137">elem 137</option>
                                            <option value="elem_138">elem 138</option>
                                            <option value="elem_139">elem 139</option>
                                            <option value="elem_140">elem 140</option>
                                            <option value="elem_141">elem 141</option>
                                            <option value="elem_142">elem 142</option>
                                            <option value="elem_143">elem 143</option>
                                            <option value="elem_144">elem 144</option>
                                            <option value="elem_145">elem 145</option>
                                            <option value="elem_146">elem 146</option>
                                            <option value="elem_147">elem 147</option>
                                            <option value="elem_148">elem 148</option>
                                            <option value="elem_149">elem 149</option>
                                            <option value="elem_150">elem 150</option>
                                            <option value="elem_151">elem 151</option>
                                            <option value="elem_152">elem 152</option>
                                            <option value="elem_153">elem 153</option>
                                            <option value="elem_154">elem 154</option>
                                            <option value="elem_155">elem 155</option>
                                            <option value="elem_156">elem 156</option>
                                            <option value="elem_157">elem 157</option>
                                            <option value="elem_158">elem 158</option>
                                            <option value="elem_159">elem 159</option>
                                            <option value="elem_160">elem 160</option>
                                            <option value="elem_161">elem 161</option>
                                            <option value="elem_162">elem 162</option>
                                            <option value="elem_163">elem 163</option>
                                            <option value="elem_164">elem 164</option>
                                            <option value="elem_165">elem 165</option>
                                            <option value="elem_166">elem 166</option>
                                            <option value="elem_167">elem 167</option>
                                            <option value="elem_168">elem 168</option>
                                            <option value="elem_169">elem 169</option>
                                            <option value="elem_170">elem 170</option>
                                            <option value="elem_171">elem 171</option>
                                            <option value="elem_172">elem 172</option>
                                            <option value="elem_173">elem 173</option>
                                            <option value="elem_174">elem 174</option>
                                            <option value="elem_175">elem 175</option>
                                            <option value="elem_176">elem 176</option>
                                            <option value="elem_177">elem 177</option>
                                            <option value="elem_178">elem 178</option>
                                            <option value="elem_179">elem 179</option>
                                            <option value="elem_180">elem 180</option>
                                            <option value="elem_181">elem 181</option>
                                            <option value="elem_182">elem 182</option>
                                            <option value="elem_183">elem 183</option>
                                            <option value="elem_184">elem 184</option>
                                            <option value="elem_185">elem 185</option>
                                            <option value="elem_186">elem 186</option>
                                            <option value="elem_187">elem 187</option>
                                            <option value="elem_188">elem 188</option>
                                            <option value="elem_189">elem 189</option>
                                            <option value="elem_190">elem 190</option>
                                            <option value="elem_191">elem 191</option>
                                            <option value="elem_192">elem 192</option>
                                            <option value="elem_193">elem 193</option>
                                            <option value="elem_194">elem 194</option>
                                            <option value="elem_195">elem 195</option>
                                            <option value="elem_196">elem 196</option>
                                            <option value="elem_197">elem 197</option>
                                            <option value="elem_198">elem 198</option>
                                            <option value="elem_199">elem 199</option>
                                            <option value="elem_200">elem 200</option>
                                        </select><div class="ms-container" id="ms-public-methods"><div class="ms-selectable"><ul class="ms-list" tabindex="-1"><li class="ms-elem-selectable" id="1662-selectable"><span>test 42</span></li><li class="ms-elem-selectable" id="-1300566143-selectable"><span>elem 1</span></li><li class="ms-elem-selectable disabled" id="-1300566142-selectable"><span>elem 2</span></li><li class="ms-elem-selectable ms-selected" id="-1300566141-selectable" style="display: none;"><span>elem 3</span></li><li class="ms-elem-selectable" id="-1300566140-selectable"><span>elem 4</span></li><li class="ms-elem-selectable" id="-1300566139-selectable"><span>elem 5</span></li><li class="ms-elem-selectable ms-selected" id="-1300566138-selectable" style="display: none;"><span>elem 6</span></li><li class="ms-elem-selectable" id="-1300566137-selectable"><span>elem 7</span></li><li class="ms-elem-selectable" id="-1300566136-selectable"><span>elem 8</span></li><li class="ms-elem-selectable" id="-1300566135-selectable"><span>elem 9</span></li><li class="ms-elem-selectable" id="-1662844721-selectable"><span>elem 10</span></li><li class="ms-elem-selectable" id="-1662844720-selectable"><span>elem 11</span></li><li class="ms-elem-selectable" id="-1662844719-selectable"><span>elem 12</span></li><li class="ms-elem-selectable" id="-1662844718-selectable"><span>elem 13</span></li><li class="ms-elem-selectable" id="-1662844717-selectable"><span>elem 14</span></li><li class="ms-elem-selectable" id="-1662844716-selectable"><span>elem 15</span></li><li class="ms-elem-selectable" id="-1662844715-selectable"><span>elem 16</span></li><li class="ms-elem-selectable" id="-1662844714-selectable"><span>elem 17</span></li><li class="ms-elem-selectable" id="-1662844713-selectable"><span>elem 18</span></li><li class="ms-elem-selectable" id="-1662844712-selectable"><span>elem 19</span></li><li class="ms-elem-selectable" id="-1662844690-selectable"><span>elem 20</span></li><li class="ms-elem-selectable" id="-1662844689-selectable"><span>elem 21</span></li><li class="ms-elem-selectable" id="-1662844688-selectable"><span>elem 22</span></li><li class="ms-elem-selectable" id="-1662844687-selectable"><span>elem 23</span></li><li class="ms-elem-selectable" id="-1662844686-selectable"><span>elem 24</span></li><li class="ms-elem-selectable" id="-1662844685-selectable"><span>elem 25</span></li><li class="ms-elem-selectable" id="-1662844684-selectable"><span>elem 26</span></li><li class="ms-elem-selectable" id="-1662844683-selectable"><span>elem 27</span></li><li class="ms-elem-selectable" id="-1662844682-selectable"><span>elem 28</span></li><li class="ms-elem-selectable" id="-1662844681-selectable"><span>elem 29</span></li><li class="ms-elem-selectable" id="-1662844659-selectable"><span>elem 30</span></li><li class="ms-elem-selectable" id="-1662844658-selectable"><span>elem 31</span></li><li class="ms-elem-selectable" id="-1662844657-selectable"><span>elem 32</span></li><li class="ms-elem-selectable" id="-1662844656-selectable"><span>elem 33</span></li><li class="ms-elem-selectable" id="-1662844655-selectable"><span>elem 34</span></li><li class="ms-elem-selectable" id="-1662844654-selectable"><span>elem 35</span></li><li class="ms-elem-selectable" id="-1662844653-selectable"><span>elem 36</span></li><li class="ms-elem-selectable" id="-1662844652-selectable"><span>elem 37</span></li><li class="ms-elem-selectable" id="-1662844651-selectable"><span>elem 38</span></li><li class="ms-elem-selectable" id="-1662844650-selectable"><span>elem 39</span></li><li class="ms-elem-selectable" id="-1662844628-selectable"><span>elem 40</span></li><li class="ms-elem-selectable" id="-1662844627-selectable"><span>elem 41</span></li><li class="ms-elem-selectable" id="-1662844626-selectable"><span>elem 42</span></li><li class="ms-elem-selectable" id="-1662844625-selectable"><span>elem 43</span></li><li class="ms-elem-selectable" id="-1662844624-selectable"><span>elem 44</span></li><li class="ms-elem-selectable" id="-1662844623-selectable"><span>elem 45</span></li><li class="ms-elem-selectable" id="-1662844622-selectable"><span>elem 46</span></li><li class="ms-elem-selectable" id="-1662844621-selectable"><span>elem 47</span></li><li class="ms-elem-selectable" id="-1662844620-selectable"><span>elem 48</span></li><li class="ms-elem-selectable" id="-1662844619-selectable"><span>elem 49</span></li><li class="ms-elem-selectable" id="-1662844597-selectable"><span>elem 50</span></li><li class="ms-elem-selectable" id="-1662844596-selectable"><span>elem 51</span></li><li class="ms-elem-selectable" id="-1662844595-selectable"><span>elem 52</span></li><li class="ms-elem-selectable" id="-1662844594-selectable"><span>elem 53</span></li><li class="ms-elem-selectable" id="-1662844593-selectable"><span>elem 54</span></li><li class="ms-elem-selectable" id="-1662844592-selectable"><span>elem 55</span></li><li class="ms-elem-selectable" id="-1662844591-selectable"><span>elem 56</span></li><li class="ms-elem-selectable" id="-1662844590-selectable"><span>elem 57</span></li><li class="ms-elem-selectable" id="-1662844589-selectable"><span>elem 58</span></li><li class="ms-elem-selectable" id="-1662844588-selectable"><span>elem 59</span></li><li class="ms-elem-selectable" id="-1662844566-selectable"><span>elem 60</span></li><li class="ms-elem-selectable" id="-1662844565-selectable"><span>elem 61</span></li><li class="ms-elem-selectable" id="-1662844564-selectable"><span>elem 62</span></li><li class="ms-elem-selectable" id="-1662844563-selectable"><span>elem 63</span></li><li class="ms-elem-selectable" id="-1662844562-selectable"><span>elem 64</span></li><li class="ms-elem-selectable" id="-1662844561-selectable"><span>elem 65</span></li><li class="ms-elem-selectable" id="-1662844560-selectable"><span>elem 66</span></li><li class="ms-elem-selectable" id="-1662844559-selectable"><span>elem 67</span></li><li class="ms-elem-selectable" id="-1662844558-selectable"><span>elem 68</span></li><li class="ms-elem-selectable" id="-1662844557-selectable"><span>elem 69</span></li><li class="ms-elem-selectable" id="-1662844535-selectable"><span>elem 70</span></li><li class="ms-elem-selectable" id="-1662844534-selectable"><span>elem 71</span></li><li class="ms-elem-selectable" id="-1662844533-selectable"><span>elem 72</span></li><li class="ms-elem-selectable" id="-1662844532-selectable"><span>elem 73</span></li><li class="ms-elem-selectable" id="-1662844531-selectable"><span>elem 74</span></li><li class="ms-elem-selectable" id="-1662844530-selectable"><span>elem 75</span></li><li class="ms-elem-selectable" id="-1662844529-selectable"><span>elem 76</span></li><li class="ms-elem-selectable" id="-1662844528-selectable"><span>elem 77</span></li><li class="ms-elem-selectable" id="-1662844527-selectable"><span>elem 78</span></li><li class="ms-elem-selectable" id="-1662844526-selectable"><span>elem 79</span></li><li class="ms-elem-selectable" id="-1662844504-selectable"><span>elem 80</span></li><li class="ms-elem-selectable" id="-1662844503-selectable"><span>elem 81</span></li><li class="ms-elem-selectable" id="-1662844502-selectable"><span>elem 82</span></li><li class="ms-elem-selectable" id="-1662844501-selectable"><span>elem 83</span></li><li class="ms-elem-selectable" id="-1662844500-selectable"><span>elem 84</span></li><li class="ms-elem-selectable" id="-1662844499-selectable"><span>elem 85</span></li><li class="ms-elem-selectable" id="-1662844498-selectable"><span>elem 86</span></li><li class="ms-elem-selectable" id="-1662844497-selectable"><span>elem 87</span></li><li class="ms-elem-selectable" id="-1662844496-selectable"><span>elem 88</span></li><li class="ms-elem-selectable" id="-1662844495-selectable"><span>elem 89</span></li><li class="ms-elem-selectable" id="-1662844473-selectable"><span>elem 90</span></li><li class="ms-elem-selectable" id="-1662844472-selectable"><span>elem 91</span></li><li class="ms-elem-selectable" id="-1662844471-selectable"><span>elem 92</span></li><li class="ms-elem-selectable" id="-1662844470-selectable"><span>elem 93</span></li><li class="ms-elem-selectable" id="-1662844469-selectable"><span>elem 94</span></li><li class="ms-elem-selectable" id="-1662844468-selectable"><span>elem 95</span></li><li class="ms-elem-selectable" id="-1662844467-selectable"><span>elem 96</span></li><li class="ms-elem-selectable" id="-1662844466-selectable"><span>elem 97</span></li><li class="ms-elem-selectable" id="-1662844465-selectable"><span>elem 98</span></li><li class="ms-elem-selectable" id="-1662844464-selectable"><span>elem 99</span></li><li class="ms-elem-selectable" id="-8578751-selectable"><span>elem 100</span></li><li class="ms-elem-selectable" id="-8578750-selectable"><span>elem 101</span></li><li class="ms-elem-selectable" id="-8578749-selectable"><span>elem 102</span></li><li class="ms-elem-selectable" id="-8578748-selectable"><span>elem 103</span></li><li class="ms-elem-selectable" id="-8578747-selectable"><span>elem 104</span></li><li class="ms-elem-selectable" id="-8578746-selectable"><span>elem 105</span></li><li class="ms-elem-selectable" id="-8578745-selectable"><span>elem 106</span></li><li class="ms-elem-selectable" id="-8578744-selectable"><span>elem 107</span></li><li class="ms-elem-selectable" id="-8578743-selectable"><span>elem 108</span></li><li class="ms-elem-selectable" id="-8578742-selectable"><span>elem 109</span></li><li class="ms-elem-selectable" id="-8578720-selectable"><span>elem 110</span></li><li class="ms-elem-selectable" id="-8578719-selectable"><span>elem 111</span></li><li class="ms-elem-selectable" id="-8578718-selectable"><span>elem 112</span></li><li class="ms-elem-selectable" id="-8578717-selectable"><span>elem 113</span></li><li class="ms-elem-selectable" id="-8578716-selectable"><span>elem 114</span></li><li class="ms-elem-selectable" id="-8578715-selectable"><span>elem 115</span></li><li class="ms-elem-selectable" id="-8578714-selectable"><span>elem 116</span></li><li class="ms-elem-selectable" id="-8578713-selectable"><span>elem 117</span></li><li class="ms-elem-selectable" id="-8578712-selectable"><span>elem 118</span></li><li class="ms-elem-selectable" id="-8578711-selectable"><span>elem 119</span></li><li class="ms-elem-selectable" id="-8578689-selectable"><span>elem 120</span></li><li class="ms-elem-selectable" id="-8578688-selectable"><span>elem 121</span></li><li class="ms-elem-selectable" id="-8578687-selectable"><span>elem 122</span></li><li class="ms-elem-selectable" id="-8578686-selectable"><span>elem 123</span></li><li class="ms-elem-selectable" id="-8578685-selectable"><span>elem 124</span></li><li class="ms-elem-selectable" id="-8578684-selectable"><span>elem 125</span></li><li class="ms-elem-selectable" id="-8578683-selectable"><span>elem 126</span></li><li class="ms-elem-selectable" id="-8578682-selectable"><span>elem 127</span></li><li class="ms-elem-selectable" id="-8578681-selectable"><span>elem 128</span></li><li class="ms-elem-selectable" id="-8578680-selectable"><span>elem 129</span></li><li class="ms-elem-selectable" id="-8578658-selectable"><span>elem 130</span></li><li class="ms-elem-selectable" id="-8578657-selectable"><span>elem 131</span></li><li class="ms-elem-selectable" id="-8578656-selectable"><span>elem 132</span></li><li class="ms-elem-selectable" id="-8578655-selectable"><span>elem 133</span></li><li class="ms-elem-selectable" id="-8578654-selectable"><span>elem 134</span></li><li class="ms-elem-selectable" id="-8578653-selectable"><span>elem 135</span></li><li class="ms-elem-selectable" id="-8578652-selectable"><span>elem 136</span></li><li class="ms-elem-selectable" id="-8578651-selectable"><span>elem 137</span></li><li class="ms-elem-selectable" id="-8578650-selectable"><span>elem 138</span></li><li class="ms-elem-selectable" id="-8578649-selectable"><span>elem 139</span></li><li class="ms-elem-selectable" id="-8578627-selectable"><span>elem 140</span></li><li class="ms-elem-selectable" id="-8578626-selectable"><span>elem 141</span></li><li class="ms-elem-selectable" id="-8578625-selectable"><span>elem 142</span></li><li class="ms-elem-selectable" id="-8578624-selectable"><span>elem 143</span></li><li class="ms-elem-selectable" id="-8578623-selectable"><span>elem 144</span></li><li class="ms-elem-selectable" id="-8578622-selectable"><span>elem 145</span></li><li class="ms-elem-selectable" id="-8578621-selectable"><span>elem 146</span></li><li class="ms-elem-selectable" id="-8578620-selectable"><span>elem 147</span></li><li class="ms-elem-selectable" id="-8578619-selectable"><span>elem 148</span></li><li class="ms-elem-selectable" id="-8578618-selectable"><span>elem 149</span></li><li class="ms-elem-selectable" id="-8578596-selectable"><span>elem 150</span></li><li class="ms-elem-selectable" id="-8578595-selectable"><span>elem 151</span></li><li class="ms-elem-selectable" id="-8578594-selectable"><span>elem 152</span></li><li class="ms-elem-selectable" id="-8578593-selectable"><span>elem 153</span></li><li class="ms-elem-selectable" id="-8578592-selectable"><span>elem 154</span></li><li class="ms-elem-selectable" id="-8578591-selectable"><span>elem 155</span></li><li class="ms-elem-selectable" id="-8578590-selectable"><span>elem 156</span></li><li class="ms-elem-selectable" id="-8578589-selectable"><span>elem 157</span></li><li class="ms-elem-selectable" id="-8578588-selectable"><span>elem 158</span></li><li class="ms-elem-selectable" id="-8578587-selectable"><span>elem 159</span></li><li class="ms-elem-selectable" id="-8578565-selectable"><span>elem 160</span></li><li class="ms-elem-selectable" id="-8578564-selectable"><span>elem 161</span></li><li class="ms-elem-selectable" id="-8578563-selectable"><span>elem 162</span></li><li class="ms-elem-selectable" id="-8578562-selectable"><span>elem 163</span></li><li class="ms-elem-selectable" id="-8578561-selectable"><span>elem 164</span></li><li class="ms-elem-selectable" id="-8578560-selectable"><span>elem 165</span></li><li class="ms-elem-selectable" id="-8578559-selectable"><span>elem 166</span></li><li class="ms-elem-selectable" id="-8578558-selectable"><span>elem 167</span></li><li class="ms-elem-selectable" id="-8578557-selectable"><span>elem 168</span></li><li class="ms-elem-selectable" id="-8578556-selectable"><span>elem 169</span></li><li class="ms-elem-selectable" id="-8578534-selectable"><span>elem 170</span></li><li class="ms-elem-selectable" id="-8578533-selectable"><span>elem 171</span></li><li class="ms-elem-selectable" id="-8578532-selectable"><span>elem 172</span></li><li class="ms-elem-selectable" id="-8578531-selectable"><span>elem 173</span></li><li class="ms-elem-selectable" id="-8578530-selectable"><span>elem 174</span></li><li class="ms-elem-selectable" id="-8578529-selectable"><span>elem 175</span></li><li class="ms-elem-selectable" id="-8578528-selectable"><span>elem 176</span></li><li class="ms-elem-selectable" id="-8578527-selectable"><span>elem 177</span></li><li class="ms-elem-selectable" id="-8578526-selectable"><span>elem 178</span></li><li class="ms-elem-selectable" id="-8578525-selectable"><span>elem 179</span></li><li class="ms-elem-selectable" id="-8578503-selectable"><span>elem 180</span></li><li class="ms-elem-selectable" id="-8578502-selectable"><span>elem 181</span></li><li class="ms-elem-selectable" id="-8578501-selectable"><span>elem 182</span></li><li class="ms-elem-selectable" id="-8578500-selectable"><span>elem 183</span></li><li class="ms-elem-selectable" id="-8578499-selectable"><span>elem 184</span></li><li class="ms-elem-selectable" id="-8578498-selectable"><span>elem 185</span></li><li class="ms-elem-selectable" id="-8578497-selectable"><span>elem 186</span></li><li class="ms-elem-selectable" id="-8578496-selectable"><span>elem 187</span></li><li class="ms-elem-selectable" id="-8578495-selectable"><span>elem 188</span></li><li class="ms-elem-selectable" id="-8578494-selectable"><span>elem 189</span></li><li class="ms-elem-selectable" id="-8578472-selectable"><span>elem 190</span></li><li class="ms-elem-selectable" id="-8578471-selectable"><span>elem 191</span></li><li class="ms-elem-selectable" id="-8578470-selectable"><span>elem 192</span></li><li class="ms-elem-selectable" id="-8578469-selectable"><span>elem 193</span></li><li class="ms-elem-selectable" id="-8578468-selectable"><span>elem 194</span></li><li class="ms-elem-selectable" id="-8578467-selectable"><span>elem 195</span></li><li class="ms-elem-selectable" id="-8578466-selectable"><span>elem 196</span></li><li class="ms-elem-selectable" id="-8578465-selectable"><span>elem 197</span></li><li class="ms-elem-selectable" id="-8578464-selectable"><span>elem 198</span></li><li class="ms-elem-selectable" id="-8578463-selectable"><span>elem 199</span></li><li class="ms-elem-selectable" id="-8577790-selectable"><span>elem 200</span></li></ul></div><div class="ms-selection"><ul class="ms-list" tabindex="-1"><li class="ms-elem-selection" id="1662-selection" style="display: none;"><span>test 42</span></li><li class="ms-elem-selection" id="-1300566143-selection" style="display: none;"><span>elem 1</span></li><li class="ms-elem-selection disabled" id="-1300566142-selection" style="display: none;"><span>elem 2</span></li><li class="ms-elem-selection ms-selected" id="-1300566141-selection" style=""><span>elem 3</span></li><li class="ms-elem-selection" id="-1300566140-selection" style="display: none;"><span>elem 4</span></li><li class="ms-elem-selection" id="-1300566139-selection" style="display: none;"><span>elem 5</span></li><li class="ms-elem-selection ms-selected ms-hover" id="-1300566138-selection" style=""><span>elem 6</span></li><li class="ms-elem-selection" id="-1300566137-selection" style="display: none;"><span>elem 7</span></li><li class="ms-elem-selection" id="-1300566136-selection" style="display: none;"><span>elem 8</span></li><li class="ms-elem-selection" id="-1300566135-selection" style="display: none;"><span>elem 9</span></li><li class="ms-elem-selection" id="-1662844721-selection" style="display: none;"><span>elem 10</span></li><li class="ms-elem-selection" id="-1662844720-selection" style="display: none;"><span>elem 11</span></li><li class="ms-elem-selection" id="-1662844719-selection" style="display: none;"><span>elem 12</span></li><li class="ms-elem-selection" id="-1662844718-selection" style="display: none;"><span>elem 13</span></li><li class="ms-elem-selection" id="-1662844717-selection" style="display: none;"><span>elem 14</span></li><li class="ms-elem-selection" id="-1662844716-selection" style="display: none;"><span>elem 15</span></li><li class="ms-elem-selection" id="-1662844715-selection" style="display: none;"><span>elem 16</span></li><li class="ms-elem-selection" id="-1662844714-selection" style="display: none;"><span>elem 17</span></li><li class="ms-elem-selection" id="-1662844713-selection" style="display: none;"><span>elem 18</span></li><li class="ms-elem-selection" id="-1662844712-selection" style="display: none;"><span>elem 19</span></li><li class="ms-elem-selection" id="-1662844690-selection" style="display: none;"><span>elem 20</span></li><li class="ms-elem-selection" id="-1662844689-selection" style="display: none;"><span>elem 21</span></li><li class="ms-elem-selection" id="-1662844688-selection" style="display: none;"><span>elem 22</span></li><li class="ms-elem-selection" id="-1662844687-selection" style="display: none;"><span>elem 23</span></li><li class="ms-elem-selection" id="-1662844686-selection" style="display: none;"><span>elem 24</span></li><li class="ms-elem-selection" id="-1662844685-selection" style="display: none;"><span>elem 25</span></li><li class="ms-elem-selection" id="-1662844684-selection" style="display: none;"><span>elem 26</span></li><li class="ms-elem-selection" id="-1662844683-selection" style="display: none;"><span>elem 27</span></li><li class="ms-elem-selection" id="-1662844682-selection" style="display: none;"><span>elem 28</span></li><li class="ms-elem-selection" id="-1662844681-selection" style="display: none;"><span>elem 29</span></li><li class="ms-elem-selection" id="-1662844659-selection" style="display: none;"><span>elem 30</span></li><li class="ms-elem-selection" id="-1662844658-selection" style="display: none;"><span>elem 31</span></li><li class="ms-elem-selection" id="-1662844657-selection" style="display: none;"><span>elem 32</span></li><li class="ms-elem-selection" id="-1662844656-selection" style="display: none;"><span>elem 33</span></li><li class="ms-elem-selection" id="-1662844655-selection" style="display: none;"><span>elem 34</span></li><li class="ms-elem-selection" id="-1662844654-selection" style="display: none;"><span>elem 35</span></li><li class="ms-elem-selection" id="-1662844653-selection" style="display: none;"><span>elem 36</span></li><li class="ms-elem-selection" id="-1662844652-selection" style="display: none;"><span>elem 37</span></li><li class="ms-elem-selection" id="-1662844651-selection" style="display: none;"><span>elem 38</span></li><li class="ms-elem-selection" id="-1662844650-selection" style="display: none;"><span>elem 39</span></li><li class="ms-elem-selection" id="-1662844628-selection" style="display: none;"><span>elem 40</span></li><li class="ms-elem-selection" id="-1662844627-selection" style="display: none;"><span>elem 41</span></li><li class="ms-elem-selection" id="-1662844626-selection" style="display: none;"><span>elem 42</span></li><li class="ms-elem-selection" id="-1662844625-selection" style="display: none;"><span>elem 43</span></li><li class="ms-elem-selection" id="-1662844624-selection" style="display: none;"><span>elem 44</span></li><li class="ms-elem-selection" id="-1662844623-selection" style="display: none;"><span>elem 45</span></li><li class="ms-elem-selection" id="-1662844622-selection" style="display: none;"><span>elem 46</span></li><li class="ms-elem-selection" id="-1662844621-selection" style="display: none;"><span>elem 47</span></li><li class="ms-elem-selection" id="-1662844620-selection" style="display: none;"><span>elem 48</span></li><li class="ms-elem-selection" id="-1662844619-selection" style="display: none;"><span>elem 49</span></li><li class="ms-elem-selection" id="-1662844597-selection" style="display: none;"><span>elem 50</span></li><li class="ms-elem-selection" id="-1662844596-selection" style="display: none;"><span>elem 51</span></li><li class="ms-elem-selection" id="-1662844595-selection" style="display: none;"><span>elem 52</span></li><li class="ms-elem-selection" id="-1662844594-selection" style="display: none;"><span>elem 53</span></li><li class="ms-elem-selection" id="-1662844593-selection" style="display: none;"><span>elem 54</span></li><li class="ms-elem-selection" id="-1662844592-selection" style="display: none;"><span>elem 55</span></li><li class="ms-elem-selection" id="-1662844591-selection" style="display: none;"><span>elem 56</span></li><li class="ms-elem-selection" id="-1662844590-selection" style="display: none;"><span>elem 57</span></li><li class="ms-elem-selection" id="-1662844589-selection" style="display: none;"><span>elem 58</span></li><li class="ms-elem-selection" id="-1662844588-selection" style="display: none;"><span>elem 59</span></li><li class="ms-elem-selection" id="-1662844566-selection" style="display: none;"><span>elem 60</span></li><li class="ms-elem-selection" id="-1662844565-selection" style="display: none;"><span>elem 61</span></li><li class="ms-elem-selection" id="-1662844564-selection" style="display: none;"><span>elem 62</span></li><li class="ms-elem-selection" id="-1662844563-selection" style="display: none;"><span>elem 63</span></li><li class="ms-elem-selection" id="-1662844562-selection" style="display: none;"><span>elem 64</span></li><li class="ms-elem-selection" id="-1662844561-selection" style="display: none;"><span>elem 65</span></li><li class="ms-elem-selection" id="-1662844560-selection" style="display: none;"><span>elem 66</span></li><li class="ms-elem-selection" id="-1662844559-selection" style="display: none;"><span>elem 67</span></li><li class="ms-elem-selection" id="-1662844558-selection" style="display: none;"><span>elem 68</span></li><li class="ms-elem-selection" id="-1662844557-selection" style="display: none;"><span>elem 69</span></li><li class="ms-elem-selection" id="-1662844535-selection" style="display: none;"><span>elem 70</span></li><li class="ms-elem-selection" id="-1662844534-selection" style="display: none;"><span>elem 71</span></li><li class="ms-elem-selection" id="-1662844533-selection" style="display: none;"><span>elem 72</span></li><li class="ms-elem-selection" id="-1662844532-selection" style="display: none;"><span>elem 73</span></li><li class="ms-elem-selection" id="-1662844531-selection" style="display: none;"><span>elem 74</span></li><li class="ms-elem-selection" id="-1662844530-selection" style="display: none;"><span>elem 75</span></li><li class="ms-elem-selection" id="-1662844529-selection" style="display: none;"><span>elem 76</span></li><li class="ms-elem-selection" id="-1662844528-selection" style="display: none;"><span>elem 77</span></li><li class="ms-elem-selection" id="-1662844527-selection" style="display: none;"><span>elem 78</span></li><li class="ms-elem-selection" id="-1662844526-selection" style="display: none;"><span>elem 79</span></li><li class="ms-elem-selection" id="-1662844504-selection" style="display: none;"><span>elem 80</span></li><li class="ms-elem-selection" id="-1662844503-selection" style="display: none;"><span>elem 81</span></li><li class="ms-elem-selection" id="-1662844502-selection" style="display: none;"><span>elem 82</span></li><li class="ms-elem-selection" id="-1662844501-selection" style="display: none;"><span>elem 83</span></li><li class="ms-elem-selection" id="-1662844500-selection" style="display: none;"><span>elem 84</span></li><li class="ms-elem-selection" id="-1662844499-selection" style="display: none;"><span>elem 85</span></li><li class="ms-elem-selection" id="-1662844498-selection" style="display: none;"><span>elem 86</span></li><li class="ms-elem-selection" id="-1662844497-selection" style="display: none;"><span>elem 87</span></li><li class="ms-elem-selection" id="-1662844496-selection" style="display: none;"><span>elem 88</span></li><li class="ms-elem-selection" id="-1662844495-selection" style="display: none;"><span>elem 89</span></li><li class="ms-elem-selection" id="-1662844473-selection" style="display: none;"><span>elem 90</span></li><li class="ms-elem-selection" id="-1662844472-selection" style="display: none;"><span>elem 91</span></li><li class="ms-elem-selection" id="-1662844471-selection" style="display: none;"><span>elem 92</span></li><li class="ms-elem-selection" id="-1662844470-selection" style="display: none;"><span>elem 93</span></li><li class="ms-elem-selection" id="-1662844469-selection" style="display: none;"><span>elem 94</span></li><li class="ms-elem-selection" id="-1662844468-selection" style="display: none;"><span>elem 95</span></li><li class="ms-elem-selection" id="-1662844467-selection" style="display: none;"><span>elem 96</span></li><li class="ms-elem-selection" id="-1662844466-selection" style="display: none;"><span>elem 97</span></li><li class="ms-elem-selection" id="-1662844465-selection" style="display: none;"><span>elem 98</span></li><li class="ms-elem-selection" id="-1662844464-selection" style="display: none;"><span>elem 99</span></li><li class="ms-elem-selection" id="-8578751-selection" style="display: none;"><span>elem 100</span></li><li class="ms-elem-selection" id="-8578750-selection" style="display: none;"><span>elem 101</span></li><li class="ms-elem-selection" id="-8578749-selection" style="display: none;"><span>elem 102</span></li><li class="ms-elem-selection" id="-8578748-selection" style="display: none;"><span>elem 103</span></li><li class="ms-elem-selection" id="-8578747-selection" style="display: none;"><span>elem 104</span></li><li class="ms-elem-selection" id="-8578746-selection" style="display: none;"><span>elem 105</span></li><li class="ms-elem-selection" id="-8578745-selection" style="display: none;"><span>elem 106</span></li><li class="ms-elem-selection" id="-8578744-selection" style="display: none;"><span>elem 107</span></li><li class="ms-elem-selection" id="-8578743-selection" style="display: none;"><span>elem 108</span></li><li class="ms-elem-selection" id="-8578742-selection" style="display: none;"><span>elem 109</span></li><li class="ms-elem-selection" id="-8578720-selection" style="display: none;"><span>elem 110</span></li><li class="ms-elem-selection" id="-8578719-selection" style="display: none;"><span>elem 111</span></li><li class="ms-elem-selection" id="-8578718-selection" style="display: none;"><span>elem 112</span></li><li class="ms-elem-selection" id="-8578717-selection" style="display: none;"><span>elem 113</span></li><li class="ms-elem-selection" id="-8578716-selection" style="display: none;"><span>elem 114</span></li><li class="ms-elem-selection" id="-8578715-selection" style="display: none;"><span>elem 115</span></li><li class="ms-elem-selection" id="-8578714-selection" style="display: none;"><span>elem 116</span></li><li class="ms-elem-selection" id="-8578713-selection" style="display: none;"><span>elem 117</span></li><li class="ms-elem-selection" id="-8578712-selection" style="display: none;"><span>elem 118</span></li><li class="ms-elem-selection" id="-8578711-selection" style="display: none;"><span>elem 119</span></li><li class="ms-elem-selection" id="-8578689-selection" style="display: none;"><span>elem 120</span></li><li class="ms-elem-selection" id="-8578688-selection" style="display: none;"><span>elem 121</span></li><li class="ms-elem-selection" id="-8578687-selection" style="display: none;"><span>elem 122</span></li><li class="ms-elem-selection" id="-8578686-selection" style="display: none;"><span>elem 123</span></li><li class="ms-elem-selection" id="-8578685-selection" style="display: none;"><span>elem 124</span></li><li class="ms-elem-selection" id="-8578684-selection" style="display: none;"><span>elem 125</span></li><li class="ms-elem-selection" id="-8578683-selection" style="display: none;"><span>elem 126</span></li><li class="ms-elem-selection" id="-8578682-selection" style="display: none;"><span>elem 127</span></li><li class="ms-elem-selection" id="-8578681-selection" style="display: none;"><span>elem 128</span></li><li class="ms-elem-selection" id="-8578680-selection" style="display: none;"><span>elem 129</span></li><li class="ms-elem-selection" id="-8578658-selection" style="display: none;"><span>elem 130</span></li><li class="ms-elem-selection" id="-8578657-selection" style="display: none;"><span>elem 131</span></li><li class="ms-elem-selection" id="-8578656-selection" style="display: none;"><span>elem 132</span></li><li class="ms-elem-selection" id="-8578655-selection" style="display: none;"><span>elem 133</span></li><li class="ms-elem-selection" id="-8578654-selection" style="display: none;"><span>elem 134</span></li><li class="ms-elem-selection" id="-8578653-selection" style="display: none;"><span>elem 135</span></li><li class="ms-elem-selection" id="-8578652-selection" style="display: none;"><span>elem 136</span></li><li class="ms-elem-selection" id="-8578651-selection" style="display: none;"><span>elem 137</span></li><li class="ms-elem-selection" id="-8578650-selection" style="display: none;"><span>elem 138</span></li><li class="ms-elem-selection" id="-8578649-selection" style="display: none;"><span>elem 139</span></li><li class="ms-elem-selection" id="-8578627-selection" style="display: none;"><span>elem 140</span></li><li class="ms-elem-selection" id="-8578626-selection" style="display: none;"><span>elem 141</span></li><li class="ms-elem-selection" id="-8578625-selection" style="display: none;"><span>elem 142</span></li><li class="ms-elem-selection" id="-8578624-selection" style="display: none;"><span>elem 143</span></li><li class="ms-elem-selection" id="-8578623-selection" style="display: none;"><span>elem 144</span></li><li class="ms-elem-selection" id="-8578622-selection" style="display: none;"><span>elem 145</span></li><li class="ms-elem-selection" id="-8578621-selection" style="display: none;"><span>elem 146</span></li><li class="ms-elem-selection" id="-8578620-selection" style="display: none;"><span>elem 147</span></li><li class="ms-elem-selection" id="-8578619-selection" style="display: none;"><span>elem 148</span></li><li class="ms-elem-selection" id="-8578618-selection" style="display: none;"><span>elem 149</span></li><li class="ms-elem-selection" id="-8578596-selection" style="display: none;"><span>elem 150</span></li><li class="ms-elem-selection" id="-8578595-selection" style="display: none;"><span>elem 151</span></li><li class="ms-elem-selection" id="-8578594-selection" style="display: none;"><span>elem 152</span></li><li class="ms-elem-selection" id="-8578593-selection" style="display: none;"><span>elem 153</span></li><li class="ms-elem-selection" id="-8578592-selection" style="display: none;"><span>elem 154</span></li><li class="ms-elem-selection" id="-8578591-selection" style="display: none;"><span>elem 155</span></li><li class="ms-elem-selection" id="-8578590-selection" style="display: none;"><span>elem 156</span></li><li class="ms-elem-selection" id="-8578589-selection" style="display: none;"><span>elem 157</span></li><li class="ms-elem-selection" id="-8578588-selection" style="display: none;"><span>elem 158</span></li><li class="ms-elem-selection" id="-8578587-selection" style="display: none;"><span>elem 159</span></li><li class="ms-elem-selection" id="-8578565-selection" style="display: none;"><span>elem 160</span></li><li class="ms-elem-selection" id="-8578564-selection" style="display: none;"><span>elem 161</span></li><li class="ms-elem-selection" id="-8578563-selection" style="display: none;"><span>elem 162</span></li><li class="ms-elem-selection" id="-8578562-selection" style="display: none;"><span>elem 163</span></li><li class="ms-elem-selection" id="-8578561-selection" style="display: none;"><span>elem 164</span></li><li class="ms-elem-selection" id="-8578560-selection" style="display: none;"><span>elem 165</span></li><li class="ms-elem-selection" id="-8578559-selection" style="display: none;"><span>elem 166</span></li><li class="ms-elem-selection" id="-8578558-selection" style="display: none;"><span>elem 167</span></li><li class="ms-elem-selection" id="-8578557-selection" style="display: none;"><span>elem 168</span></li><li class="ms-elem-selection" id="-8578556-selection" style="display: none;"><span>elem 169</span></li><li class="ms-elem-selection" id="-8578534-selection" style="display: none;"><span>elem 170</span></li><li class="ms-elem-selection" id="-8578533-selection" style="display: none;"><span>elem 171</span></li><li class="ms-elem-selection" id="-8578532-selection" style="display: none;"><span>elem 172</span></li><li class="ms-elem-selection" id="-8578531-selection" style="display: none;"><span>elem 173</span></li><li class="ms-elem-selection" id="-8578530-selection" style="display: none;"><span>elem 174</span></li><li class="ms-elem-selection" id="-8578529-selection" style="display: none;"><span>elem 175</span></li><li class="ms-elem-selection" id="-8578528-selection" style="display: none;"><span>elem 176</span></li><li class="ms-elem-selection" id="-8578527-selection" style="display: none;"><span>elem 177</span></li><li class="ms-elem-selection" id="-8578526-selection" style="display: none;"><span>elem 178</span></li><li class="ms-elem-selection" id="-8578525-selection" style="display: none;"><span>elem 179</span></li><li class="ms-elem-selection" id="-8578503-selection" style="display: none;"><span>elem 180</span></li><li class="ms-elem-selection" id="-8578502-selection" style="display: none;"><span>elem 181</span></li><li class="ms-elem-selection" id="-8578501-selection" style="display: none;"><span>elem 182</span></li><li class="ms-elem-selection" id="-8578500-selection" style="display: none;"><span>elem 183</span></li><li class="ms-elem-selection" id="-8578499-selection" style="display: none;"><span>elem 184</span></li><li class="ms-elem-selection" id="-8578498-selection" style="display: none;"><span>elem 185</span></li><li class="ms-elem-selection" id="-8578497-selection" style="display: none;"><span>elem 186</span></li><li class="ms-elem-selection" id="-8578496-selection" style="display: none;"><span>elem 187</span></li><li class="ms-elem-selection" id="-8578495-selection" style="display: none;"><span>elem 188</span></li><li class="ms-elem-selection" id="-8578494-selection" style="display: none;"><span>elem 189</span></li><li class="ms-elem-selection" id="-8578472-selection" style="display: none;"><span>elem 190</span></li><li class="ms-elem-selection" id="-8578471-selection" style="display: none;"><span>elem 191</span></li><li class="ms-elem-selection" id="-8578470-selection" style="display: none;"><span>elem 192</span></li><li class="ms-elem-selection" id="-8578469-selection" style="display: none;"><span>elem 193</span></li><li class="ms-elem-selection" id="-8578468-selection" style="display: none;"><span>elem 194</span></li><li class="ms-elem-selection" id="-8578467-selection" style="display: none;"><span>elem 195</span></li><li class="ms-elem-selection" id="-8578466-selection" style="display: none;"><span>elem 196</span></li><li class="ms-elem-selection" id="-8578465-selection" style="display: none;"><span>elem 197</span></li><li class="ms-elem-selection" id="-8578464-selection" style="display: none;"><span>elem 198</span></li><li class="ms-elem-selection" id="-8578463-selection" style="display: none;"><span>elem 199</span></li><li class="ms-elem-selection" id="-8577790-selection" style="display: none;"><span>elem 200</span></li></ul></div></div>
                                        <div class="btn-list mt-3"> <a id="select-all" class="btn btn-danger" href="#">select all</a> <a id="deselect-all" class="btn btn-info" href="#">deselect all</a> <a id="add-option" class="btn btn-success" href="#">Add option</a> <a id="refresh" class="btn btn-warning" href="#">refresh</a> </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Row -->
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->








		<!-- footer -->
        <footer class="footer">
            <%@ include file="../../include/bfooter.jsp" %>
        </footer>
        <!-- End footer -->

		</div>
        <!-- End of Page wrapper  -->
        
	</div>
	<!-- End of Main wrapper -->
	
	<%@ include file="../../include/bjs.jsp" %>
	
	
	
	
	
	
	
	
	
	
	
	
	<jsp:include page="../../include/header.jsp"/>
	
	<h1>학생을 강의에 꽂아주기</h1>
	
	선생
	<select id="teacher" name="t" size="10">
		<c:forEach var="t" items="${tlist }">
			<option value="${t.m_no }">${t.name }</option>
		</c:forEach>
	</select>
	
	강의
	<select id="lecture" name="lec" size="10">
	
	</select>
	
	수강중인학생
	<select id="ings" name="s" size="10" multiple>

	</select>
	
	<button onclick="insertStudent()"><<</button>
	<button onclick="removeStudent()">>></button>
	
	다른학생
	<select id="other" name="s" size="10" multiple>

	</select>
	
	
	
	<script>
		$('#teacher').on('click',function(){
			$.ajax({
				url:'tlist.lec',
				type:'post',
				data:{
					m_no:$(this).val(),
				},
				dataType:'json',
				success:function(data){
					$('#lecture').empty()
					if(data.length>0){
						for(i=0;i<data.length;i++){
							$('#lecture').append('<option value="'+data[i].lec_no+'">lec_no='+data[i].lec_no+'</option>')
						}
					}else{
						$('#lecture').html('<option>Not Exist</option>')
					}
				},
			})
		})
		
		function ingList(lec_no){
			$.ajax({
				url:'inglist.lec',
				type:'post',
				data:{
					lec_no:lec_no,
				},
				dataType:'json',
				success:function(data){
					console.log(data)
					$('#ings').empty()
					if(data.length>0){
						for(i=0;i<data.length;i++){
							$('#ings').append('<option value="'+data[i].m_no+'">m_no='+data[i].m_no+'</option>')
						}
					}else{
						$('#ings').html('<option>Not Exist</option>')
					}
				},
			})
		}
		$('#lecture').on('click',function(){
			console.log($('#teacher').val())
			ingList($('#lecture').val())
		})
		
		function otherList(lec_no){
			$.ajax({
				url:'otherlist.lec',
				type:'post',
				data:{
					lec_no:lec_no,
				},
				dataType:'json',
				success:function(data){
					console.log(data)
					$('#other').empty()
					if(data.length>0){
						for(i=0;i<data.length;i++){
							$('#other').append('<option value="'+data[i].m_no+'">m_no='+data[i].m_no+'</option>')
						}
					}else{
						$('#other').html('<option>Not Exist</option>')
					}
				},
			})
		}
		$('#lecture').on('click',function(){
			otherList($('#lecture').val())
		})
		
		function insertStudent(){
			var other=$('#other').val()
			for(i=0;i<other.length;i++){
				$.ajax({
					url:'insertStudentToIng.lec',
					type:'post',
					data:{
						m_no:parseInt(other[i]),
						lec_no:parseInt($('#lecture').val()),
					},
					success:function(data){
						console.log("<<성공")
						ingList($('#lecture').val())
						otherList($('#lecture').val())
					},
				})
			}
		}
		function removeStudent(){
			var ings=$('#ings').val()
			for(i=0;i<ings.length;i++){
				$.ajax({
					url:'insertStudentToOther.lec',
					type:'post',
					data:{
						m_no:parseInt(ings[i]),
						lec_no:parseInt($('#lecture').val()),
					},
					success:function(data){
						console.log(">>성공")
						ingList($('#lecture').val())
						otherList($('#lecture').val())
					},
				})
			}
		}
	</script>
	
	<jsp:include page="../../include/footer.jsp"/>
</body>
</html>