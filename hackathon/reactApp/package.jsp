<%@include file="/WEB-INF/views/jsp/header.jsp"%>
<%@include file="/WEB-INF/views/jsp/menu.jsp"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="tag" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
div.scrolling {
	width: 100%;
	height: 100%;
	overflow-x: auto;
	overflow-y: hidden;
}
</style>

<!-- Page -->
<div class="page animsition">
	<div class="page-header">
		<ol class="breadcrumb">
			<li><a href="loginPage.get">Dashboard</a></li>
			<li><a href="navigationLanding.get">Navigation plan</a></li>
			<li class="active">Calculations</li>
		</ol>
	</div>
	<div></div>

	<div class="col-xlg-12 col-md-12 tabledefault">

		<!-- Panel Watchlist -->
		<div class="widget widget-shadow widgetTable">
			<div class="widget-body groupicons-head">
				<div class="overall-id">
					<span class="title-id">Scenario ID: <span class="id-value" id="navigationId">${navCalculation.navigationModel.navigationId}</span></span>
					<span class="hidden" id="beginningFrom">${navCalculation.navigationModel.beginningFrom}</span>
				</div>
				<h3 class="widget-title">
				<span class="hidden" id="eupIdToNavigate">${navCalculation.navigationModel.eupModel.eupId}</span>
					<span class="text-truncate">${navCalculation.navigationModel.eupModel.eup}
						: Navigation plan - Calculation</span>
				</h3>
				<font style="color: #f90000; font-size: 20px"><span
					id="linkedStockpileStatus">${result}</span></font>

				<div class="sa-nav-tabs">
					<form:form action="NavigationOptimization.get" method="POST"
						commandName="navCalculation">
						<div class="tab-content sa-tab-content">
							<div id="linking" class="tab-pane fade in active">
								<c:set var="linkedStockpile" value="1"></c:set>
								<div class="panel-group sa-panel-group"
									id="exampleAccordionDefault" aria-multiselectable="true"
									role="tablist">
									<div class="panel">
										<div class="panel-heading" id="exampleHeadingDefaultOne"
											role="tab">
											<a class="panel-title collapsed" data-toggle="collapse"
												href="#exampleCollapseDefaultOne"
												data-parent="#exampleAccordionDefault" aria-expanded="false"
												aria-controls="exampleCollapseDefaultOne"> Monthly
												Landed Cost & Lead Time </a>
										</div>
										<div class="panel-collapse collapse"
											id="exampleCollapseDefaultOne"
											aria-labelledby="exampleHeadingDefaultOne" role="tabpanel"
											aria-expanded="false" style="height: 0px;">
											<div class="panel-body" style="padding-right: 5px">
												<div class="table-total" id="parent">
													<table style="background-color: light-grey"
														class="table margin-bottom-0 table-bordered  Tableresponsive1"
														id="fixedHeader1">
														<thead>
															<tr id="landedCostLeadTime">
																<th>Type of Contract</th>
																<th>Channel</th>
																<th>Sub Channel</th>
																<th>Subsidiary</th>
																<th>Source</th>
																<th>Input Mode</th>
																<th>Contract ID</th>
																<th>Start Date</th>
																<th>End Date</th>
																<th>Validity (days)</th>
																<th>Spread Over (days)</th>
																<th>Lead Time (days)</th>
																<th class="header-cell col1 month111">F1,M1</th>
																<th class="header-cell col1 month112">F2,M1</th>
																<th class="header-cell col1 month2">M2</th>
																<th class="header-cell col1 month3">M3</th>
																<th class="header-cell col1 month4">M4</th>
																<th class="header-cell col1 month5">M5</th>
																<th class="header-cell col1 month6">M6</th>
																<th class="header-cell col1 month7">M7</th>
																<th class="header-cell col1 month8">M8</th>
																<th class="header-cell col1 month9">M9</th>
																<th class="header-cell col1 month10">M10</th>
																<th class="header-cell col1 month11">M11</th>
																<th class="header-cell col1 month12">M12</th>
																<th class="header-cell col1 month13">M13</th>
																<th class="header-cell col1 month14">M14</th>
																<th class="header-cell col1 month15">M15</th>
																<th class="header-cell col1 month16">M16</th>
																<th class="header-cell col1 month17">M17</th>
																<th class="header-cell col1 month18">M18</th>
																<th class="header-cell col1 month19">M19</th>
																<th class="header-cell col1 month20">M20</th>
																<th class="header-cell col1 month21">M21</th>
																<th class="header-cell col1 month22">M22</th>
																<th class="header-cell col1 month23">M23</th>
																<th class="header-cell col1 month24">M24</th>
															</tr>
														</thead>
														<tbody class="activeTable"
															style="color: #000; font-weight: 400;">
															<c:forEach
																items="${navCalculation.monthlyLandedCosts.firmLinkageLandedCost}"
																var="firmLinkageLandedCost" varStatus="theCount">
																<tr>
																	<td><span>${firmLinkageLandedCost.firmLinkageModel.ctModel.contractType}</span></td>
																	<td><span>${firmLinkageLandedCost.firmLinkageModel.channelModel.channelName}</span></td>
																	<td><span>${firmLinkageLandedCost.firmLinkageModel.scModel.subChannel}</span></td>
																	<td><span>${firmLinkageLandedCost.firmLinkageModel.subsidiarymodel.subsidiaryName}</span></td>
																	<td><span>${firmLinkageLandedCost.firmLinkageModel.sourceModel.sourceName}</span></td>
																	<td><span>${firmLinkageLandedCost.firmLinkageModel.tmModel.transportMode}</span></td>
																	<c:choose>
																		<c:when
																			test="${firmLinkageLandedCost.firmLinkageModel.linkedToStockpile==0}">
																			<c:set var="linkedStockpile" value="0"></c:set>
																			<td><span style="color: #f96868">${firmLinkageLandedCost.firmLinkageModel.contractId}</span></td>
																		</c:when>
																		<c:otherwise>
																			<td><span>${firmLinkageLandedCost.firmLinkageModel.contractId}</span></td>
																		</c:otherwise>
																	</c:choose>
																	<td><span><fmt:formatDate
																				value="${firmLinkageLandedCost.firmLinkageModel.startDate}"
																				pattern="dd/MM/yyyy" /></span></td>
																	<td><span><fmt:formatDate
																				value="${firmLinkageLandedCost.firmLinkageModel.endDate}"
																				pattern="dd/MM/yyyy" /></span></td>
																	<td><span>${firmLinkageLandedCost.validity}</span></td>
																	<td><span><form:input type="number" style="width: 100%;"
																				path="monthlyLandedCosts.firmLinkageLandedCost[${theCount.index}].spreadOver"
																				min="0" max="365" />
																					</span></td>
																	<td><span><form:input type="number" style="width: 100%;"
																				path="monthlyLandedCosts.firmLinkageLandedCost[${theCount.index}].leadTime"
																				min="0" max="9999" /></span></td>
																	<c:forEach
																		items="${firmLinkageLandedCost.firmLinkageMonthlyLandedCostModel}"
																		var="monthlyLandedCost">
																		<td><span><fmt:formatNumber
																					value="${monthlyLandedCost.landedCost}"
																					maxFractionDigits="1" type="number" pattern="#" /></span></td>
																	</c:forEach>
																</tr>
															</c:forEach>
															<c:forEach
																items="${navCalculation.monthlyLandedCosts.futureDefinedLinkageLandedCost}"
																var="futureDefinedLinkageLandedCost"
																varStatus="theCount">
																<tr>
																	<td><span>${futureDefinedLinkageLandedCost.futureDefinedLinkageModel.ctModel.contractType}</span></td>
																	<td><span>${futureDefinedLinkageLandedCost.futureDefinedLinkageModel.channelModel.channelName}</span></td>
																	<td><span>${futureDefinedLinkageLandedCost.futureDefinedLinkageModel.scModel.subChannel}</span></td>
																	<td><span>${futureDefinedLinkageLandedCost.futureDefinedLinkageModel.subsidiarymodel.subsidiaryName}</span></td>
																	<td><span>${futureDefinedLinkageLandedCost.futureDefinedLinkageModel.sourceModel.sourceName}</span></td>
																	<td><span>${futureDefinedLinkageLandedCost.futureDefinedLinkageModel.tmModel.transportMode}</span></td>
																	<c:choose>
																		<c:when
																			test="${futureDefinedLinkageLandedCost.futureDefinedLinkageModel.linkedToStockpile==0}">
																			<c:set var="linkedStockpile" value="0"></c:set>
																			<td><span style="color: #f96868">${futureDefinedLinkageLandedCost.futureDefinedLinkageModel.contractId}</span></td>
																		</c:when>
																		<c:otherwise>
																			<td><span>${futureDefinedLinkageLandedCost.futureDefinedLinkageModel.contractId}</span></td>
																		</c:otherwise>
																	</c:choose>
																	<td><span>${futureDefinedLinkageLandedCost.futureDefinedLinkageModel.startDate}</span></td>
																	<td><span>${futureDefinedLinkageLandedCost.futureDefinedLinkageModel.endDate}</span></td>
																	<td><span>${futureDefinedLinkageLandedCost.validity}</span></td>
																	<td><span><form:input type="number" style="width: 100%;"
																				path="monthlyLandedCosts.futureDefinedLinkageLandedCost[${theCount.index}].spreadOver"
																				min="0" max="365" /></span></td>
																	<td><span><form:input type="number" style="width: 100%;"
																				path="monthlyLandedCosts.futureDefinedLinkageLandedCost[${theCount.index}].leadTime"
																				min="0" max="9999" /></span></td>
																	<c:forEach
																		items="${futureDefinedLinkageLandedCost.futureWithDefinedLinkageMonthlyLandedCostModel}"
																		var="monthlyLandedCost">
																		<td><span><fmt:formatNumber
																					value="${monthlyLandedCost.landedCost}"
																					maxFractionDigits="1" type="number" pattern="#" /></span></td>
																	</c:forEach>
																</tr>
															</c:forEach>
															<c:forEach
																items="${navCalculation.monthlyLandedCosts.futureUndefinedLandedCost}"
																var="futureUndefinedLandedCost" varStatus="theCount">
																<tr>
																	<td><span>${futureUndefinedLandedCost.futureUndefinedModel.ctModel.contractType}</span></td>
																	<td><span>${futureUndefinedLandedCost.futureUndefinedModel.chaModel.channelName}</span></td>
																	<td><span>${futureUndefinedLandedCost.futureUndefinedModel.scModel.subChannel}</span></td>
																	<td><span>${futureUndefinedLandedCost.futureUndefinedModel.subsModel.subsidiaryName}</span></td>
																	<td><span>${futureUndefinedLandedCost.sourceModel.sourceName}</span></td>
																	<td><span>Rail</span></td>
																	<td><span>${futureUndefinedLandedCost.futureUndefinedModel.contractId}</span></td>
																	<td><span>${futureUndefinedLandedCost.futureUndefinedModel.startDate}</span></td>
																	<td><span>${futureUndefinedLandedCost.futureUndefinedModel.endDate}</span></td>
																	<td><span>${futureUndefinedLandedCost.validity}</span></td>
																	<td><span><form:input type="number" style="width: 100%;"
																				path="monthlyLandedCosts.futureUndefinedLandedCost[${theCount.index}].spreadOver"
																				min="0" max="365" /></span></td>
																	<td><span><form:input type="number" style="width: 100%;"
																				path="monthlyLandedCosts.futureUndefinedLandedCost[${theCount.index}].leadTime"
																				min="0" max="9999" /></span></td>
																	<c:forEach
																		items="${futureUndefinedLandedCost.futureUndefinedMonthlyLandedCostModel}"
																		var="monthlyLandedCost">
																		<td><span><fmt:formatNumber
																					value="${monthlyLandedCost.landedCost}"
																					maxFractionDigits="1" type="number" pattern="#" /></span></td>
																	</c:forEach>
																</tr>
															</c:forEach>
															<c:forEach
																items="${navCalculation.monthlyLandedCosts.firmImportedLandedCost}"
																var="firmImportedLandedCost" varStatus="theCount">
																<tr>
																	<td><span>${firmImportedLandedCost.firmImportedModel.ctModel.contractType}</span></td>
																	<td><span>${firmImportedLandedCost.firmImportedModel.channelModel.channelName}</span></td>
																	<td><span>${firmImportedLandedCost.firmImportedModel.scModel.subChannel}</span></td>
																	<td><span>NA</span></td>
																	<td><span>${firmImportedLandedCost.firmImportedModel.sourceModel.sourceName}</span></td>
																	<td><span>${firmImportedLandedCost.firmImportedModel.tmModel.transportMode}</span></td>
																	<c:choose>
																		<c:when
																			test="${firmImportedLandedCost.firmImportedModel.linkedToStockpile==0}">
																			<c:set var="linkedStockpile" value="0"></c:set>
																			<td><span style="color: #f96868">${firmImportedLandedCost.firmImportedModel.contractId}</span></td>
																		</c:when>
																		<c:otherwise>
																			<td><span>${firmImportedLandedCost.firmImportedModel.contractId}</span></td>
																		</c:otherwise>
																	</c:choose>
																	<td><span><fmt:formatDate
																				value="${firmImportedLandedCost.firmImportedModel.startDate}"
																				pattern="dd/MM/yyyy" /></span></td>
																	<td><span><fmt:formatDate
																				value="${firmImportedLandedCost.firmImportedModel.endDate}"
																				pattern="dd/MM/yyyy" /></span></td>
																	<td><span>${firmImportedLandedCost.validity}</span></td>
																	<td><span><form:input type="number" style="width: 100%;"
																				path="monthlyLandedCosts.firmImportedLandedCost[${theCount.index}].spreadOver"
																				min="0" max="365" /></span></td>
																	<td><span><form:input type="number" style="width: 100%;"
																				path="monthlyLandedCosts.firmImportedLandedCost[${theCount.index}].leadTime"
																				min="0" max="9999" /></span></td>
																	<c:forEach
																		items="${firmImportedLandedCost.firmImportedMonthlyLandedCostModel}"
																		var="monthlyLandedCost">
																		<td><span><fmt:formatNumber
																					value="${monthlyLandedCost.landedCost}"
																					maxFractionDigits="1" type="number" pattern="#" /></span></td>
																	</c:forEach>
																</tr>
															</c:forEach>
															<c:forEach
																items="${navCalculation.monthlyLandedCosts.futureDefinedImportedLandedCost}"
																var="futureDefinedImportedLandedCost"
																varStatus="theCount">
																<tr>
																	<td><span>${futureDefinedImportedLandedCost.futureDefinedImportedModel.ctModel.contractType}</span></td>
																	<td><span>${futureDefinedImportedLandedCost.futureDefinedImportedModel.channelModel.channelName}</span></td>
																	<td><span>${futureDefinedImportedLandedCost.futureDefinedImportedModel.scModel.subChannel}</span></td>
																	<td><span>NA</span></td>
																	<td><span>${futureDefinedImportedLandedCost.futureDefinedImportedModel.sourceModel.sourceName}</span></td>
																	<td><span>${futureDefinedImportedLandedCost.futureDefinedImportedModel.tmModel.transportMode}</span></td>
																	<c:choose>
																		<c:when
																			test="${futureDefinedImportedLandedCost.futureDefinedImportedModel.linkedToStockpile==0}">
																			<c:set var="linkedStockpile" value="0"></c:set>
																			<td><span style="color: #f96868">${futureDefinedImportedLandedCost.futureDefinedImportedModel.contractId}</span></td>
																		</c:when>
																		<c:otherwise>
																			<td><span>${futureDefinedImportedLandedCost.futureDefinedImportedModel.contractId}</span></td>
																		</c:otherwise>
																	</c:choose>
																	<td><span><fmt:formatDate
																				value="${futureDefinedImportedLandedCost.futureDefinedImportedModel.startDate}"
																				pattern="dd/MM/yyyy" /></span></td>
																	<td><span><fmt:formatDate
																				value="${futureDefinedImportedLandedCost.futureDefinedImportedModel.endDate}"
																				pattern="dd/MM/yyyy" /></span></td>
																	<td><span>${futureDefinedImportedLandedCost.validity}</span></td>
																	<td><span><form:input type="number" style="width: 100%;"
																				path="monthlyLandedCosts.futureDefinedImportedLandedCost[${theCount.index}].spreadOver"
																				min="0" max="365" /></span></td>
																	<td><span><form:input type="number" style="width: 100%;"
																				path="monthlyLandedCosts.futureDefinedImportedLandedCost[${theCount.index}].leadTime"
																				min="0" max="9999" /></span></td>
																	<c:forEach
																		items="${futureDefinedImportedLandedCost.futureDefinedImportedMonthlyLandedCostModel}"
																		var="monthlyLandedCost">
																		<td><span><fmt:formatNumber
																					value="${monthlyLandedCost.landedCost}"
																					maxFractionDigits="1" type="number" pattern="#" /></span></td>
																	</c:forEach>
																</tr>
															</c:forEach>
															<c:forEach
																items="${navCalculation.monthlyLandedCosts.firmOthersLandedCost}"
																var="firmOthersLandedCost" varStatus="theCount">
																<tr>
																	<td><span>${firmOthersLandedCost.firmOthersModel.ctModel.contractType}</span></td>
																	<td><span>${firmOthersLandedCost.firmOthersModel.chaModel.channelName}</span></td>
																	<td><span>${firmOthersLandedCost.firmOthersModel.scModel.subChannel}</span></td>
																	<td><span>NA</span></td>
																	<td><span>${firmOthersLandedCost.firmOthersModel.sourceModel.sourceName}</span></td>
																	<td><span>${firmOthersLandedCost.firmOthersModel.tModel.transportMode}</span></td>
																	<c:choose>
																		<c:when
																			test="${firmOthersLandedCost.firmOthersModel.linkedToStockpile==0}">
																			<c:set var="linkedStockpile" value="0"></c:set>
																			<td><span style="color: #f96868">${firmOthersLandedCost.firmOthersModel.contractId}</span></td>
																		</c:when>
																		<c:otherwise>
																			<td><span>${firmOthersLandedCost.firmOthersModel.contractId}</span></td>
																		</c:otherwise>
																	</c:choose>
																	<td><span><fmt:formatDate
																				value="${firmOthersLandedCost.firmOthersModel.startDate}"
																				pattern="dd/MM/yyyy" /></span></td>
																	<td><span><fmt:formatDate
																				value="${firmOthersLandedCost.firmOthersModel.endDate}"
																				pattern="dd/MM/yyyy" /></span></td>
																	<td><span>${firmOthersLandedCost.validity}</span></td>
																	<td><span><form:input type="number" style="width: 100%;"
																				path="monthlyLandedCosts.firmOthersLandedCost[${theCount.index}].spreadOver"
																				min="0" max="365" /></span></td>
																	<td><span><form:input type="number" style="width: 100%;"
																				path="monthlyLandedCosts.firmOthersLandedCost[${theCount.index}].leadTime"
																				min="0" max="9999" /></span></td>
																	<c:forEach
																		items="${firmOthersLandedCost.firmOthersMonthlyLandedCostModel}"
																		var="monthlyLandedCost">
																		<td><span><fmt:formatNumber
																					value="${monthlyLandedCost.landedCost}"
																					maxFractionDigits="1" type="number" pattern="#" /></span></td>
																	</c:forEach>
																</tr>
															</c:forEach>
															<c:forEach
																items="${navCalculation.monthlyLandedCosts.futureDefinedOthersLandedCost}"
																var="futureDefinedOthersLandedCost" varStatus="theCount">
																<tr>
																	<td><span>${futureDefinedOthersLandedCost.futureDefinedOthersModel.ctModel.contractType}</span></td>
																	<td><span>${futureDefinedOthersLandedCost.futureDefinedOthersModel.chaModel.channelName}</span></td>
																	<td><span>${futureDefinedOthersLandedCost.futureDefinedOthersModel.scModel.subChannel}</span></td>
																	<td><span>NA</span></td>
																	<td><span>${futureDefinedOthersLandedCost.futureDefinedOthersModel.sourceModel.sourceName}</span></td>
																	<td><span>${futureDefinedOthersLandedCost.futureDefinedOthersModel.tModel.transportMode}</span></td>
																	<c:choose>
																		<c:when
																			test="${futureDefinedOthersLandedCost.futureDefinedOthersModel.linkedToStockpile==0}">
																			<c:set var="linkedStockpile" value="0"></c:set>
																			<td><span style="color: #f96868">${futureDefinedOthersLandedCost.futureDefinedOthersModel.contractId}</span></td>
																		</c:when>
																		<c:otherwise>
																			<td><span>${futureDefinedOthersLandedCost.futureDefinedOthersModel.contractId}</span></td>
																		</c:otherwise>
																	</c:choose>
																	<td><span><fmt:formatDate
																				value="${futureDefinedOthersLandedCost.futureDefinedOthersModel.startDate}"
																				pattern="dd/MM/yyyy" /></span></td>
																	<td><span><fmt:formatDate
																				value="${futureDefinedOthersLandedCost.futureDefinedOthersModel.endDate}"
																				pattern="dd/MM/yyyy" /></span></td>
																	<td><span>${futureDefinedOthersLandedCost.validity}</span></td>
																	<td><span><form:input type="number" style="width: 100%;"
																				path="monthlyLandedCosts.futureDefinedOthersLandedCost[${theCount.index}].spreadOver"
																				min="0" max="365" /></span></td>
																	<td><span><form:input type="number" style="width: 100%;"
																				path="monthlyLandedCosts.futureDefinedOthersLandedCost[${theCount.index}].leadTime"
																				min="0" max="9999" /></span></td>
																	<c:forEach
																		items="${futureDefinedOthersLandedCost.futureDefinedOthersMonthlyLandedCostModel}"
																		var="monthlyLandedCost">
																		<td><span><fmt:formatNumber
																					value="${monthlyLandedCost.landedCost}"
																					maxFractionDigits="1" type="number" pattern="#" /></span></td>
																	</c:forEach>
																</tr>
															</c:forEach>
														</tbody>
													</table>
													<span id="linkedStockpile" class="hidden"><c:out
															value="${linkedStockpile}"></c:out></span>
												</div>
											</div>
										</div>
									</div>

									<div class="panel">
										<div class="panel-heading" id="exampleHeadingDefaultStock"
											role="tab">
											<a class="panel-title collapsed" data-toggle="collapse"
												href="#exampleCollapseDefaultStock"
												data-parent="#exampleAccordionDefault" aria-expanded="false"
												aria-controls="exampleCollapseDefaultStock"> Stock Info
											</a>
										</div>
										<div class="panel-collapse collapse"
											id="exampleCollapseDefaultStock"
											aria-labelledby="exampleHeadingDefaultStock" role="tabpanel"
											aria-expanded="false" style="height: 0px;">
											<div class="panel-body">
												<div
													style="color: #ab0404; padding-left: 5px; margin-top: 15px;">
													<table
														class="table margin-bottom-0 table-bordered Tableresponsive table-responsive"
														id="fixedHeader"
														style="width: 450px; background-color: lightgrey">
														<thead>
															<tr>
																<th></th>
																<th>Monsoon (days)</th>
																<th>Non-monsoon (days)</th>
															</tr>
														</thead>
														<tbody class="activeTable"
															style="color: #000; font-weight: 400;">
															<tr>
																<td><span>Target closing stock for plant
																		(days)</span></td>
																<td><span><form:input type="number"
																			path="stockpilesInfoModel.targetClosingStockForPlantMonsoon"
																			value=""
																			style="width: 100%;margin-right:58px;text-align: right;"
																			min="0" max="9999" /></span></td>
																<td><span><form:input type="number"
																			path="stockpilesInfoModel.targetClosingStockForPlantNonMonsoon"
																			value=""
																			style="width: 100%;margin-right:58px;text-align: right;"
																			min="0" max="9999" /></span></td>
															</tr>
															<tr>
																<td><span>Stockyard capacity (t)</span></td>
																<td><span><form:input type="number"
																			path="stockpilesInfoModel.stockyardCapacity" value=""
																			style="width: 100%;margin-right:58px;text-align: right;"
																			min="0" max="999999" /></span></td>
																<td></td>
															</tr>
														</tbody>
													</table>
												</div>
												<div
													style="color: #ab0404; padding-left: 5px; margin-top: 15px;">
													<span style="font-weight: bold">Transshipment
														Point(s)</span>
													<table
														class="table margin-bottom-0 table-bordered Tableresponsive"
														id="tptTable"
														style="width: 450px; background-color: lightgrey">
														<thead>
															<tr>
																<th></th>
																<th></th>
																<th colspan="4" style="text-align: center;">Opening
																	stock (today)</th>
																<th></th>
															</tr>
														</thead>
														<tbody class="activeTable"
															style="color: #000; font-weight: 400;">
															<tr>
																<td style="font-weight: bold">Stockpile no.</td>
																<td style="font-weight: bold">Linked source(s)</td>
																<td style="font-weight: bold">Quantity (t)</td>
																<td style="font-weight: bold">GCV (kCal/kg)</td>
																<td style="font-weight: bold">Ash (%)</td>
																<td style="font-weight: bold">Cost (Rs/t)</td>
																<td style="font-weight: bold">Target stock (t)</td>
															</tr>
															<c:set var="qty" value="0" />
															<c:set var="landedCost" value="0" />
															<c:set var="sumOfGCVQty" value="0" />
															<c:set var="sumOfAshQty" value="0" />
															<c:forEach
																items="${navCalculation.stockpilesInfoModel.transhipmentStockpilesModel}"
																var="transhipmentStockpilesModel" varStatus="theCount">
																<tr style="height: 200px!important;">
																	<td><span>${transhipmentStockpilesModel.stockpileModel.stockpileNumber}</span></td>
																	<td style="background-color: white; position: absolute; width: 78px; overflow-y: auto !important; height: 200px !important;overflow-x: auto !important">
																		<c:forEach
																			items="${transhipmentStockpilesModel.stockpileModel.stockpileSourceModel}"
																			var="stockpileSourceModel" varStatus="theCount2">
																			<c:forEach
																				items="${stockpileSourceModel.stockpileFirmLinkageModel}"
																				var="stockpileFirmLinkageModel">
																				<span>${stockpileFirmLinkageModel.contractFirmLinkageModel.scModel.subChannel},
																					${stockpileFirmLinkageModel.contractFirmLinkageModel.sourceModel.sourceName},
																					${stockpileFirmLinkageModel.contractFirmLinkageModel.grademodel.grade},
																					${stockpileFirmLinkageModel.contractFirmLinkageModel.coalsizemodel.coalSize};</span>
																			</c:forEach>
																			<c:forEach
																				items="${stockpileSourceModel.stockpileImportedModel}"
																				var="stockpileImportedModel">
																				<span>
																					${stockpileImportedModel.contractImportedModel.scModel.subChannel},
																					${stockpileImportedModel.contractImportedModel.sourceModel.sourceName};</span>
																			</c:forEach>
																			<c:forEach
																				items="${stockpileSourceModel.stockpileOthersModel}"
																				var="stockpileOthersModel">
																				<span>
																					${stockpileOthersModel.firmOtherFuelPrimaryModel.scModel.subChannel},
																					${stockpileOthersModel.firmOtherFuelPrimaryModel.sourceModel.sourceName};</span>
																			</c:forEach>
																			<c:forEach
																				items="${stockpileSourceModel.stockpileFDLinkageModel}"
																				var="stockpileFDLinkageModel">
																				<span>
																					${stockpileFDLinkageModel.futureWithDefineSourceModel.scModel.subChannel},
																					${stockpileFDLinkageModel.futureWithDefineSourceModel.sourceModel.sourceName},
																					${stockpileFDLinkageModel.futureWithDefineSourceModel.grademodel.grade},
																					${stockpileFDLinkageModel.futureWithDefineSourceModel.coalsizemodel.coalSize};</span>
																			</c:forEach>
																			<c:forEach
																				items="${stockpileSourceModel.stockpileFDImportedModel}"
																				var="stockpileFDImportedModel">
																				<span>
																					${stockpileFDImportedModel.contractImportedFDModel.scModel.subChannel},
																					${stockpileFDImportedModel.contractImportedFDModel.sourceModel.sourceName};</span>
																			</c:forEach>
																			<c:forEach
																				items="${stockpileSourceModel.stockpileFDOthersModel}"
																				var="stockpileFDOthersModel"  varStatus="theCount3">
																				<span>
																					${stockpileFDOthersModel.firmOtherFDPrimaryModel.scModel.subChannel},
																					${stockpileFDOthersModel.firmOtherFDPrimaryModel.sourceModel.sourceName}<c:if
																						test="${!theCount3.last}">; </c:if>
																				</span>
																			</c:forEach>
																		</c:forEach>
																	</td>
																	<td><span>${transhipmentStockpilesModel.quantity}</span></td>
																	<td><span>${transhipmentStockpilesModel.GCV}</span></td>
																	<td><span>${transhipmentStockpilesModel.ash}</span></td>
																	<td><span>${transhipmentStockpilesModel.landedCost}</span></td>
																	<td><span><form:input type="number"
																				path="stockpilesInfoModel.transhipmentStockpilesModel[${theCount.index}].targetStockInTonnes"
																				id="targetStockTPT${theCount.index}"
																				onchange="targetStockTPTWtAvg(this)"
																				style="width: 100%;margin-right:58px;text-align: right;"
																				min="0" max="999999" /></span></td>
																	<c:set var="qty"
																		value="${qty + transhipmentStockpilesModel.quantity}" />
																	<c:set var="sumOfGCVQty"
																		value="${sumOfGCVQty + transhipmentStockpilesModel.quantity*transhipmentStockpilesModel.GCV}" />
																	<c:set var="sumOfAshQty"
																		value="${sumOfAshQty + transhipmentStockpilesModel.quantity*transhipmentStockpilesModel.ash}" />
																	<c:set var="landedCost"
																		value="${landedCost + transhipmentStockpilesModel.landedCost*transhipmentStockpilesModel.quantity*transhipmentStockpilesModel.GCV}" />
																</tr>
															</c:forEach>
															<tr>
																<td><span></span></td>
																<td style="font-weight: bold"><span>Total/Wtd. Avg.</span></td>
																<td><span>${qty}<form:input type="hidden"
																			path="stockpilesInfoModel.transhipmentQuantityTotal"
																			value="${qty}"/></span></td>
																<c:choose>
																	<c:when test="${qty==0 || sumOfGCVQty==0 || sumOfAshQty==0 || landedCost==0}">
																		<td><span>0<form:input type="hidden"
																			path="stockpilesInfoModel.transhipmentGCVWtAvg"
																			value="0"/></span></td>
																		<td><span>0<form:input type="hidden"
																					path="stockpilesInfoModel.transhipmentAshWtAvg"
																					value="0"/></span></td>
																		<td><span>0<form:input type="hidden"
																					path="stockpilesInfoModel.transhipmentLandedCostWtAvg"
																					value="0"/></span></td>
																	</c:when>
																	<c:otherwise>
																		<td><span><fmt:formatNumber value="${sumOfGCVQty/qty}" maxFractionDigits="0" pattern="#"></fmt:formatNumber><form:input type="hidden"
																			path="stockpilesInfoModel.transhipmentGCVWtAvg"
																			value="${sumOfGCVQty/qty}"/></span></td>
																		<td><span><fmt:formatNumber value="${sumOfAshQty/qty}" maxFractionDigits="0" pattern="#"></fmt:formatNumber><form:input type="hidden"
																					path="stockpilesInfoModel.transhipmentAshWtAvg"
																					value="${sumOfAshQty/qty}"/></span></td>
																		<td><span><fmt:formatNumber value="${landedCost/sumOfGCVQty}" maxFractionDigits="0" pattern="#"></fmt:formatNumber><form:input type="hidden"
																					path="stockpilesInfoModel.transhipmentLandedCostWtAvg"
																					value="${landedCost/sumOfGCVQty}"/></span></td>
																	</c:otherwise>								
																</c:choose>
																
																<td><span class="targetStockTPTWtAvg">0<form:input
																			type="hidden"
																			path="stockpilesInfoModel.transhipmentTargetStockWtAvg"
																			class="targetStockTPTWtAvg" /></span></td>
															</tr>
														</tbody>
													</table>
												</div>
												<div
													style="color: #ab0404; padding-left: 5px; margin-top: 15px;">
													<span style="font-weight: bold">ROM Stockpile(s)</span>
													<table
														class="table margin-bottom-0 table-bordered Tableresponsive2"
														id="fixedHeader"
														style="width: 450px; background-color: lightgrey">
														<thead>
															<tr>
																<th></th>
																<th></th>
																<th colspan="4" style="text-align: center;">Opening
																	stock</th>
																<th></th>
																<th></th>
																<th colspan="25" style="text-align: center;">Target
																	stock (days)</th>
															</tr>
														</thead>
														<tbody class="activeTable"
															style="color: #000; font-weight: 400;">
															<tr>
																<td style="font-weight: bold">Stockpile no.</td>
																<td style="font-weight: bold">Linked source(s)</td>
																<td style="font-weight: bold">Quantity (t)</td>
																<td style="font-weight: bold">GCV (kCal/kg)</td>
																<td style="font-weight: bold">Ash (%)</td>
																<td style="font-weight: bold">Cost (Rs/t)</td>
																<td style="font-weight: bold">Min GCV (kCal/kg)</td>
																<td style="font-weight: bold">Max GCV (kCal/kg)</td>
																<td class="header-cell col1 month111">F1,M1</td>
																<td class="header-cell col1 month112">F2,M1</td>
																<td class="header-cell col1 month2">M2</td>
																<td class="header-cell col1 month3">M3</td>
																<td class="header-cell col1 month4">M4</td>
																<td class="header-cell col1 month5">M5</td>
																<td class="header-cell col1 month6">M6</td>
																<td class="header-cell col1 month7">M7</td>
																<td class="header-cell col1 month8">M8</td>
																<td class="header-cell col1 month9">M9</td>
																<td class="header-cell col1 month10">M10</td>
																<td class="header-cell col1 month11">M11</td>
																<td class="header-cell col1 month12">M12</td>
																<td class="header-cell col1 month13">M13</td>
																<td class="header-cell col1 month14">M14</td>
																<td class="header-cell col1 month15">M15</td>
																<td class="header-cell col1 month16">M16</td>
																<td class="header-cell col1 month17">M17</td>
																<td class="header-cell col1 month18">M18</td>
																<td class="header-cell col1 month19">M19</td>
																<td class="header-cell col1 month20">M20</td>
																<td class="header-cell col1 month21">M21</td>
																<td class="header-cell col1 month22">M22</td>
																<td class="header-cell col1 month23">M23</td>
																<td class="header-cell col1 month24">M24</td>
															</tr>
															<c:set var="qty" value="0" />
															<c:set var="landedCost" value="0" />
															<c:set var="sumOfGCVQty" value="0" />
															<c:set var="sumOfAshQty" value="0" />
															<c:set var="listSize" value="0" />
															<c:forEach
																items="${navCalculation.stockpilesInfoModel.romStockpilesModel}"
																var="romStockpilesModel" varStatus="theCount">
																<tr  style="height: 200px !important;">
																	<td><span>${romStockpilesModel.stockpileModel.stockpileNumber}</span></td>
																	<td style="background-color: white; position: absolute !important; width: 92px; overflow-y: auto !important; height: 200px !important;overflow-x: auto !important">
																		<c:forEach
																			items="${romStockpilesModel.stockpileModel.stockpileSourceModel}"
																			var="stockpileSourceModel" varStatus="theCount2">
																			<c:forEach
																				items="${stockpileSourceModel.stockpileFirmLinkageModel}"
																				var="stockpileFirmLinkageModel">
																				<span>${stockpileFirmLinkageModel.contractFirmLinkageModel.scModel.subChannel},
																					${stockpileFirmLinkageModel.contractFirmLinkageModel.sourceModel.sourceName},
																					${stockpileFirmLinkageModel.contractFirmLinkageModel.grademodel.grade},
																					${stockpileFirmLinkageModel.contractFirmLinkageModel.coalsizemodel.coalSize};</span>
																			</c:forEach>
																			<c:forEach
																				items="${stockpileSourceModel.stockpileImportedModel}"
																				var="stockpileImportedModel">
																				<span>
																					${stockpileImportedModel.contractImportedModel.scModel.subChannel},
																					${stockpileImportedModel.contractImportedModel.sourceModel.sourceName};</span>
																			</c:forEach>
																			<c:forEach
																				items="${stockpileSourceModel.stockpileOthersModel}"
																				var="stockpileOthersModel">
																				<span>
																					${stockpileOthersModel.firmOtherFuelPrimaryModel.scModel.subChannel},
																					${stockpileOthersModel.firmOtherFuelPrimaryModel.sourceModel.sourceName};</span>
																			</c:forEach>
																			<c:forEach
																				items="${stockpileSourceModel.stockpileFDLinkageModel}"
																				var="stockpileFDLinkageModel">
																				<span>
																					${stockpileFDLinkageModel.futureWithDefineSourceModel.scModel.subChannel},
																					${stockpileFDLinkageModel.futureWithDefineSourceModel.sourceModel.sourceName},
																					${stockpileFDLinkageModel.futureWithDefineSourceModel.grademodel.grade},
																					${stockpileFDLinkageModel.futureWithDefineSourceModel.coalsizemodel.coalSize};</span>
																			</c:forEach>
																			<c:forEach
																				items="${stockpileSourceModel.stockpileFDImportedModel}"
																				var="stockpileFDImportedModel">
																				<span>
																					${stockpileFDImportedModel.contractImportedFDModel.scModel.subChannel},
																					${stockpileFDImportedModel.contractImportedFDModel.sourceModel.sourceName};</span>
																			</c:forEach>
																			<c:forEach
																				items="${stockpileSourceModel.stockpileFDOthersModel}"
																				var="stockpileFDOthersModel">
																				<span>
																					${stockpileFDOthersModel.firmOtherFDPrimaryModel.scModel.subChannel},
																					${stockpileFDOthersModel.firmOtherFDPrimaryModel.sourceModel.sourceName};</span>
																			</c:forEach>
																		</c:forEach> 
																		<c:forEach
																			items="${romStockpilesModel.stockpileModel.romValues}"
																			var="romValues" varStatus="theCount3">
																			<span>
																				${romValues.stockpileCode}-${romValues.stockpileNumber}<c:if
																					test="${!theCount3.last}">; </c:if>
																			</span>
																		</c:forEach>
																	</td>
																	<td><span>${romStockpilesModel.quantity}</span></td>
																	<td><span>${romStockpilesModel.GCV}</span></td>
																	<td><span>${romStockpilesModel.ash}</span></td>
																	<td><span>${romStockpilesModel.landedCost}</span></td>
																	<td><span>${romStockpilesModel.minGCV}</span></td>
																	<td><span>${romStockpilesModel.maxGCV}</span></td>
																	<c:forEach
																		items="${romStockpilesModel.targetStockInDaysModel}"
																		var="j" varStatus="theCount2">
																		<td><span><form:input type="number"
																					path="stockpilesInfoModel.romStockpilesModel[${theCount.index}].targetStockInDaysModel[${theCount2.index}].days"
																					id="targetStockROM${theCount.index}${theCount2.index}"
																					onchange="targetStockROMWtAvg(this)"
																					style="width: 100%;margin-right:58px;text-align: right;"
																					min="0" max="999999" /></span></td>
																	</c:forEach>
																	<c:set var="qty"
																		value="${qty + romStockpilesModel.quantity}" />
																	<c:set var="sumOfGCVQty"
																		value="${sumOfGCVQty + romStockpilesModel.quantity*romStockpilesModel.GCV}" />
																	<c:set var="sumOfAshQty"
																		value="${sumOfAshQty + romStockpilesModel.quantity*romStockpilesModel.ash}" />
																	<c:set var="landedCost"
																		value="${landedCost + romStockpilesModel.landedCost*romStockpilesModel.quantity*romStockpilesModel.GCV}" />
																	<c:set var="sumOfMinGCVQty"
																		value="${sumOfMinGCVQty + romStockpilesModel.quantity*romStockpilesModel.minGCV}" />
																	<c:set var="sumOfMaxGCVQty"
																		value="${sumOfMaxGCVQty + romStockpilesModel.quantity*romStockpilesModel.maxGCV}" />		
																</tr>
															</c:forEach>
															<tr>
																<td><span></span></td>
																<td style="font-weight: bold"><span>Total/Wtd. Avg.</span></td>
																<td><span>${qty}<form:input type="hidden"
																			path="stockpilesInfoModel.romQuantityTotal"
																			value="${qty}"/></span></td>
																<c:choose>
																	<c:when test="${qty==0 || sumOfGCVQty==0 || sumOfAshQty==0 || landedCost==0}">
																		<td><span>0<form:input type="hidden"
																			path="stockpilesInfoModel.romGCVWtAvg" value="0"/></span></td>
																		<td><span>0<form:input type="hidden"
																					path="stockpilesInfoModel.romAshWtAvg" value="0"/></span></td>
																		<td><span>0<form:input type="hidden"
																					path="stockpilesInfoModel.romLandedCostWtAvg"
																					value="0"/></span></td>
																		<td><span>0<form:input type="hidden"
																			path="stockpilesInfoModel.romMinGCVWtAvg" value="0"
																			style="width: 100%;margin-right:58px;text-align: right;"
																			min="0" max="9999" readonly="true" /></span></td>
																		<td><span>0<form:input type="hidden"
																			path="stockpilesInfoModel.romMaxGCVWtAvg" value="0"
																			style="width: 100%;margin-right:58px;text-align: right;"
																			min="0" max="9999" readonly="true" /></span></td>				
																	</c:when>
																	<c:otherwise>
																		<td><span><fmt:formatNumber value="${sumOfGCVQty/qty}" maxFractionDigits="0" pattern="#"></fmt:formatNumber><form:input type="hidden"
																			path="stockpilesInfoModel.romGCVWtAvg" value="${sumOfGCVQty/qty}"/></span></td>
																		<td><span><fmt:formatNumber value="${sumOfAshQty/qty}" maxFractionDigits="0" pattern="#"></fmt:formatNumber><form:input type="hidden"
																					path="stockpilesInfoModel.romAshWtAvg" value="${sumOfAshQty/qty}"/></span></td>
																		<td><span><fmt:formatNumber value="${landedCost/sumOfGCVQty}" maxFractionDigits="0" pattern="#"></fmt:formatNumber><form:input type="hidden"
																					path="stockpilesInfoModel.romLandedCostWtAvg"
																					value="${landedCost/sumOfGCVQty}"/></span></td>
																		<td><span><fmt:formatNumber value="${sumOfMinGCVQty/qty}" maxFractionDigits="0" pattern="#"></fmt:formatNumber><form:input type="hidden"
																					path="stockpilesInfoModel.romMinGCVWtAvg" value="${sumOfMinGCVQty/qty}"
																					style="width: 100%;margin-right:58px;text-align: right;"
																					min="0" max="9999" readonly="true" /></span></td>
																		<td><span><fmt:formatNumber value="${sumOfMaxGCVQty/qty}" maxFractionDigits="0" pattern="#"></fmt:formatNumber><form:input type="hidden"
																					path="stockpilesInfoModel.romMaxGCVWtAvg" value="${sumOfMaxGCVQty/qty}"
																					style="width: 100%;margin-right:58px;text-align: right;"
																					min="0" max="9999" readonly="true" /></span></td>
																	</c:otherwise>
																</c:choose>	
																
																<c:forEach items="${navCalculation.stockpilesInfoModel.targetStockInDaysWtAvgModel}" var="targetStockInDaysWtAvgModel" varStatus="theCount2">
																	<td><span class="targetStockROMWtAvg${theCount2.index}">0</span><form:input
																				type="hidden" 
																				path="stockpilesInfoModel.targetStockInDaysWtAvgModel[${theCount2.index}].daysWtAvg"
																				class="targetStockROMWtAvg${theCount2.index}"
																				style="width: 100%;margin-right:58px;text-align: right;"
																				min="0" max="999999" readonly="true" /></td>
																	<c:set var="listSize" value="${listSize + theCount2.index}" />
																</c:forEach>

															</tr>
														</tbody>
													</table>
												</div>
												<div
													style="color: #ab0404; padding-left: 5px; margin-top: 15px;">
													<span style="font-weight: bold">Blended Stockpile(s)</span>
													<table
														class="table margin-bottom-0 table-bordered Tableresponsive"
														id="fixedHeader"
														style="width: 450px; background-color: lightgrey">
														<thead>
															<tr>
																<th></th>
																<th></th>
																<th colspan="4" style="text-align: center;">Opening
																	stock (today)</th>
															</tr>
														</thead>
														<tbody class="activeTable"
															style="color: #000; font-weight: 400;">
															<tr>
																<td style="font-weight: bold">Stockpile no.</td>
																<td style="font-weight: bold">Linked ROM(s)</td>
																<td style="font-weight: bold">Quantity (t)</td>
																<td style="font-weight: bold">GCV (kCal/kg)</td>
																<td style="font-weight: bold">Ash (%)</td>
																<td style="font-weight: bold">Cost (Rs/t)</td>
															</tr>
															<c:set var="qty" value="0" />
															<c:set var="landedCost" value="0" />
															<c:set var="sumOfGCVQty" value="0" />
															<c:set var="sumOfAshQty" value="0" />
															<c:forEach
																items="${navCalculation.stockpilesInfoModel.blendedStockpilesModel}"
																var="blendedStockpilesModel" varStatus="theCount">
																<tr>
																	<td><span>${blendedStockpilesModel.stockpileModel.stockpileNumber}</span></td>
																	<td><c:forEach
																			items="${blendedStockpilesModel.stockpileModel.bddValues}"
																			var="bddValues" varStatus="theCount2">
																			<span>${bddValues.stockpileCode}-${bddValues.stockpileNumber}<c:if
																					test="${!theCount2.last}">,</c:if></span>
																		</c:forEach></td>
																	<td><span>${blendedStockpilesModel.quantity}</span></td>
																	<td><span>${blendedStockpilesModel.GCV}</span></td>
																	<td><span>${blendedStockpilesModel.ash}</span></td>
																	<td><span>${blendedStockpilesModel.landedCost}</span></td>
																	<c:set var="qty"
																		value="${qty + blendedStockpilesModel.quantity}" />
																	<c:set var="sumOfGCVQty"
																		value="${sumOfGCVQty + blendedStockpilesModel.quantity*blendedStockpilesModel.GCV}" />
																	<c:set var="sumOfAshQty"
																		value="${sumOfAshQty + blendedStockpilesModel.quantity*blendedStockpilesModel.ash}" />
																	<c:set var="landedCost"
																		value="${landedCost + blendedStockpilesModel.landedCost*blendedStockpilesModel.quantity*blendedStockpilesModel.GCV}" />
																</tr>
															</c:forEach>
															<tr>
																<td><span></span></td>
																<td style="font-weight: bold"><span>Total/Wtd. Avg.</span></td>
																<td><span>${qty}<form:input type="hidden"
																			path="stockpilesInfoModel.blendedQuantityTotal"
																			value="${qty}"/></span></td>
																<c:choose>
																	<c:when test="${qty==0 || sumOfGCVQty==0 || sumOfAshQty==0 || landedCost==0}">
																		<td><span>0<form:input type="hidden"
																			path="stockpilesInfoModel.blendedGCVWtAvg" value="0"/></span></td>
																		<td><span>0<form:input type="hidden"
																					path="stockpilesInfoModel.blendedAshWtAvg"
																					value="0"/></span></td>
																		<td><span>0<form:input type="hidden"
																					path="stockpilesInfoModel.blendedLandedCostWtAvg"
																					value="0"/></span></td>
																	</c:when>
																	<c:otherwise>
																		<td><span><fmt:formatNumber value="${sumOfGCVQty/qty}" maxFractionDigits="0" pattern="#"></fmt:formatNumber><form:input type="hidden"
																			path="stockpilesInfoModel.blendedGCVWtAvg" value="${sumOfGCVQty/qty}"/></span></td>
																		<td><span><fmt:formatNumber value="${sumOfAshQty/qty}" maxFractionDigits="0" pattern="#"></fmt:formatNumber><form:input type="hidden"
																			path="stockpilesInfoModel.blendedAshWtAvg"
																			value="${sumOfAshQty/qty}"/></span></td>
																		<td><span><fmt:formatNumber value="${landedCost/sumOfGCVQty}" maxFractionDigits="0" pattern="#"></fmt:formatNumber><form:input type="hidden"
																			path="stockpilesInfoModel.blendedLandedCostWtAvg"
																			value="${landedCost/sumOfGCVQty}"/></span></td>
																	</c:otherwise>
																</c:choose>	
																

															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>

									<div class="panel">
										<div class="panel-heading" id="exampleHeadingDefaultTwo"
											role="tab">
											<a class="panel-title collapsed" data-toggle="collapse"
												href="#exampleCollapseDefaultTwo"
												data-parent="#exampleAccordionDefault" aria-expanded="false"
												aria-controls="exampleCollapseDefaultTwo"> EUP
												Constraints </a>
										</div>
										<div class="panel-collapse collapse"
											id="exampleCollapseDefaultTwo"
											aria-labelledby="exampleHeadingDefaultTwo" role="tabpanel"
											aria-expanded="false" style="height: 0px;">
											<div class="panel-body">
												<div
													style="color: #ab0404; padding-left: 5px; margin-top: 15px;">
													<span style="font-weight: bold">Boiler Constraints</span>
													<div class="scrolling">
														<table style="width: 1400px;"
															class="table margin-bottom-0 table-bordered  Tableresponsive"
															id="fixedHeader" style="background-color:lightgrey">
															<thead>
																<tr>
																	<th></th>
																	<th class="header-cell col1 month111">F1,M1</th>
																	<th class="header-cell col1 month112">F2,M1</th>
																	<th class="header-cell col1 month2">M2</th>
																	<th class="header-cell col1 month3">M3</th>
																	<th class="header-cell col1 month4">M4</th>
																	<th class="header-cell col1 month5">M5</th>
																	<th class="header-cell col1 month6">M6</th>
																	<th class="header-cell col1 month7">M7</th>
																	<th class="header-cell col1 month8">M8</th>
																	<th class="header-cell col1 month9">M9</th>
																	<th class="header-cell col1 month10">M10</th>
																	<th class="header-cell col1 month11">M11</th>
																	<th class="header-cell col1 month12">M12</th>
																	<th class="header-cell col1 month13">M13</th>
																	<th class="header-cell col1 month14">M14</th>
																	<th class="header-cell col1 month15">M15</th>
																	<th class="header-cell col1 month16">M16</th>
																	<th class="header-cell col1 month17">M17</th>
																	<th class="header-cell col1 month18">M18</th>
																	<th class="header-cell col1 month19">M19</th>
																	<th class="header-cell col1 month20">M20</th>
																	<th class="header-cell col1 month21">M21</th>
																	<th class="header-cell col1 month22">M22</th>
																	<th class="header-cell col1 month23">M23</th>
																	<th class="header-cell col1 month24">M24</th>
																</tr>
															</thead>
															<tbody class="activeTable"
																style="color: #000; font-weight: 400;">
																<tr>
																	<td><span>Energy requirement (Mn kCal)</span></td>
																	<c:forEach begin="0" end="${monthsCount-1}" step="1" var="j">
																		<td style="width: 6%;" class="hidingFirstCol${j}"><span><form:input
																					class="ftd" id="" type="number"
																					path="eupConstraints.eupEnergyRequirementModel[${j}].energyRequirement"
																					style="width: 100%;margin-right: 80px;text-align: right;"
																					min="0" required="true" /></span></td><!--max="999999" -->
																	</c:forEach>
																</tr>
															</tbody>
														</table>
													</div>
													<div
														style="color: #ab0404; padding-left: 5px; margin-top: 15px;">
														<span></span>
													</div>
												</div>
												<div
													style="color: #ab0404; padding-left: 5px; margin-top: 15px;">
													<span></span>
													<table
														class="table margin-bottom-0 table-bordered  Tableresponsive"
														id="fixedHeader"
														style="width: 386px; background-color: lightgrey">
														<tbody class="activeTable"
															style="color: #000; font-weight: 400;">
															<tr>
																<td><span>Yard handling loss (%)</span></td>
																<td style="width: 6%;"><span><form:input
																			class="ftd" id="" type="number"
																			path="eupConstraints.yardHandlingLoss"
																			style="width: 100%;margin-right: 80px;text-align: right;"
																			min="0" max="999" required="true" /></span></td>
															</tr>
															<tr>
																<td><span>Min Acceptable GCV (kCal/kg)</span></td>
																<td style="width: 6%;"><span><form:input
																			class="ftd" id="" type="number"
																			path="eupConstraints.minAcceptableGCV"
																			style="width: 100%;margin-right: 80px;text-align: right;"
																			min="0" max="9999" required="true" /></span></td>
															</tr>
															<tr>
																<td><span>Max Acceptable GCV (kCal/kg)</span></td>
																<td style="width: 6%;"><span><form:input
																			class="ftd" id="" type="number"
																			path="eupConstraints.maxAcceptableGCV"
																			style="width: 100%;margin-right: 80px;text-align: right;"
																			min="0" max="9999" required="true" /></span></td>
															</tr>
															<tr>
																<td><span>Difference between blended and fed
																		GCV (kCal/kg)</span></td>
																<td style="width: 6%;"><span><form:input
																			class="ftd" id="" type="number"
																			path="eupConstraints.diffBWFeedBlendedGCV"
																			style="width: 100%;margin-right: 80px;text-align: right;"
																			min="0" max="9999" required="true" /></span></td>
															</tr>
														</tbody>
													</table>
												</div>
												<div
													style="color: #ab0404; padding-left: 5px; margin-top: 15px;">
													<span style="font-weight: bold">Coal Capacity
														Constraints</span>
													<table
														class="table margin-bottom-0 table-bordered  Tableresponsive"
														id="fixedHeader"
														style="width: 386px; background-color: lightgrey">
														<tbody class="activeTable"
															style="color: #000; font-weight: 400;">
															<!-- FOR EUP COAL CAPACITY CONSTRAINTS -->
															<tr>
																<td><span>Coal handling capacity via rakes
																		(No. of rakes/month)</span></td>
																<td><span><form:input type="number"
																			path="eupConstraints.coalHandlingCapacityViaRail"
																			style="width: 100%;margin-right:58px;text-align: right;"
																			min="0" max="999" /></span></td>
															</tr>
															<tr>
																<td><span>Coal handling capacity via road
																		mode (t/month)</span></td>
																<td><span><form:input type="number"
																			path="eupConstraints.coalHandlingCapacityViaRoad"
																			style="width: 100%;margin-right:58px;text-align: right;"
																			min="0" max="999999" /></span></td>
															</tr>
															<tr>
																<td><span>Coal handling capacity via BPC
																		(t/month)</span></td>
																<td><span><form:input type="number"
																			path="eupConstraints.coalHandlingCapacityViaBPC"
																			style="width: 100%;margin-right:58px;text-align: right;"
																			min="0" max="999999" /></span></td>
															</tr>
														</tbody>
													</table>
												</div>
												<div
													style="color: #ab0404; padding-left: 5px; margin-top: 15px;">
													<span style="font-weight: bold">Ash Handling
														Constraints</span>
													<table
														class="table margin-bottom-0 table-bordered  Tableresponsive"
														id="fixedHeader"
														style="width: 386px; background-color: lightgrey" id="">
														<!-- FOR EUP ASH HANDLING CONSTRAINTS -->
														<thead>
															<tr>
																<th></th>
																<th>Ash to be handled (t)</th>
																<th>Ash handling cost (Rs/t)</th>
															</tr>
														</thead>
														<tbody class="activeTable"
															style="color: #000; font-weight: 400;">
															<tr>
																<td><span>1st Point</span></td>
																<td><span><form:input type="number"
																			path="eupConstraints.ashHandling1stPoint"
																			style="width: 100%;margin-right:58px;text-align: right;"
																			min="0" max="999999" /></span></td>
																<td><span><form:input type="number"
																			path="eupConstraints.ashHandlingCost1stPoint"
																			style="width: 100%;margin-right:58px;text-align: right;"
																			min="0" max="999999" /></span></td>
															</tr>
															<tr>
																<td><span>2nd Point</span></td>
																<td><span><form:input type="number"
																			path="eupConstraints.ashHandling2ndPoint"
																			style="width: 100%;margin-right:58px;text-align: right;"
																			min="0" max="999999" /></span></td>
																<td><span><form:input type="number"
																			path="eupConstraints.ashHandlingCost2ndPoint"
																			style="width: 100%;margin-right:58px;text-align: right;"
																			min="0" max="999999" /></span></td>
															</tr>
															<tr>
																<td><span>Max</span></td>
																<td><span><form:input type="number"
																			path="eupConstraints.maxAshHandling"
																			style="width: 100%;margin-right:58px;text-align: right;"
																			min="0" max="999999" /></span></td>
																<td><span><form:input type="number"
																			path="eupConstraints.maxAshHandlingCost"
																			style="width: 100%;margin-right:58px;text-align: right;"
																			min="0" max="999999" /></span></td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
									<div class="panel">
										<div class="panel-heading" id="exampleHeadingDefaultThree"
											role="tab">
											<a class="panel-title collapsed" data-toggle="collapse"
												href="#exampleCollapseDefaultThree"
												data-parent="#exampleAccordionDefault" aria-expanded="false"
												aria-controls="exampleCollapseDefaultThree"> Channel
												Constraints </a>
										</div>
										<div class="panel-collapse collapse"
											id="exampleCollapseDefaultThree"
											aria-labelledby="exampleHeadingDefaultThree" role="tabpanel"
											aria-expanded="false" style="height: 0px;">
											<div class="panel-body">
												<table
													class="table margin-bottom-0 table-bordered  Tableresponsive"
													id="fixedHeader"
													style="width: 450px; background-color: lightgrey">
													<thead>
														<tr>
															<th>Channel</th>
															<th>Min Share (%)</th>
															<th>Max Share (%)</th>
														</tr>
													</thead>
													<tbody class="activeTable"
														style="color: #000; font-weight: 400;">
														<c:forEach items="${navCalculation.channelConstraints}"
															var="channelConstraint" varStatus="theCount">
															<tr>
																<!-- SET INDEX FOR CHANNEL LIST TO minShare -->
																<td><span>${channelConstraint.channelModel.channelName}</span></td>
																<td><span><form:input type="number"
																			path="channelConstraints[${theCount.index}].minShare"
																			value="${channelConstraint.minShare}" step="any"
																			style="width: 100%;margin-right:58px;text-align: right;"
																			min="0" max="100" /></span></td>
																<c:choose>
																	<c:when test="${theCount.index==3}">
																		<td><span><form:input type="number"
																					path="channelConstraints[${theCount.index}].maxShare"
																					value="${channelConstraint.maxShare}" step="any"
																					style="width: 100%;margin-right:58px;text-align: right;"
																					min="0" max="10" /></span></td>
																	</c:when>
																	<c:otherwise>
																		<td><span><form:input type="number"
																					path="channelConstraints[${theCount.index}].maxShare"
																					value="${channelConstraint.maxShare}" step="any"
																					style="width: 100%;margin-right:58px;text-align: right;"
																					min="0" max="100" /></span></td>
																	</c:otherwise>
																</c:choose>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</div>
									</div>

									<div class="panel">
										<div class="panel-heading" id="exampleHeadingDefaultShortage"
											role="tab">
											<a class="panel-title collapsed" data-toggle="collapse"
												href="#exampleCollapseDefaultShortage"
												data-parent="#exampleAccordionDefault" aria-expanded="false"
												aria-controls="exampleCollapseDefaultShortage"> Shortage
												Constraints </a>
										</div>
										<div class="panel-collapse collapse"
											id="exampleCollapseDefaultShortage"
											aria-labelledby="exampleHeadingDefaultShortage"
											role="tabpanel" aria-expanded="false" style="height: 0px;">
											<div class="panel-body">
												<table
													class="table margin-bottom-0 table-bordered  Tableresponsive"
													id="fixedHeader"
													style="width: 450px; background-color: lightgrey">
													<thead>
														<tr>
															<th>Transportation mode</th>
															<th>Shortage (%)</th>
														</tr>
													</thead>
													<tbody class="activeTable"
														style="color: #000; font-weight: 400;">
														<c:forEach
															items="${navCalculation.shortageConstraintsModel}"
															var="shortageConstraintsModel" varStatus="theCount">
															<tr>
																<!-- SET INDEX FOR TransportModeModel LIST TO Shortage -->
																<td><span>${shortageConstraintsModel.transportMode.transportMode}</span></td>
																<td><span><form:input type="number"
																			path="shortageConstraintsModel[${theCount.index}].shortage"
																			value="${shortageConstraintsModel.shortage}" step="any"
																			style="width: 100%;margin-right:58px;text-align: right;"
																			min="0" max="100" /></span></td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</div>
									</div>

									<div class="panel">
										<div class="panel-heading" id="exampleHeadingDefaultfour"
											role="tab">
											<a class="panel-title collapsed" data-toggle="collapse"
												href="#exampleCollapseDefaultfour"
												data-parent="#exampleAccordionDefault" aria-expanded="false"
												aria-controls="exampleCollapseDefaultThree"> Source
												Constraints </a>
										</div>
										<div class="panel-collapse collapse"
											id="exampleCollapseDefaultfour"
											aria-labelledby="exampleHeadingDefaultfour" role="tabpanel"
											aria-expanded="false" style="height: 0px;">
											<div class="panel-body">
												<div
													style="color: #ab0404; padding-left: 5px; margin-top: 15px;">
													<span style="font-weight: bold">Linkage</span>
													<table style="background-color: lightgrey"
														class="table margin-bottom-0 table-bordered  Tableresponsive3"
														id="fixedHeader">
														<thead>
															<tr>
																<th>Sub Channel</th>
																<th>Subsidiary</th>
																<th>Source</th>
																<th>Contract ID</th>
																<th>Bid Price (Rs/t)(Mar-FY1)</th>
																<th>Bid Price (Rs/t)(Mar-FY2)</th>
																<th>ACQ (t)</th>
																<th>Min Offtake (%)</th>
																<th>Max Offtake (%)</th>

															</tr>
														</thead>
														<tbody class="activeTable"
															style="color: #000; font-weight: 400;">
															<c:forEach
																items="${navCalculation.sourceConstraints.sourceLinkageConstraints}"
																var="sourceLinkageConstraint" varStatus="theCount">
																<tr>
																	<td><span>${sourceLinkageConstraint.firmLinkageEAuctionModel.scModel.subChannel}</span></td>
																	<td><span>${sourceLinkageConstraint.firmLinkageEAuctionModel.subsidiarymodel.subsidiaryName}</span></td>
																	<td><span>${sourceLinkageConstraint.firmLinkageEAuctionModel.sourceModel.sourceName}</span></td>
																	<td><span>${sourceLinkageConstraint.firmLinkageEAuctionModel.contractId}</span></td>
																	<td><span><fmt:formatNumber
																				value="${sourceLinkageConstraint.firmLinkageEAuctionModel.costParams[0].bidPrice}"
																				maxFractionDigits="0" type="number" pattern="#" /></span></td>
																	<td><span><fmt:formatNumber
																				value="${sourceLinkageConstraint.firmLinkageEAuctionModel.costParams[0].bidPrice}"
																				maxFractionDigits="0" type="number" pattern="#" /></span></td>
																	<td><span><fmt:formatNumber
																				value="${sourceLinkageConstraint.firmLinkageEAuctionModel.contractedQuantity}"
																				maxFractionDigits="0" type="number" pattern="#" /></span></td>
																	<td><span><form:input type="number"
																				path="sourceConstraints.sourceLinkageConstraints[${theCount.index}].minOfftake"
																				value="${sourceLinkageConstraint.minOfftake}"
																				style="width: 100%;margin-right:58px;text-align: right;"
																				min="0" max="100" /></span></td>
																	<td><span><form:input type="number"
																				path="sourceConstraints.sourceLinkageConstraints[${theCount.index}].maxOfftake"
																				value="${sourceLinkageConstraint.maxOfftake}"
																				style="width: 100%;margin-right:58px;text-align: right;"
																				min="0" max="100" /></span></td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>
												<div
													style="color: #ab0404; padding-left: 5px; margin-top: 15px;">
													<span style="font-weight: bold">Captive Mines</span>
													<%-- <table class="table margin-bottom-0 table-bordered  Tableresponsive" id="fixedHeader" style="background-color:lightgrey;max-height: 300px;"  >
                <thead>
                  <tr>					
                  <th>Source</th>
                  <th>Contract ID</th>
                  <th style="text-align: center;">Apr - FY1</th>
                  <th style="text-align: center;">May - FY1</th>
                  <th style="text-align: center;">Jun - FY1</th>
                  <th style="text-align: center;">Jul - FY1</th>
                  <th style="text-align: center;">Aug - FY1</th>
                  <th style="text-align: center;">Sep - FY1</th>
                  <th style="text-align: center;">Oct - FY1</th>
                  <th style="text-align: center;">Nov - FY1</th>
                  <th style="text-align: center;">Dec - FY1</th>
                  <th style="text-align: center;">Jan - FY1</th>
                  <th style="text-align: center;">Feb - FY1</th>
                  <th style="text-align: center;">Mar - FY1</th>
                  <th style="text-align: center;">Apr - FY2</th>
                  <th style="text-align: center;">May - FY2</th>
                  <th style="text-align: center;">Jun - FY2</th>
                  <th style="text-align: center;">Jul - FY2</th>
                  <th style="text-align: center;">Aug - FY2</th>
                  <th style="text-align: center;">Sep - FY2</th>
                  <th style="text-align: center;">Oct - FY2</th>
                  <th style="text-align: center;">Nov - FY2</th>
                  <th style="text-align: center;">Dec - FY2</th>
                  <th style="text-align: center;">Jan - FY2</th>
                  <th style="text-align: center;">Feb - FY2</th>
                  <th style="text-align: center;">Mar - FY2</th>
                  </tr>
                </thead>
                <tbody class="activeTable" style="color: #000;font-weight: 400;"> 
                  <c:forEach items="${navCalculation.sourceConstraints.sourceCaptiveMinesConstraints}" var="sourceCaptiveMinesConstraint" varStatus="theCount">
                  	<tr>
                    <td><span>${sourceCaptiveMinesConstraint.firmOthersModel.sourceModel.sourceName}</span></td>
					<td><span>${sourceCaptiveMinesConstraint.firmOthersModel.contractId}</span></td>
                    <c:forEach begin="0" end="23" step="1" var="j">
						<td style="width: 6%;"><span><form:input  path="sourceConstraints.sourceCaptiveMinesConstraint.captiveMinesMonthlyValuesModel[${j}].value" style="width: 100%;margin-right: 80px;text-align: right;"  min="0" required="true" class="ftd" id="" type="number"/></span></td>
                    </c:forEach>
                    </tr>
                  </c:forEach>
                </tbody>
              </table> --%>
													<div
														style="color: #ab0404; padding-left: 5px; margin-top: 15px;">
														<span>
															<!-- Min/Max for optimization -->
														</span>
													</div>
													<table
														class="table margin-bottom-0 table-bordered  Tableresponsive"
														id="fixedHeader" style="background-color: lightgrey;">
														<thead>
															<tr>
																<th>Source</th>
																<th>Contract ID</th>
																<th>Min monthly qty. (t)</th>
																<th>Max monthly qty. (t)</th>
																<!-- <th>Min annual qty. (t)</th>
                  <th>Max annual qty. (t)</th> -->
															</tr>
														</thead>
														<tbody class="activeTable"
															style="color: #000; font-weight: 400;">
															<c:forEach
																items="${navCalculation.sourceConstraints.sourceCaptiveMinesConstraints}"
																var="sourceCaptiveMinesConstraint" varStatus="theCount">
																<tr>
																	<td><span>${sourceCaptiveMinesConstraint.firmOthersModel.sourceModel.sourceName}</span></td>
																	<td><span>${sourceCaptiveMinesConstraint.firmOthersModel.contractId}</span></td>
																	<c:set var="monthlyQty" value="0" />
																	<c:set var="annualQty" value="0" />
																	<c:set var="monthlyQty"
																		value="${sourceCaptiveMinesConstraint.firmOthersModel.secProp[6].quantity}" />
																	<c:set var="annualQty"
																		value="${sourceCaptiveMinesConstraint.firmOthersModel.contractedQnty}" />
																	<td><span><form:input type="number"
																				path="sourceConstraints.sourceCaptiveMinesConstraints[${theCount.index}].minMonthlyQty"
																				value="${monthlyQty}"
																				style="width: 100%;margin-right:58px;text-align: right;" /></span></td>
																	<td><span><form:input type="number"
																				path="sourceConstraints.sourceCaptiveMinesConstraints[${theCount.index}].maxMonthlyQty"
																				value="${monthlyQty}"
																				style="width: 100%;margin-right:58px;text-align: right;" /></span></td>
																	<%-- <td><span><form:input type="number" path="sourceConstraints.sourceCaptiveMinesConstraints[${theCount.index}].minAnnualQty" value="${annualQty}" style="width: 100%;margin-right:58px;text-align: right;"/></span></td>
					<td><span><form:input type="number" path="sourceConstraints.sourceCaptiveMinesConstraints[${theCount.index}].maxAnnualQty" value="${annualQty}" style="width: 100%;margin-right:58px;text-align: right;"/></span></td> --%>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>
												<div
													style="color: #ab0404; padding-left: 5px; margin-top: 15px;">
													<span style="font-weight: bold">Other channels- Max
														qty. targeted</span>
												</div>
												<div class="scrolling" id="parent">
													<table style="background-color: lightgrey"
														class="table margin-bottom-0 table-bordered  Tableresponsive4"
														id="fixedHeader11">
														<thead>
															<tr>
																<th>Type of Contract</th>
																<th>Channel</th>
																<th>Sub Channel</th>
																<th>Subsidiary</th>
																<th>Source</th>
																<th>Contract ID</th>
																<th>Apr</th>
																<th>May</th>
																<th>Jun</th>
																<th>Jul</th>
																<th>Aug</th>
																<th>Sep</th>
																<th>Oct</th>
																<th>Nov</th>
																<th>Dec</th>
																<th>Jan</th>
																<th>Feb</th>
																<th>Mar</th>
															</tr>
														</thead>
														<tbody class="activeTable"
															style="color: #000; font-weight: 400;">
															
															<c:forEach
																items="${navCalculation.sourceConstraints.sourceOtherChannelsConstraints.futureDefinedImportedConstraints}"
																var="futureDefinedImportedConstraint">
																<tr class="imported">
																	<td><span>${futureDefinedImportedConstraint.futureDefinedImportedModel.ctModel.contractType}</span></td>
																	<td><span>${futureDefinedImportedConstraint.futureDefinedImportedModel.channelModel.channelName}</span></td>
																	<td><span>${futureDefinedImportedConstraint.futureDefinedImportedModel.scModel.subChannel}</span></td>
																	<td><span>NA</span></td>
																	<td><span>${futureDefinedImportedConstraint.futureDefinedImportedModel.sourceModel.sourceName}</span></td>
																	<td><span>${futureDefinedImportedConstraint.futureDefinedImportedModel.contractId}</span></td>
																	<c:forEach
																		items="${futureDefinedImportedConstraint.futureDefinedImportedModel.params2}"
																		var="params" varStatus="theCount">
																		<c:if test="${theCount.index<=11}">
																			<td><fmt:formatNumber value="${params.availQty}"
																					maxFractionDigits="0" type="number" pattern="#" />
																				</td>
																		</c:if>
																	</c:forEach>
																</tr>
															</c:forEach>
															
															
															<c:forEach
																items="${navCalculation.sourceConstraints.sourceOtherChannelsConstraints.futureDefinedLinEaucConstraints}"
																var="futureDefinedOthersConstraint">
																<tr class="LinEauction">
																	<td><span>${futureDefinedOthersConstraint.futureWithDefineSourceModel.ctModel.contractType}</span></td>
																	<td><span>${futureDefinedOthersConstraint.futureWithDefineSourceModel.channelModel.channelName}</span></td>
																	<td><span>${futureDefinedOthersConstraint.futureWithDefineSourceModel.scModel.subChannel}</span></td>
																	<td><span>${futureDefinedOthersConstraint.futureWithDefineSourceModel.subsidiarymodel.subsidiaryName}</span></td>
																	<td><span>${futureDefinedOthersConstraint.futureWithDefineSourceModel.sourceModel.sourceName}</span></td>
																	<td><span>${futureDefinedOthersConstraint.futureWithDefineSourceModel.contractId}</span></td>
																	<c:forEach
																		items="${futureDefinedOthersConstraint.futureWithDefineSourceModel.basicCostParams}"
																		var="params" varStatus="theCount">
																		<c:if test="${theCount.index<=11}">
																			<td><fmt:formatNumber value="${futureDefinedOthersConstraint.futureWithDefineSourceModel.contractedQuantity}"
																					maxFractionDigits="0" type="number" pattern="#" />
																				</td>
																		</c:if>
																	</c:forEach>
																	<%-- <c:forEach
																		items="${futureDefinedOthersConstraint.futureWithDefineSourceModel.basicCostParams}"
																		var="params" varStatus="theCount">
																		<c:if test="${theCount.index<=11}">
																			<td><fmt:formatNumber value="${params.quantity}"
																					maxFractionDigits="0" type="number" pattern="#" />
																				</td>
																		</c:if>
																	</c:forEach> --%>
																</tr>
															</c:forEach>
															<c:forEach
																items="${navCalculation.sourceConstraints.sourceOtherChannelsConstraints.futureDefinedOthersConstraints}"
																var="futureDefinedOthersConstraint">
																<tr class="others">
																	<td><span>${futureDefinedOthersConstraint.futureDefinedOthersModel.ctModel.contractType}</span></td>
																	<td><span>${futureDefinedOthersConstraint.futureDefinedOthersModel.chaModel.channelName}</span></td>
																	<td><span>${futureDefinedOthersConstraint.futureDefinedOthersModel.scModel.subChannel}</span></td>
																	<td><span>NA</span></td>
																	<td><span>${futureDefinedOthersConstraint.futureDefinedOthersModel.sourceModel.sourceName}</span></td>
																	<td><span>${futureDefinedOthersConstraint.futureDefinedOthersModel.contractId}</span></td>
																	<c:forEach
																		items="${futureDefinedOthersConstraint.futureDefinedOthersModel.secProp}"
																		var="secProp" varStatus="theCount">
																		<c:if test="${theCount.index<=11}">
																			<td><fmt:formatNumber
																					value="${(secProp.quantity/secProp.maxTarget)*100}"
																					maxFractionDigits="0" type="number" pattern="#" />
																				</td>
																		</c:if>
																	</c:forEach>
																</tr>
															</c:forEach>
															<c:forEach
																items="${navCalculation.sourceConstraints.sourceOtherChannelsConstraints.futureUndefinedOthersConstraints}"
																var="futureUndefinedOthersConstraint">
																<c:forEach
																	items="${futureUndefinedOthersConstraint.futureUndefineModel.secProp}"
																	var="mineInfutureUndefine">
																	<tr class="fu_E-Auction">
																		<td><span>${futureUndefinedOthersConstraint.futureUndefineModel.ctModel.contractType}</span></td>
																		<td><span>${futureUndefinedOthersConstraint.futureUndefineModel.chaModel.channelName}</span></td>
																		<td><span>${futureUndefinedOthersConstraint.futureUndefineModel.scModel.subChannel}</span></td>
																		<td><span>${futureUndefinedOthersConstraint.futureUndefineModel.subsModel.subsidiaryName}</span></td>
																		<td><span>${mineInfutureUndefine.sourceModel.sourceName}</span></td>
																		<td><span>${futureUndefinedOthersConstraint.futureUndefineModel.contractId}</span></td>
																		<c:forEach items="${mineInfutureUndefine.triProp}"
																			var="triProp" varStatus="theCount">
																			<c:if test="${theCount.index<=11}">
																				<td><fmt:formatNumber
																						value="${triProp.maxQtyAvl}" maxFractionDigits="0"
																						type="number" pattern="#" />
																					</td>
																			</c:if>
																		</c:forEach>
																	</tr>
																</c:forEach>
															</c:forEach>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
						<div class="row">
							
							<div
								style="padding-top: 22px; padding-bottom: 20px; padding-right: 14px; float: right">
									<button type="button" onclick="navigatingBackToInput()" class="btn btn-info">Back</button>
								<button type="submit" class="btn  btn-success"
									id="runOptiEngine">Run Optimization Engine</button>
							</div>
						</div>
					</form:form>
				</div>
			</div>



			<!-- End Panel Watchlist -->
		</div>
	</div>
</div>
<!-- End Page -->

<script>

$(".Tableresponsive").tableHeadFixer();

$(".Tableresponsive1").tableHeadFixer({'left':5});
$(".Tableresponsive2").tableHeadFixer({'left':2});
$(".Tableresponsive3").tableHeadFixer({'left':3});
$(".Tableresponsive4").tableHeadFixer({'left':5});

function targetStockTPTWtAvg(sel){
	var targetStockTPT = 0;
	var suffix = sel.id.match(/\d+/);
	var ind=suffix.toString().split('').pop();
	var  offeredQty=$("targetStockTPT"+suffix).val();
	var count = $("#tptTable tr").length;
	for(var i=0; i < (count-3) ; i++){
		if($('#targetStockTPT' + i).val() != ""){
			targetStockTPT = targetStockTPT + parseInt($('#targetStockTPT' + i).val());
		}
	}
	$('.targetStockTPTWtAvg').val(Math.round(targetStockTPT));
	$('.targetStockTPTWtAvg').html(Math.round(targetStockTPT));
}

function targetStockROMWtAvg(sel){
	var targetStockROM = 0;
	var suffix = sel.id.match(/\d+/);
	var ind=suffix.toString().split('').pop();
	var  offeredQty=$("targetStockROM"+suffix).val();
	var count = $("#tptTable tr").length;
	for(var i=0; i < (count-3) ; i++){
		if(suffix[0].length>2){
			if($('#targetStockROM' + i +suffix.toString()[1]+suffix.toString()[2]).val() != "" && !isNaN($('#targetStockROM' +i+suffix.toString()[1]+suffix.toString()[2]).val())){
				targetStockROM = targetStockROM + parseInt($('#targetStockROM' +i+suffix.toString()[1]+suffix.toString()[2]).val());
			}
		}else{
			if($('#targetStockROM' + i +suffix.toString()[1]).val() != "" && !isNaN($('#targetStockROM' +i+suffix.toString()[1]).val())){
				targetStockROM = targetStockROM + parseInt($('#targetStockROM' +i+suffix.toString()[1]).val());
			}
		}
		
	}
	if(suffix[0].length>2){
		$('.targetStockROMWtAvg' +suffix.toString()[1]+suffix.toString()[2]).val(Math.round(targetStockROM));
		$('.targetStockROMWtAvg' +suffix.toString()[1]+suffix.toString()[2]).html(Math.round(targetStockROM));
	}else{
		$('.targetStockROMWtAvg' +suffix.toString()[1]).val(Math.round(targetStockROM));
		$('.targetStockROMWtAvg' +suffix.toString()[1]).html(Math.round(targetStockROM));
	}
	
}

//$( "div.scrolling" ).scrollright(400);

function yesnoCheck() {
    if (document.getElementById('yesCheck').checked) {
        $('#ifYes').removeClass("hidden");
        $('#optimalityGap').attr("required",true);
        $('#ifNo').addClass("hidden");
        $('#runTimeInSec').attr("required",false);
    }
    else if (document.getElementById('noCheck').checked) {
    	$('#ifYes').addClass("hidden");
    	$('#optimalityGap').attr("required",false);
        $('#ifNo').removeClass("hidden");
        $('#runTimeInSec').attr("required",true);
    }

}

//$(window).load(function(){
	  var sd=$("#beginningFrom").text();
	  var mcount =<c:out value="${monthsCount}"/>;
	 /* var beginSelected = sd.split(",");
	  var month=beginSelected[0];
	  var fortNight=beginSelected[1];
	  const monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec","Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec","Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];	
	   var j=0;
	   
	   
      if(fortNight == "F1"){
      	 $(".hidingFirstCol"+0).removeClass("hide");
  	   for(var i=0;i<12;i++){
  		   if(month == monthNames[i]){
  			   j=i;
  			   $(".month111").removeClass("hide");
  			   $(".month111").html(month+","+"F1");
  	    	   $(".month111").val(month+","+"F1");
  	    	   $(".month112").html(month+","+"F2");
  	    	   $(".month112").val(month+","+"F2");
  		   }
  	   }
  	   for(var i=2;i<=monthsCount;i++){
  		   j++;
			   $(".month"+i).html(monthNames[j]);
	    	   $(".month"+i).val(monthNames[j]);
  	   }
  	   
     }
     if(fortNight == "F2"){
  	   $(".hidingFirstCol"+0).addClass("hide");
  	   for(var i=0;i<12;i++){
  		   if(month == monthNames[i]){
  			   j=i;
  			   $(".month111").addClass("hide");
  	    	   $(".month112").html(month+","+"F2");
  	    	   $(".month112").val(month+","+"F2");
  		   }
  	   }
  	   for(var i=2;i<=monthsCount;i++){
  		   j++;
			   $(".month"+i).html(monthNames[j]);
	    	   $(".month"+i).val(monthNames[j]);
	    }
     } */
     
     
	  var beginSelected = sd.split(",");
	  var month=beginSelected[0];
	  var fortNight=beginSelected[1];
	  const monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec","Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec","Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];	
	  var j=0;
	   var str=new Date().getFullYear()+1+'';
	   str= str.match(/\d{2}$/);
        if(fortNight == "F1"){
        	 $(".hidingFirstCol"+0).removeClass("hide");
    	   for(var i=0;i<12;i++){
    		   if(month == monthNames[i]){
    			   j=i;
    			   $(".month111").removeClass("hide");
    			   $("#month0111Check").removeClass("hide");
    			   $("#month3111Check").removeClass("hide");
    			   $("#month5111Check").removeClass("hide");
    			   $(".month111").html("(FY-"+str+")"+month+","+"F1");
    	    	   $(".month111").val("(FY-"+str+")"+month+","+"F1");
    	    	   $(".month112").html("(FY-"+str+")"+month+","+"F2");
    	    	   $(".month112").val("(FY-"+str+")"+month+","+"F2");
    	    	   if(monthNames[i] == "Mar"){
    	    		   str = parseInt(str) + parseInt(1);
    	    	   }
    		   }      
    	   }
    	   
    	   for(var i=2;i<=mcount;i++){
    		   j++;
			   $(".month"+i).html("(FY-"+str+")"+monthNames[j]);
	    	   $(".month"+i).val("(FY-"+str+")"+monthNames[j]);
	    	   if(monthNames[j] == "Mar"){
	    		   str = parseInt(str) + parseInt(1);
	    	   }
    	   }
    	   
       }
       if(fortNight == "F2"){
    	   $(".hidingFirstCol"+0).addClass("hide");
    	   $(".hidingFirstCol"+0).find("input").attr("required",false);
    	   for(var i=0;i<12;i++){
    		   if(month == monthNames[i]){
    			   j=i;
    			   $(".month111").addClass("hide");
    			   $("#month0111Check").addClass("hide");
    			   $("#month3111Check").addClass("hide");
    			   $("#month5111Check").addClass("hide");
    	    	   $(".month112").html("(FY-"+str+")"+month+","+"F2");
    	    	   $(".month112").val("(FY-"+str+")"+month+","+"F2");
    	    	   if(monthNames[i] == "Mar"){
    	    		   str = parseInt(str) + parseInt(1);
    	    	   }
    		   }
    	   }
    	   for(var i=2;i<=mcount;i++){
    		   j++;
			   $(".month"+i).html("(FY-"+str+")"+monthNames[j]);
	    	   $(".month"+i).val("(FY-"+str+")"+monthNames[j]);
	    	   if(monthNames[j] == "Mar"){
	    		   str = parseInt(str) + parseInt(1);
	    	   }
	     }
       } 
       if(mcount > 0){
    	   for(var i=mcount;i<=25;i++){
    		   $(".month"+i).addClass("hide");
        	   $(".month"+i).addClass("hide");
           }
       }
//});
//alert($("#linkedStockpile").text())
if($("#linkedStockpile").text()=="0"){
	$("#linkedStockpileStatus").html("Some contract(s) are not linked to stockpiles");
}

function navigatingBackToInput(){
	var eupIdToNavigate = $("#eupIdToNavigate").text();
	var navigationId = $("#navigationId").text();
	if(eupIdToNavigate != 0 && navigationId != ""){
		document.location="ReplicateNavigationScenarioInput.get?navigationId="+navigationId+","+eupIdToNavigate+",0";
	}
}


</script>

<style>
#parent {
	height: 300px;
}

.table {
	margin-top: -2px;
}
</style>

<%@include file="/WEB-INF/views/jsp/footer.jsp"%>
