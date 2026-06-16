Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13FF2CD98DA
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 05:20:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.147732.1781587223297873743
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Jun 2026 22:20:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=HmTd0cb4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=06275b3310=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G4qepN2727607;
	Mon, 15 Jun 2026 22:20:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=dLp/MHL5l
	aFvhTEMhWR3mUEYVlchWbqLLvWR8GQjy9M=; b=HmTd0cb4yggWnr5mVhZmpI7qY
	gyalvxWxtOV9Ko1TO2lNRaoUv46ePTrf9JsHvLSD9p4V7bkMp0w0zkjk70xdZTiN
	LBmqS+tbZyQZ+UZuq7hGnqyaxtP9vWckrTLRo6ZCp8aqlM/v2w3aJlgLYNWY32z8
	eFhSaAg/6eqhRuPBXnzkHCR2vLdYLIYx7jOpx6hpjjXdMC04NQPy7P26ZbPPzV/K
	0e+Xn19c6NgqJ9DyVTMljjsoL/pKl1qnuZ6iatrsiyvRxoNVHEK0URLSmGQex2Wv
	QBpICDihQejF2i8g8UoyM6Hchcg/AfHEMILQSwe/mENTe8tE3RAT66RKzIPVA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010063.outbound.protection.outlook.com [40.93.198.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4es2g0bxpt-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 15 Jun 2026 22:20:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nsqsAIcDoPrgBMqAtbJdGwiivjunT/Xh1DtjuzyuiMqbdIVelBg7JNeEcUtgE8WgtkL9OtCBdzPoAkPJ6tddpIklEH4+HUvsEthhp/gnZDDe2Yr2B3nr1bLWHwNHFtkcC44LqaZvCqAPQ1mA+id6LhEA2khMic3pVOU1/XI0Z0IvAN5BEx4zHXf/0EzkQ3XzrTGFyJyPWJWn+pD1U3Csmx7LH16zMoDi/Uz+SSCB2c5HLdjuQYkB0hJsIQr01CGZJ1S5h3lBgYhtZx+u/XYURRidvvlwxPK08ezpMTH1eh/UI8l6luIT5DctFtvgI1yyWBv8vIFI9E5qvTiUbFd4DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dLp/MHL5laFvhTEMhWR3mUEYVlchWbqLLvWR8GQjy9M=;
 b=Q7JseK0inCjE7NL46oKrEk/cJKuhBNjCDAqTidtdcKDCIbqPvSjXM9Ttr6vyuHF3v0Z6rNnM122IbDbxHAaaTHAI1LdZpYS3NmMOC7F38/6Fz+yVRxRipw2zMgqxcvv8XenRKvXlBvgpK8UMtXSI9VA0Aq8PHJHQ8JZ3gwR5Hgx+598QcxjcGXtJvpLpJRSLIr7KWb7Ot4qmP5pwdWN2WgPc028iFO8JF9XlEody3sFDIPZDtp7+5b28Ngqr3Yi8o/Dz/DEma3dGK+kV64cjAmLPy9vL/vjkvAJ1vE7+l+LHuMqsueTprZ0R3hG8rSVJdXMCYiz8ik7Ygpd1wEMe6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH8PR11MB9533.namprd11.prod.outlook.com (2603:10b6:510:39f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 05:20:19 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 05:20:19 +0000
From: Qi.Chen@windriver.com
To: docs@lists.yoctoproject.org
Cc: alex.kanavin@gmail.com, paul@pbarker.dev, Randy.MacLeod@windriver.com
Subject: [docs][PATCH V2 1/3] ref-manual/classes.rst: add upstream-stable-release-point class documentation
Date: Mon, 15 Jun 2026 22:20:07 -0700
Message-ID: <20260616052012.3286114-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.54.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SJ0PR03CA0170.namprd03.prod.outlook.com
 (2603:10b6:a03:338::25) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH8PR11MB9533:EE_
X-MS-Office365-Filtering-Correlation-Id: 09656c63-2af7-489b-11ac-08decb66f4db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	jVyMUwL1/BM1AOSLv9YdEeMKvLO8Sl9SJzG+ypVsJUU9yqJB96j+C60TX5EZ5lG/C8hEiRVWt4g4dMTBOSAoBqaw8kAkkrdN3afhGszXLk0sVT51UJ+jLO/HiSFnSnZ9iZM/AuO77MvlqyFJ4IF2HtV9iXcLq+eM6787IfSX5nA6ZYRknEFxz+zsNrywop04XftL4+3DETroSzgosq3bggWOu+Vfqw88M59BLQ/V7tSHdd98tKwsb3OvAQ+b3YwJ9Kh0RHvg23sBWg+Vt62kYe79weQrZ1P/5obvyxVLG5BNlW9gvXQxYc2MhG/hG4e6iqTY+bmfk8qu7Eol/q+aK29IDMyEtn7miJzgzrjVNpPer3YeprqH7mf2nQHM9PRw/ug/z/erOX6wMgu2C4XVEnKahfXx7uD4LCObxx5/bjy2zXOLntp96aUAhoQGIdeEsuKR/ANxdTqf/astKUoumwlpc62QZRl3hh+mWn1/17b01J4DBOjvyHOXx/FSyfKCr+2nRAeBiQDyq72FhgX6EmS4vGzKLMXBBf19hqET8MeZnsjSwcYpN3so0mPgVMqLO26QwzxOxAFs5MDNGOhqcZmfez9CVRTG/XqrRk7cuOgpNK2Tdteztpwg7LlCGp4i6afsIcd73qdA2ypsMzCENeeZ07BoQ+d5yUSqNQUIi7nfLTy/XodXfZkjMGwwCSbyJ+lyJOpCKPC0Nr1m8AwOdqgTt8oHL3/vdxwEwhukJz3xKLhvFr1MbRss2IMBeQI9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OGhVQy9NSnc3K2tBbFhhZkQrd3pxRlIyRldOcHgyZDl4TVVtQWVsQ1ZDNmZv?=
 =?utf-8?B?ODdkMXRxdFdVQXI4M2FtLytqY20vL3hyZzFRN3IvL0diZzZUdkR2N3ZsbVBN?=
 =?utf-8?B?Y0ZoRWNGQTdtZTdzd2U3UmxxWXpLN2FrMk0vbnFQU0pUWnVMcmFFQWJiQm1O?=
 =?utf-8?B?YjB5VlJHTmM0bWJLNmM2MW9QalNNcVhHdytxK1N4MjViaUR6WDVzTjZTUTJm?=
 =?utf-8?B?am1tQXJzamQrM3lybzUxTnlwQnJRdmZsN2t0WWx4QTMxV25XOHpwMDVEcW1J?=
 =?utf-8?B?aDhjWkRNT1ZKajR2dDJLOU9iZWJCekpTZkhwd2JBaStrUnk3V0ErQm9LekZU?=
 =?utf-8?B?U2E4clNGSi8yOExsRkZyODNaUTUzOG1pZ2cxbmJFendwZ1lIWEpScTh4Q0x4?=
 =?utf-8?B?MkRKMUZLVUJIZk9va2Y3TU1QUGNSOVFNdFlYSVBtUmlOQVRlQ2hTK05Xdncw?=
 =?utf-8?B?dWdPTE01eFUvNXEweEkyQlZQUU9vcWZpREd3YUdCcFM2MFZSSFhKNWdpSlhJ?=
 =?utf-8?B?QTl5MDNsMGsxNGJsYWtZWFY0K09YTXU5eWk2emJSSkJhSk15ZW1DemJWL0ls?=
 =?utf-8?B?eVhhSjVEaWpNZElrYWRmeGhlNVliZkc0Z0RxTmM0bVFyMHpzMnZhVlNMd1pY?=
 =?utf-8?B?bmFRVTZxZy9BeWY4Wk5hYVFKT2YvOXNLaHYyMGhTZjJNTTdGRWppMHY5RlQ3?=
 =?utf-8?B?MWJnT3R3WGQ0WXdPYlQvOFFZbDdiQWlURHNNaGZYaVI4aVhHMjVRR2R2Rnlp?=
 =?utf-8?B?MmpVRGZpK29GRXAxbVFKNWZJWkpPN1hsQmFnejhyQnZtc0ZSMnZTeHJIaS9L?=
 =?utf-8?B?RmV6ZVFxemJXL1EyMEtMbzBleXQxQlZHcWE5Wk5XOHg3cGQvd2drUnB4VEpM?=
 =?utf-8?B?NjYySGQ5VjREdUNnSE90Q0NUZ3J2Qmcwc2h0VEdCNFF3cFNNU0FIeGlSUnE3?=
 =?utf-8?B?RE5xUzNmK24yWGlMYVZMT3dQak0wRHA0cGY5V3QzVU5NT2djblF5aVM4QlhM?=
 =?utf-8?B?SVFOTWIvR2xFbFRoaHY4VVB2cm5lVGNTQ01tMDN3TVQ4RTR2ZG8rck1rVGxt?=
 =?utf-8?B?bytWSmVZWUpHTDEwdit2amhtdTN6K3BrVEZxSndJTEsvZ2pwcENQd1YycHVY?=
 =?utf-8?B?Z2R2Q1RER0RMa2RXNkJPc1IreG1tNkFtTjZMNkR5L2JiNzNKd3p6MWgvZG1u?=
 =?utf-8?B?dE9ua0lXcnVoUFp5K0pvcFZMWG43ZFEwMUlxT2s5VXNPNmxRTGZHeUFQWXVS?=
 =?utf-8?B?dWt6N05LaU11cndzM3ZSbDh2SHhKQVpML0M1M3UyaVJsUHNYeGoyTzRmL3FD?=
 =?utf-8?B?RVo5TGFPYzU1R2k0dzFJeXNhS2pUazRwMlBFZ0RHdHVZQVoxenBwSlZDNVVH?=
 =?utf-8?B?Vmdhb1VJN2lVblhPV2k0aDBVcFBRc053RmxNS29qVVVQeFBzQjZqSFIwNy9W?=
 =?utf-8?B?UTQyOHNFeEJhMzkyZ2xDVXN0eWt1UWRXTHAvT3d0c3VkL3NTckdlOEgzZFVY?=
 =?utf-8?B?UUxMb0pZOTg1RzgvTXpKa2NLaG5sWlVqcC83SHZVQ3hhSUN4ZDNDaFRBVXFQ?=
 =?utf-8?B?QmVibmxxQmtlQ1pyQURVNjUxMCsxaFZ3bmZBNDk2WG5icFpiRGNOTEt3SlFW?=
 =?utf-8?B?a2M4OU5FWTN2ZkZzZkpzV0U1UGE2SXhWWitqTVZjak1QTms1c01xTGZkOEI1?=
 =?utf-8?B?a0JpdFphallWKzFkbkMrNW95QmhUenVUVnlPcGxobjEwN1c4UGtBRGVWTGJK?=
 =?utf-8?B?R0d0WUZDTC9NeXVYcEM2SW82TkdySSthcTJFMHhjTlRla25NZVgvTnNwcGZU?=
 =?utf-8?B?cFkwdnk1ZE0zdXJGZEhmbWZ3TDdpVmdUcFFSckdkbHJ5ZjZoYklkUVNta2tJ?=
 =?utf-8?B?MnlXallDejBxM29KV0JRZlpsZGYwdDFzclhyeWdxZkhmUlRNNmNRY0IvaDFh?=
 =?utf-8?B?UVBGTUpIZXR2WnlXZVBOazNhczg1T0FZdEM5YnpoeVh6bVRQcHpKYU9oYTdn?=
 =?utf-8?B?SFEyeFQybGxkekkvbG5DTHhmeDUzbEcxdmV6U2lsKzgwOW9uS3gyR0Q4eTFN?=
 =?utf-8?B?Yi9RbmR5SG5pbzdWNGU5Vk93bGtteE8vZ2V4TW5yZTFXZlVWRmt5ZVJIRXZn?=
 =?utf-8?B?dS9LMWpWaDdzdTlNamRsVzBnbzVCanpxR2FkMUp5NmNVSzA2L1pPbERzODlw?=
 =?utf-8?B?Z3JrRjN5MjJ2eENKM1BYUFFDNVFjM1h5VjZ4M0NuYkl1ay9VY3JHNmdCNVJO?=
 =?utf-8?B?QzNFYTYzTHRjV2tGbWtQSEYyUkZKT1YwcERqaS82M2xxZlI3SjYzSHloV3RF?=
 =?utf-8?B?RHRKNWZGYko4TEtwMEp2bk9pQWRCQi9hLzh3QTM3blB0SnBDaXYxZz09?=
X-Exchange-RoutingPolicyChecked: 
	ISuBG8IuhGWij913uv3NNBmkwR2etUaqn+DYRiyRU+jYI9mwYzQ79Aw0G3Wla4AzdjCjUgZWN+u4lBsx22zGhcnkRmCfg7ZfB5lKTI3e4exK2fE3/DYhdpzNycHDn4iTURIslmTStKHrM+C0vspXWDcbJLTo1KqY33nUf7kcyh8jk9AoW32TtmB198UScoo4Lf1UAH20Rv0/GA619Vpv5LgqpAtTM/7f126alMwpISviUPALdcnBpAokixpzsmZiJmqBKRTuFft3NKtTm2Hy1NMpLTpqS2WfrhJmf5ezaNYMg5kspS7X/KzmCclnnGALq33azeSImal8R5DzJje+OQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09656c63-2af7-489b-11ac-08decb66f4db
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 05:20:19.0027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yli0oGop0yJnnNPwG+/VNHfdxoaXh74QPSF2H3E8cQhXZOhiZ8heEoGzL7SAi0aKzOjpKD7D+tWrFjQGRr38nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9533
X-Authority-Analysis: v=2.4 cv=ZJ/nX37b c=1 sm=1 tr=0 ts=6a30dd16 cx=c_pps
 a=nBoeifw3k4y6eW1CqgP3Vw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=t7CeM3EgAAAA:8 a=ljOHmGDoImW_DtJpQMQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA1MCBTYWx0ZWRfXxnEbniQfTb90
 u8dS5fTfDVKX+Ksccrgir5cyxs08A71atjL0LpcOMEK+Ee8hBhdMqZpl42ZzTHyhlujyPZ14g5y
 2afnMOD2qaG2XH6wcz1cLcMgrT0Cz7x2NtNNlQjtW3RMo9gWzvEb+oUyiAtzW7lkWr81QdpVXyc
 eC+n7cNK6SRBhfzDUiQbNe0hSgoz2jCNKqdmmt/V41K+J1JKOHOX4ypAVMHn9lRFHo62MqZJjsZ
 SJZzJDxvNr+TqK5jbfxkvG5H5xQTUkJb5Xwbw98vrbYNWPM3HH1Lik1iwls11zMNMGk1Z3BvE45
 f05nDuJkG3N6Y+OqDI7ZMSB0eVPiF05xJd0Khu7smnDzXMFp279zdl+SNrjaXbTgqx0iASvBnT2
 3xess+BlGTqe3Kju6b4bjLEiM1ErRjxiAS8g9YeNLh/A4bkHwjKmU3JyQJcae62EMyEmQJuXaSn
 cbGf2OAictzxHJLDZSg==
X-Proofpoint-ORIG-GUID: E3_35AFPItwWHhJ_gYUtu_QFHxgWfe7J
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA1MCBTYWx0ZWRfX6AEkgOeZs5Zm
 nm+qaUNd3G5kyt92P7QahTS999ZkAfV+QXn78M7VIRDwFZT2e2g9dEhkrU29Uz+JHFqhIg05wFh
 ryQlCqMkDbzvUvpVpAi6CR34w3CThhyk/TbPZs0F/TcRgRnEADyf
X-Proofpoint-GUID: E3_35AFPItwWHhJ_gYUtu_QFHxgWfe7J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160050
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 65G4qepN2727607
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Jun 2026 05:20:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9727

From: Chen Qi <Qi.Chen@windriver.com>

Document the upstream-stable-release-point bbclass which automatically
generates UPSTREAM_STABLE_RELEASE_REGEX for recipes with dot-separated
version schemes, enabling stable point release upgrades.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 documentation/ref-manual/classes.rst | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
index 95e07f85a..f0d9b1d55 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -3655,6 +3655,30 @@ Three variables control this class: :term:`INITSCR=
IPT_PACKAGES`,
 :term:`INITSCRIPT_NAME` and :term:`INITSCRIPT_PARAMS`. See the variable =
links
 for details.
=20
+.. _ref-classes-upstream-stable-release-point:
+
+``upstream-stable-release-point``
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+The :ref:`ref-classes-upstream-stable-release-point` class automatically
+generates the :term:`UPSTREAM_STABLE_RELEASE_REGEX` variable for recipes
+whose version uses a dot-separated scheme. This enables stable point rel=
ease
+upgrades =E2=80=94 version upgrades constrained to the same stable serie=
s (e.g.
+``1.4.2`` to ``1.4.3`` but not to ``1.5.0``).
+
+The class uses the :term:`STABLE_VERSION_PARTS` variable (defaults to ``=
"2"``)
+to determine how many leading dot-separated parts of :term:`PV` constitu=
te the
+stable prefix. For example:
+
+-  With ``PV =3D "1.4.2"`` and ``STABLE_VERSION_PARTS =3D "2"`` (default=
), the
+   generated regex is ``^1\.4(\.\d+)*$``.
+-  With ``PV =3D "259.5"`` and ``STABLE_VERSION_PARTS =3D "1"`` (e.g. sy=
stemd), the
+   generated regex is ``^259(\.\d+)*$``.
+
+For recipes whose stable version part is not dot-separated (e.g. openssh=
 uses
+``10.2p1``), set :term:`UPSTREAM_STABLE_RELEASE_REGEX` directly instead =
of
+inheriting this class.
+
 .. _ref-classes-useradd:
=20
 ``useradd*``
--=20
2.54.0


