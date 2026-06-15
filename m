Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E666CD98C5
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 06:25:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.123723.1781504691001089634
 for <docs@lists.yoctoproject.org>;
 Sun, 14 Jun 2026 23:24:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=h6YMRQ/d;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=062669d7a8=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6Ntvl216469;
	Mon, 15 Jun 2026 06:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=zrCcU6qHFxuLhGk/DQOHbSaitYeffbi2Pn9ysz9UQ2g=; b=
	h6YMRQ/dVSZzIkPursJblomCsJF9lJadWrS9CxuL2j6X8//lM4vC8jVoVkwoMbsD
	N+jt5gJH4iI1dKbjl29QmQZQLImHpsDgx9EZMqBjRBAvyNO3IN6wjYcgsY2oU0Fj
	7Ne1n6VdankSHQjDNuaVc91SmS08px4AVaH7WiDU7bScZ6nt9W/13Q3AB7fME/Sz
	QwxZ9savYn8sH7sP2r8u96ftzk6rxvxgPqoJG85fg91nTZfoSQx1rDcrQLsYVp3g
	4ljb3Wf20bLY8Xe3aVK9XO5hC5IS/iZGpu/RXELT1Kn9Op1YqSaYJN/1dmCtE01F
	nBQBFMyMGay6HnIT+kn1Gg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012015.outbound.protection.outlook.com [40.93.195.15])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ervkp2bvm-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 15 Jun 2026 06:24:49 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l1EaUgteqAqDR2xcY/rYJdekLNtMMFelrOUKZTssSnNPToPk5xNayyfWNs2whMfhqnJEzRoOzWY6O+lk2EYC762EAl9BMZpajBW6k1szbS+6RgUSmzSwZSDsZqz6hnYe5KTBEAwUugW13zBxs4d2I+AupfuHD/kO6RXX8Fy5y4zmVE+jzsjId0eZ0RpZw4w2PrRYhTB0kZtl2dPwKndq8BsvjpW2CEbvdOuYj066rbb5ZoM0p6ELEkGilbCndQ+d6gvzSWN6Ty/KMUKpiAMXLV3wcEElHFuFWZUC/TbGuWv06xTzAClX0jc8to/bCGl5Hq1XNUnYpxx5pjt+9YcBFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrCcU6qHFxuLhGk/DQOHbSaitYeffbi2Pn9ysz9UQ2g=;
 b=DyQJfAYkmyZEqJWJwUgXMso15pPbl7EqTFpGjzXCshkKoQvKUbVrVDwWYNjSuGnlrDlsenxpM+IJL/23eNaMyHaKExDU1hVxg3Hz0D87L1obPTdyVheW9M50p5sYHbZeecdFitEUTajlgTMU3iDbWLUopzCDRbtV6Vb7F2sZf+yW63G26cbdcJflaYvBMTzfwTxlp781yxdVamUPwrUr9v7fmbBX8GM8PR6r+6ntCspNMgwjdfeexyg0uPNHJm7lbH8xgSMxUUGI5j3dp6E+IJm3491okZOaDb/oEt+CuSlUUF9zZfG40uIpfYkR/A/wl2qwojqLqmxQrEJ6LtDIAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 06:24:46 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 06:24:46 +0000
From: Qi.Chen@windriver.com
To: docs@lists.yoctoproject.org
Cc: alex.kanavin@gmail.com
Subject: [PATCH 3/3] ref-manual/release-process.rst: add patch acceptance policies and stable point release upgrades
Date: Sun, 14 Jun 2026 23:24:36 -0700
Message-ID: <20260615062438.3119651-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615062438.3119651-1-Qi.Chen@windriver.com>
References: <20260615062438.3119651-1-Qi.Chen@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SJ0PR03CA0143.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::28) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CO1PR11MB5154:EE_
X-MS-Office365-Filtering-Correlation-Id: 3251c722-73ce-4979-48b2-08decaa6cb7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|23010399003|366016|22082099003|18002099003|38350700014|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	u/CM4trNuhsyzXYkRZXd54euuImYtGlV1TzxyFm67Tz8wiTgQNpdTjzdi6jXvHtSe1ifwvaAWUkfvLaZ/9xlmKaYGeSzbYXybezAhucJYjfXr2rlyJGKSp5f3IobYowKdg6J3UBjOZILtZ8YZ7a7SLHWakNARsFB1IZ1ObJ+Y4NrnnW1OOcbqf2r2CsGoDo8lKbr2v7OTFvmQ0Q67FsIcu9Jp3QP/Wr6IWr/FBV5zQOIwKsvXiaoKta/PTBhSQfi/NeaJeiLeTsT5reZGOqvq3/qLYmVd432r6RJpdZcN8DHqEBo+4viU89EfpT6GD0VrYKGAK/2jTSM9WWl28XUU+1Ve6PBv+TVs3p/sHjU4Ro4AmzSGdwEiW2cpqL0FaO13IpFEHww7oiDZRot5Tq9BhKUthqI1uNgoGEs28jdA7vS7SqOBMpCLBwtrUKBJSfgvJUZPfZGalQQbMpkW1vtgWenrQa34UXB9mPWQYFfNAIe4uZ0RObAOs0zckgDSmSTs8Cg6eiflFBGXBkdXjwNJB2XzLOKTK6z93pSpq2Y/JrSpKr5HEXu9thoDFkarykOKsDF7ChfvSXWDlXWFkcb+OD2G3qVxHojxjI7soUbFbz+vfPqF5YqaA3ckuTBMNTEwxUfHtzk1iwVEVooPdjN7lECMmc2gujo7tupFeD5z/mdpRB3FaFKY0ib0l6YRHnDJx8ugK1nmPQcj2m8rFVTYOxXjgNdPuM4O3iQ/1owUncEUgRqOHiZ5CIx9+nrOT+A
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(23010399003)(366016)(22082099003)(18002099003)(38350700014)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z1BQdWlwSWt4bkJJTXBTUDE3VFZCeFpnZitUY1Nha3lGSG9KS2s5NXUrZGZZ?=
 =?utf-8?B?QWM2RmtnOFdKV1RTYVJXWEtvNUE1Rzg5eWs2OWUvRml2dzRQaWcydXQwT2N1?=
 =?utf-8?B?T0djbGpENjJRQVZrM2FFNmFwdnhGZnV0SFRpSXVGQVByZzlHVE0vN0lUYzJ1?=
 =?utf-8?B?N0Q0VmV0TEVleVF2UVk3Tmd1OUg5bmg1NDVEaWIydG44TVNhZFRqbjcyZldE?=
 =?utf-8?B?WFA0dk1QcjJrNGxrUUM1Mmt3K2hNK0VlTENVLzlWREt3QzduTWRLVDNiNnJ3?=
 =?utf-8?B?cUNmMkc0OHVNSWxQTi9RRk5KM0RGOXBEOHEvNUF0MGhoU1l6L20yY3VaUUda?=
 =?utf-8?B?ZS8wckFJQXNDL3EwRjZQcFhKNzFyTm8zRk5mVFlJYlpQTG5hR2ZzM0pNMnEv?=
 =?utf-8?B?K294bThtcW9NN20rR3kxVUJ0OXBBYXlOUG1ZY1oxNmF2L3RBc28xMXo3dzZT?=
 =?utf-8?B?TkpmaUhXdVJKLzBPaHRwWnovQWF3SUt5dEFqNlJkdlc1VXl1cjNzWFR3THJu?=
 =?utf-8?B?UTB0NUo2MFRwTnFDTEVaYXZTQ1FLa044M2pXaXNyV0dTY1UwNUlCb1g2akZX?=
 =?utf-8?B?UHBJb1ZGbEVJN1RtQXRiR1YxTEtjRUxkZjR1UEhaSkJXVzQ5WjEraWZPczRR?=
 =?utf-8?B?MmRPNGJoQS9QUy9aRk1xYnBSQWVKQW1Mck5KYTA3ck9Yc0ZXN3JWbUJtRGdU?=
 =?utf-8?B?S1VpYVhkOTVVd1dSYUpkWjlERXhlaVQzaFpQU0VBQllqaHc3RkNRVmtUdGlC?=
 =?utf-8?B?SWhCQU5aa1JCNmRJdWNOM0VPZjZJZ29kRXdrY0U5YzBWZUZhcmU1bDRVUUk2?=
 =?utf-8?B?V3k0UGFCUG5lMGVGdVdya1pJODUxR1hsbXgwS1BMclVERllDUjJaanlvZFVJ?=
 =?utf-8?B?eEZ6eXgrcWFWdy95VWFSSk56S1FybHlNTzEyOExXWm1mU2lZM1NkWkM5TEh5?=
 =?utf-8?B?THlURVlxV2g1NzA2YzlaWTJCZjVFMDdTLzJTb25ZMGRYdkszUDVKRHpTdTYx?=
 =?utf-8?B?WThwNXZ4TWhsb0hGSU8xcEtFS0pTSVZVNmt5VDFSZDlZcnZiK2FkNjBGYzZ5?=
 =?utf-8?B?aGU4UFc5bmE5UFNCS0JOOGlxM1ZnTXJ5TlVwSWtMN252RWhkbmNiN092bnJn?=
 =?utf-8?B?UC9mTXl2WVE3NHQ3UFp2Q0ExY0pjUklXTmhmaXIxWmt1L3JQYXk2RDMyaG5z?=
 =?utf-8?B?cWpTdXNXOGpUb2MzaEFqTXBnM2xIbmFYWUJkUE1ZTlVYUXpTcFZ3NWk0UzNN?=
 =?utf-8?B?OWhzOWIvL2Qvck92SXpmT0pTN092YWx3UU9JSEdzelBGTVZXTWtTN2lCam41?=
 =?utf-8?B?Y1puRVRUQXcrck9WNmpTc3g2NERjUzE4dHlDaUtQK1dnTHFjNEsvQVVMWFNJ?=
 =?utf-8?B?U2lmT3g4VGpCZ2RxbVJqRzlVclI2Z2cweThvOGRzQXhDUmpkVHI5RTRqSDd5?=
 =?utf-8?B?RnVQRlNTWEtIR3FXYnowUlJRaWhjbjZjVDZpKzU4OHZKOVNCbDdNcVVva2RS?=
 =?utf-8?B?bHR4NjF4NFNaczBNRERoclFtNWQrY1orME5qWGdXMnhSMkhvUkcrNWtUNFNR?=
 =?utf-8?B?bUEvRmpkVnpFZTJ1aldhQ2I5SUxKT2d5R0hMalhlMVZWZ3FpdTFEVTE2bGhS?=
 =?utf-8?B?QUV0QzQ2eFVXcGs1UlJES1M5RGduS0k1V1NVWHQyV3gyT3VVZ2lzSkpVQkdh?=
 =?utf-8?B?eDBuM1N6R0ZsS3R5RVgxS0pJRW5hZ3J6dkhwaVBnSXhqekVtdUtCT2k1Vmlw?=
 =?utf-8?B?eDRjK2RDVGNzdHBjSjJ3SkpET0tjSFVzV0laR3FIMUZmYUZwUGEycUM3eUsz?=
 =?utf-8?B?K3hXckRLVSs3WWN5OFVVNE9GeURlQk1NNUc0V3hzVHpVRkNCanRjRUtuSzdt?=
 =?utf-8?B?SHRrbEdMaE1SQm9nb0lsb2VtYlp6RjZQZDdNTVNuMG5uazlza3l3MTZCVWdm?=
 =?utf-8?B?TTF6RGV2MVB4QlZ2UnV6VEFqWUxXcy9LOXJFQWs3Tzdka2NYZ2oxMTMzL2dq?=
 =?utf-8?B?Y0JyMXhqMkpIS2pXSHROeVdWM3lzWUM1SjFFRlhPdTlXUE1uR2FueU52VjB5?=
 =?utf-8?B?d0d3SkR0aUllZ0tyS0NJZzh4UGsvbENFak9FdVdoT0JBYkJkeGNLTW1WL3lp?=
 =?utf-8?B?UFVWVFhwUlhGTHZGblJlYTFUQmkyWFkxUzBzRXVFMmoyREpsU3dqM0orcmlE?=
 =?utf-8?B?NXB1enRMT2t6RGVRMGNBbmg2Y0lEbUhmc2p3SlIrY3graGdZajJNbmRVaWZ1?=
 =?utf-8?B?TTYxbHZKOG4zaXVaenBDSWxHMlVGZDFUN3dBWjl0Y3ZJMGlEMU1aNHlaUERI?=
 =?utf-8?B?WjRyN2dCWWkvck16cVlVVEgyRE4vaXVmbmc4bXJXWkJPaUFRc0cyUT09?=
X-Exchange-RoutingPolicyChecked: 
	HWUeP9pLbQMrsAPcrbRI+maRS9Z/YwYeI9Lz6Q6I/77UuReLanVQ58EpVgr9ZIGdGVBcUdK1iyo/cfVn3jph7g9fq4kbnprtyYoyw8QcNCTXz1iG3VZwPuXipJCihGbpuSIUCOIC83fBXwd3nBcaeWgtpd7wQCWA1O/dfvi43cUx5VRpvyf7WilQTI/P2xQddHRaY5GNuwUWyXmsVxIlhsPppN1t4S3eVEcfhc9YGNRAmRBFinyX4zGbRHNUBZ6RtNH9f7f2t9QGjZMy2yW8SFs1L9it0tjGMkL5v/OU325LPtpbqIZUp1jkGOOWlBrjneKgLcIxottHGhEfKczWSw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3251c722-73ce-4979-48b2-08decaa6cb7b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 06:24:46.1378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wG4P9lg1qmMaBdKFzR7y2TzgaKDGVCj9zkmSZQIKXcyhxGzJmWFuwpNzwJrdPdIuK+bQTQL8forp7hOOh4PQyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5154
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA2NCBTYWx0ZWRfX0UMLfr6PfgI4
 8B3TPl4P4AaRPhE4DWlsC+lTn7Sn9WIYUiGs1Aq3B4kOlH/VAXupONsYRrKLuJMUOswbukXWdLx
 c3UB1jM784V2YmC5xCPszS48xvH6+PqRXGQi8SeLBr1w3xeHvpMo35IKXMSquqL2jSYC5tPN83P
 uq6gYZ6XoLwVkkF/b3IYEqWZJ0L9p06oK6TkATtXR42Cs0v83VWryJ8s1JlEHN17LD9mzwmR2ng
 hrNK1W2G/GF/nkreCaOLk1dfJCvpTMnZV1M5c4Y+177B7nwM1oecSng3UcrFO8hjg4N/RSoQXuP
 XbpGLU/6q2TTjc87ebPhG6wAbF2msphEfKkpnBRj7z9YF7GXGCKV8KgAA+9eTnhJjXKM575dQEI
 yIo5KIcaI/dWcGtYLbzIYNkM1raAp0gAvbwVe1WHMX9tsd2lVS63uJdw0OC+jYI3pNEnQJt46ab
 6civsc7nfXERcv7szGA==
X-Authority-Analysis: v=2.4 cv=BK+DalQG c=1 sm=1 tr=0 ts=6a2f9ab1 cx=c_pps
 a=OAmo50eV21M7Ophgg7+Z+Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=t7CeM3EgAAAA:8 a=VShSNdALnTx5IIslTvEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA2NCBTYWx0ZWRfX8Y3BXcdPTp6x
 N0iUE15+2saYER+HnO7e8/BeGnJn+32+BjxAsGY9IFsWqr7vfm6D/pE3gGMhAWM+ysMb1sFLUyW
 T81wyt4owBfL7/wjdT8+5tS6P/Jw0lJIChfmlBTxGk35Gmcz/4xb
X-Proofpoint-GUID: QNIrKYOrH_k9yjWJ4y5Lnyip7bikxZBY
X-Proofpoint-ORIG-GUID: QNIrKYOrH_k9yjWJ4y5Lnyip7bikxZBY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150064
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 65F6Ntvl216469
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 15 Jun 2026 06:25:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9716

From: Chen Qi <Qi.Chen@windriver.com>

Move the Stable/LTS Patch Acceptance Policies from the wiki into the
reference manual. Expand the 'potentially acceptable: bug-fix-only
version upgrades' item with a new section documenting:
- criteria for qualifying upstreams (stable branches, maintainer
  confirmation, historical evidence)
- how stable release regexes work to constrain version checks

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 documentation/ref-manual/release-process.rst | 97 ++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/documentation/ref-manual/release-process.rst b/documentation=
/ref-manual/release-process.rst
index a55187c14..3bccbfbdb 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -127,6 +127,103 @@ stable release.
    exception to this policy occurs when there is a strong reason such as
    the fix happens to also be the preferred upstream approach.
=20
+.. _ref-stable-lts-patch-acceptance-policies:
+
+Stable/LTS Patch Acceptance Policies
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+All changes must have already been accepted into the current master rele=
ase
+and any other release still within its stable support window.
+
+**Acceptable:**
+
+-  Security and CVE fixes
+-  Fixes for bugs
+-  Changes to follow an upstream stable series or LTS that aligns with
+   the original release (based on compatibility)
+
+**Potentially acceptable:**
+
+-  Fixes so the codebase works with newly released distros (only in the
+   first six months after a given release series first release)
+-  Bug-fix-only version upgrades for upstreams that meet the criteria fo=
r
+   stable point release tracking (see
+   :ref:`ref-manual/release-process:stable point release upgrades`)
+
+**Unacceptable:**
+
+-  General version upgrades
+-  New features
+-  ABI/API breakage
+
+.. _ref-stable-point-release-upgrades:
+
+Stable Point Release Upgrades
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
+
+Some upstream projects maintain stable branches that only collect bug fi=
xes
+and security patches =E2=80=94 similar to the Yocto Project's own stable=
 release
+policy. For recipes tracking such upstreams, it is possible to perform
+*stable point release upgrades* (e.g. upgrading from 1.0.2 to 1.0.3) rat=
her
+than only accepting backported patches. This is the mechanism behind the
+"potentially acceptable: bug-fix-only version upgrades" policy above.
+
+Criteria for Qualifying Upstreams
+---------------------------------
+
+Setting :term:`UPSTREAM_STABLE_RELEASE_REGEX` for a recipe means that ce=
rtain
+version upgrades can be confidently treated as stable point upgrades und=
er
+OpenEmbedded's criteria. The Automated Upgrade Helper (AUH) will then
+automatically upgrade recipes with this variable set during stable relea=
ses.
+
+.. note::
+
+   Recipes without this variable can still be upgraded for stable releas=
es
+   through manual review. They simply will not be picked up automaticall=
y
+   by AUH.
+
+A recipe may have :term:`UPSTREAM_STABLE_RELEASE_REGEX` set if any of th=
e
+following criteria are met:
+
+1. **Upstream stable branches exist** --- the upstream project maintains
+   branches named with a stable version component, and there is evidence
+   that these branches only collect bug-fix and security-fix changes
+   (no new features or ABI/API breakage). For example, util-linux versio=
n
+   ``2.41.3`` has three parts in its version and upstream has branches l=
ike
+   ``stable/v2.41`` with two parts. This demonstrates that bumps in the
+   third part (e.g. ``2.41.3`` to ``2.41.4``) are stable point releases.
+   Similarly, systemd maintains ``stable/v259-stable``.
+
+2. **Upstream maintainer confirmation** --- the upstream project's maint=
ainer
+   explicitly confirms that a bump in a certain part of the version is
+   bug-fix only.
+
+3. **Clear historical or common-sense evidence** --- the project's chang=
e
+   history clearly shows that a certain class of version bump is bug-fix
+   only, or it is widely understood convention. For example, openssh's
+   ``p`` suffix increments (``10.2p1`` to ``10.2p2``) and kmod's patch-l=
evel
+   bumps are historically bug-fix only releases.
+
+How Stable Release Regexes Work
+-------------------------------
+
+The stable point upgrade mechanism uses a *filter regex* to constrain th=
e
+upstream version check so that only versions within the same stable seri=
es
+are considered. When a recipe sets :term:`UPSTREAM_STABLE_RELEASE_REGEX`=
, the
+version-checking infrastructure in BitBake's fetchers (git, wget, crate)
+applies that regex to filter discovered upstream versions. Only versions
+matching the regex are considered as upgrade candidates.
+
+For example, if a recipe is currently at version ``1.4.2`` and the regex=
 is
+``^1\.4(\.\d+)*$``, then version ``1.4.7`` would be a valid upgrade cand=
idate
+but ``1.5.0`` would not.
+
+For recipes whose version uses a dot-separated scheme, the
+:ref:`ref-classes-upstream-stable-release-point` class can automatically
+generate this regex. For other versioning schemes, set
+:term:`UPSTREAM_STABLE_RELEASE_REGEX` directly in the recipe.
+
+
 .. _ref-long-term-support-releases:
=20
 Long Term Support Releases
--=20
2.54.0


