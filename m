Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9C17CD4F26
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 14:55:35 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.25])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44257.1781880929890815745
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Jun 2026 07:55:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=hzfOsq3Q;
 spf=pass (domain: cherry.de, ip: 52.101.72.25, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gActmP08nxr76JUbkEzrtH3Lgh7iQvN7D0VuoOHeIgxq3PkeO9jcJLIAq2A1gaNttPXh/fry0WV65M5RgA5ygNPD1LJwGV5a/trWS+zBndRiYVtO5xXLEXmLfg4lfR512UzG7FuC8O0gDb34HkkK0cwalX1oadS7yhWT5PPTBsAbTa6+R9RJ45jth7Q47HU/0/zlMlXIe7c9s1Mq+PLiDfxbxYm8ZOvG4TrhLhhNsPAaTQmWCh4iTxNzXpO13ZRc3/ehhBGlqWxt0TUk/nLHbClJbAsXcLKvDwOtlbDdxyodgZs537WPZCsg7E7oa85232W0bS9IzlaolH7tK5Fh8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4RQVGHca1jfdojMI9Dr7LUWWPbh8wv5MFtnTiQQMoW4=;
 b=PoMI6Qr0js0JgdEobgDlxFBn2mDzM8Sxy+9zdDpoS3TObEezhoVGLziZxAoipnv6ttzF2xAuh6bnXEN1QRZRLmhnuRDm7/4lurFN7v2AUUqZM4JLEBN4jWSdofFXusvU/dt1yLgBz+uEiqfbqX+Fs1zfgI80wVkxGQ2U//9iXpxWhOUZxE0h98W1pLF0/ZdPXsf577pUZub0fFDAibBX1Nosb6jEX/6VA+oOKjkUzponeJZCmbUtxDvAfMC7VJ2+xinRDM+2voDkCmuM4xT1ueEXTosjyHI6He8BGOumRhofr62/mnPGgQaIyPrqVqpR+nmXjPuj8XZxY0W5rPJ06w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4RQVGHca1jfdojMI9Dr7LUWWPbh8wv5MFtnTiQQMoW4=;
 b=hzfOsq3Qk0YVBB6WjAWKBc5xdLgjrxfm6z5Z+TjlaA517H33HilCQX0NTtiIEcxl9sePJFHtewqPW9VSg1xk+SAs50WvjQAo4XUlaaHMNx/Zi/+3HGdJWdVnsvGXvndcfebq7NJ3glVbztcC26injV8qULewff5RIY5SKdm94Rc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by VI2PR04MB10219.eurprd04.prod.outlook.com (2603:10a6:800:22c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 14:55:26 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0071.010; Fri, 19 Jun 2026
 14:55:25 +0000
Message-ID: <ff1c8e7b-b54d-4ce5-8d47-4640558d6300@cherry.de>
Date: Fri, 19 Jun 2026 16:55:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] dev-manual: use "trade-off" as the noun
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <2efccbfb-b6cc-9f10-7fee-abdb2b4c3ee9@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <2efccbfb-b6cc-9f10-7fee-abdb2b4c3ee9@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0096.eurprd04.prod.outlook.com
 (2603:10a6:803:64::31) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|VI2PR04MB10219:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a68e3b0-1f5a-41e7-a5f3-08dece12cbb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	lTsECPB1PCulPkAftccrbzjvYrzHEbI6eTEc+E8mYermdu/HwnVm/R76V8eJ4GwUxCsL4p7pIKUXsfJQofmACaddqDdvWKMuMeX5sx69ve6JBnZpGD2KSPYIIHusDNpRgshdPGNGhYCmtQ69JUB+SPgsVIPIzD+sVfvP3h8pvoldcEfEwhVAtOwbIoCdAUoYgoWNMVLV5LbpfdcEtHTpA57HBY6pQCkWFFa7UQdJxoKX3MZlbzwYAlzTUrRz/slZIG+LN/f6CMUCeqTJAoFPtctPDbY/u5bxKbvdGXwQhHRpg2gcSdEUmU2XXFEK0aUM8YGPRhXZ25b18nIkToLuQmigo6XX0lYfOK0mySZl01PtaYva1JvMGGEOtyc2UZP4Kghp7ue0w8xWEnhdTXsNe7LfnnE7dchInpR9kaxXQWs/B00kk1rIWPxtrvh6VsgPFZLytX5GvXP7plYzSTAv8wWpF5YDd1vy1XosclZtgjaHvmksLhu3TxKdlJdPhPPwTeQ+/yG01/n0HEg3AaxNH7/vLvFXFsqgsZFo/sCj/E2hbH3bTN/uiq/PMgJ+A07JLchGIw+6+HOVT1hwTRB6W+9/qqzUArggHyMZWu51kiC3eM+NQHDG4ChD9IfYbPYuiGP6mTgEosGw4ykNz9ydP433VM0D2i6fFpdktwU7rEI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a21zVnR3dlhzQ0l1VnpzUEtwTWRmMHNOb1JEdkthcFBGdXp3dlo5K3o5MGI3?=
 =?utf-8?B?dUx3K1ZVY05odjc3OG9uSmpiamREUWV6MG84Zi9UUXFndXFnUGlsdDdvZG9U?=
 =?utf-8?B?YTJ3VytIazZoSENZQ3l5dUV4UmZpUk15SEs5M2FyTFV0Vi90VnhOKzNrQmFZ?=
 =?utf-8?B?VmtJN3Z0MHE2QWpCR3FnRCtNbTF4V0x5WWVCTjJsY3BnbnB1TERxR3NEanNS?=
 =?utf-8?B?aG1pNlVYRW1oM0pjeGVmYW9qNE5Ya1YrOUlpUzNjb1I3aFRXTDZ3eFFaeVFt?=
 =?utf-8?B?K1ZHTWV4VXQ2clpBVEZhNExRcVMrM1lIUzhiSlIvV0MwZ3NYN3lrZmkwSWhN?=
 =?utf-8?B?WnNEMWh2amZRN2NHV0ozUUVoYlZOUm5mWTU4SmJlUU53ckpwOUw3SlZwUFVD?=
 =?utf-8?B?VmV5MEhvaVpVbzg0Q0ErNE9VV1BHN292cGxuOUlZdlJtR0l2VFBZeUlxVFpR?=
 =?utf-8?B?ZTRxVVFYOWliYTNIc2JSdnFEcWNIQlcvT2xHK3d1SGd5UXh0RlBLb0FYVnUz?=
 =?utf-8?B?NTZqNmUyTmtjWXJyMTdWck0zQU51a3Uxc2RMa29GOWMxRXdvUFpwSm83Ym96?=
 =?utf-8?B?SENIUmVqWEdsWnp1amdhU040R2RzSmlXc2lnNkErQ3dpOEhqclNzVHJzcEFR?=
 =?utf-8?B?bS9WZkhpMWdhbDZYeFV2MW5hTElrUXBUUEdRZVY2Z1BkZThGb0pzNGM0VVpm?=
 =?utf-8?B?RXNKRmRXZ29UZWdBaWJyOWNwSCtDOFZTRlVJYlhuaFZvMVZkQkk0cmhXUEZE?=
 =?utf-8?B?eGYvaGV3SHVKUjhDRGRQOHl0L0NzU2VIenJOT3VCREtGeHdoZStqU2F0Qmw5?=
 =?utf-8?B?ZW5qVDE1UWVkRGVtczhKVDVSVGpYWEU1bzd4RHFiT2NmZ3Jmd2VKRCtHUGpi?=
 =?utf-8?B?cCtTaWJYU2FBb0VGQnZWakhJeHZqVTVFSWN0TWJHUmc0eFVIKzhXdW9QVmFm?=
 =?utf-8?B?b3ZNQ3BvRE5vZzR5VGRJaTE4VHVCWXdkZ0dpTGtWaVlTK1djL3BCUUpHQUJp?=
 =?utf-8?B?MmJuZGpMZEd2UFRXRldQU2Zvb09oY3A2dXBEalhxV0hQWk5OR1M5YUZqYmJ4?=
 =?utf-8?B?TUR2WVM0Y0hVN05DM2xnQlRxb0srb1NBZ1ZESy9xbEMxZVlJVngwUmhuL2Mv?=
 =?utf-8?B?SWJaT24zemozOC8zc0RXU05lWnZPRCtPMjFYdjMvVUdnMVoyUGU0cUI5SU9T?=
 =?utf-8?B?YXJVb2o2WkZscEtNR0hhU1V1cGI0Q0V5SjhZM1N1MXAzejNmOFF4NmhTdWVV?=
 =?utf-8?B?ODZKL25iTjJGYmg5ZC80dDJsSVFsbGNvWHJMbkE0UEtIOS9WRlRhTHBCempv?=
 =?utf-8?B?RXRRQUlPM3R1YlJWZDg2WE9pYWNTM0RQQ0N3aFhsWTVORzEvMG1pcXY3eTYx?=
 =?utf-8?B?TVZnSCtONHJRbjJJdDM0ZFFRNXdxdWh6cXRYZFdZYm44L0Nsa0tyellBa1BM?=
 =?utf-8?B?eHZzRHhXUHdGVXBkL2hUZ21tekN1SkNxWlFpU3Uzb01CNVV3RlA0eHNVMHFi?=
 =?utf-8?B?MWNWVG1FbmJRQ25NRnplaTlUWFBoZUVyT0p6WTViOGxobXE1N3JpUzNKdTBh?=
 =?utf-8?B?UDE2TFRtbzQ2dW1zbGlDVVRUcmhlTmIraFh2NUdpdUZKb1A4R3grSlFWNTVO?=
 =?utf-8?B?MUptaG1BTEE5ZkdWb1BGVEppWm9FRzlCb0JwSllOQ08xNERISTVJOEFNbkdN?=
 =?utf-8?B?bHdxdUxiNWJKT1NzVytwKzZoMy9XMmg3alVRNzVibG5aZEY2QmgrVUNiOHhk?=
 =?utf-8?B?N2lNZTg3Ri9GcGpJWkZUY1FjSEFrOVNWbHcwZmdrSDBZVm5wVDdTT3VhT1ZO?=
 =?utf-8?B?anhzZ1huK2I0MU5ybXF4YVplT3BBSDVMMjBWZnp0eDMxNmtHRm83eEFWSGk4?=
 =?utf-8?B?bEdOVVJIQTZDZWpNQkl0M1laM2xSM2VLdVpwTytOTUN6SmExQjhaNWlhZWpS?=
 =?utf-8?B?TnlwbGFsNVJjRTdyYkJVWG5KbVJUeGJOOGNPZmxwTGo4YVlVYWk3cWFaTW1k?=
 =?utf-8?B?ajVKeGozbEpIRis1b0lCZkxrSEpPQmFMK3pSVFlURyttMEt1MkdCeEVzanhV?=
 =?utf-8?B?cG9BQjFuaWZoWTJvTHU0KzVoc1FFYy9BWnFzT2VQT3RVMnBFcGMwMmlHcGpj?=
 =?utf-8?B?aEliYk5YMFd3U2ZSMDlkVndhY01sblBHRXYzSGR3QTVocmw1YjNjUHllcmh5?=
 =?utf-8?B?ZFl3Tk5nOFF0S2ZKY3JMbFNuL3NUaDR3RzlMdUdJQ3ZXUmRDTmUyTDZBZ3hY?=
 =?utf-8?B?c0VmdGxrVXBneFpSc1h3dnJlb25hU0ZkUU0yTEVaR2NsMElUdnN0ZENSenYr?=
 =?utf-8?B?a1pEVmJjald1Uyt2MmdlK1M5K29yUTVFL0h5VVVwUEZKWk52YkJTZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a68e3b0-1f5a-41e7-a5f3-08dece12cbb0
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 14:55:25.6679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s4APDzDksX2Yz1PtTbxc92Q9Fs/xs6E51tqCpniuogEURKXSc3QsG61H6L9eWsbGaacaVMtHmkoE+p32TpN6evDRWVgtN/6G++LCZEAXCHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10219
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 19 Jun 2026 14:55:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9794

Hi Robert,

On 6/11/26 12:43 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> As with "setup " versus "set up" and so on, "trade off" is used in the
> verb form, and either of "trade-off" or (less commonly) "tradeoff" is
> used as the noun.
> 
> This is the only instance throughout the docs that needed fixing.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

