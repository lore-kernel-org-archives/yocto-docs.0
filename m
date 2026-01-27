Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBF8CD2FEC8
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 17:42:11 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.20])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17862.1769535727677458536
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 09:42:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ANN2pcMe;
 spf=pass (domain: cherry.de, ip: 52.101.65.20, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qzYI/nC+CmH5MgnAh241lhORE0kwYRM7n7ooEDDWp0iijfCH3sSmwn8Gpjv/HyEGtqot3TCYZ+vddnQ+VwwPs6rmMGQf3Us7+LmFwreowaQPrbwYMONTYb0fv0gk4ipz+Y8CUYopggfUdbbttgK5WTcm67K7owlOmmkTNitweaFMRNmlo9ixUlfOZKcc5Nwpzlb1zZQhuI57Bk8FdlyeeHmPUYi7Iv2/v74NO0gnatB8zkfSLFU5dC7B/6lGEN9MraGLQqDMVKdy7ua6zvePtX2ot//dXFfewGGHdHUsf/JPxX7AvwJHzt9fd94ACXsJmlssQhyOuFPHF+cyiaf5SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBx732UbKaxqoZal+P9rrRia2xuHfMPT2poVkv6M18I=;
 b=cc1Wc8S8NrChvvOeR/qFZ/SI6ApoHRezwx6fHTljCrrU5F11tJ9gRI5ppuoTyi4TnYQb8liwCSPUDX1w6lxybGTbIs/M4OKRAxOSY1yCcq5H8AkykkfJNvXCPbZMJsuK2RO1fGQ8s7E69iET863jtLGR4lVtPy1mfdmFcgnaXKNp/ZBTKwxvWfLhxVKJ6LH8OBO79p4PSESSrUiyekO7zS6VSgcODqlqDS+T6fG0cnJMlhsT6BYFUE6HdzzIgLpwC8kuwuJJAMB69ghHDpt/NZwcTRNlKtII63bXymC5pPOiEn3lW7s5fXpW94pH/N2oIVa+epMje0c+izmBRjfYzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBx732UbKaxqoZal+P9rrRia2xuHfMPT2poVkv6M18I=;
 b=ANN2pcMeS0d8gJa58bUUNBQTVoG9xUFtJy4SdzPP3j5nGPMmgwNL3q289uw/auvid9TFhhxYhlxntt7/4pfzGNi+YX33qZS8qOoD6xJHnDf9WIytAo843ilJ9mhDy3mZWioXQ14Y/WLxWYraubXqxB4edjZt4Ou1jaVSKETPdHU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AS1PR04MB9697.eurprd04.prod.outlook.com (2603:10a6:20b:480::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Tue, 27 Jan
 2026 17:42:03 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 17:42:02 +0000
Message-ID: <edd1f85a-3937-4597-8bc5-e63afbc2d79a@cherry.de>
Date: Tue, 27 Jan 2026 18:41:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 19/56] kernel-dev/common.rst: remove obsolete
 poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
 <20260127-remove-poky-references-v2-19-74bf80cc4e5a@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260127-remove-poky-references-v2-19-74bf80cc4e5a@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::15) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AS1PR04MB9697:EE_
X-MS-Office365-Filtering-Correlation-Id: 028161e1-f3c1-4bba-52e9-08de5dcb6117
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?b2xuS3h1M3VmbUhIMHBmbXdRMStCSjA1SHZBaEJnM2xCNGdMVGlibVBUNTZP?=
 =?utf-8?B?anM2b2RvaHdYYVc2eGVaTEhQeEVYTWxaYkRnalZNY0tkRFczTnE5d1o1R2ZJ?=
 =?utf-8?B?a2RZc2dPS1RPdVo4dGtaODRiM1JmNTJSMnhGNmtpM3VGUkFHa0Urd2Y0WkJp?=
 =?utf-8?B?KzVtK2xEUVlNRGpHVWRubjhnM0t1Tjd0bmpaOHQxWTJyaTVnTW5McWNiT0s1?=
 =?utf-8?B?djBEV2xvUEJkckFqZVVGY21nbkNWNW15dytiQW51U1hVN1RHWkVDZHIvZi9S?=
 =?utf-8?B?bWlBRDVKNXhCbG41dklvZzlkcGpYSmF2VDZKUy9JanpyUkZEaGdoNkhMVE5M?=
 =?utf-8?B?ZWlCaWpyanBXd0xML1M2U2tvTDRJWEVtV1JlYWQ3NjZqUGJveHR3Y05nbWlN?=
 =?utf-8?B?TlVabHZKWVFqUmt2cjk5OG9lRlZVejhwUVhLMWhvVC9OVllFU2lRdmg5SWE5?=
 =?utf-8?B?cFRDUHBsWG5ITkZPMnRUTUtsMk1UT1JrUDJiQ3lNUDNyY0ZZdDBPdkpyeEds?=
 =?utf-8?B?WUU2ZFF5dm5wTUxzQjBEd3RVdFN1NnNZaWJ4MFIvMURMT0Jub1ZJcFNybllw?=
 =?utf-8?B?ZjVybGdnck5ORGEyYk44NnlzMEZPdWsvTEVtajhVdjRxNmNXQ1pRTENOc1pq?=
 =?utf-8?B?cFBBVHZqcnMxNWFNVmtyazF6aTR2NHA1U1BneTBQczdicGgzd1hBZkcwc1FR?=
 =?utf-8?B?MlExUi9tZkdBdDh3c0IrbWt2OVM5bTJMYzAxK0NrUXJkMzE5WEExcG4zNWFx?=
 =?utf-8?B?Zlg2aExzdmRPM1F1QkhZWUVRc3dMZW9kTEoyYURRdEJyUHJhVUhJWGNiUndl?=
 =?utf-8?B?dWRiVFVUTU9tVDM2MFhQWlcwYnVOeDZ3aXpYVEdyK0Nwb2V0UGRKMHc4Yjdo?=
 =?utf-8?B?TElNSDZhZDZWWnFKNUlObjllUEZvUm1HQXRGcXVpSVR1bmNRc1dyckVOUlNV?=
 =?utf-8?B?dmxQeGlZbjNzeG80d0ozSWVHZUc1QmFyM3E3UkYwSE1ueCtzMmsvSXVPQVJR?=
 =?utf-8?B?NW9USkQvQmZMQ0Q3aTdZeTBnZDR2TitTdktYalJVVmt1dlhxOGRVc2MvTFY5?=
 =?utf-8?B?RFN4RjlkVXdMRm1sUkk0bEZUcDNkYVM1QStHOUR3SEtHOUdYMmRveWNnZjYz?=
 =?utf-8?B?RmVTaC9RMkpBbXlqRUxycmY3OVhMZ0p1RkZhNFBKWTR4Qkx2SzJSVVhGeEt4?=
 =?utf-8?B?ajlQWURxbm1ENUhKRGJDZmFNT2NZM3N6MXZuVkZaSkFndnZGa2x2Q0N3NWpX?=
 =?utf-8?B?ZzBqYlgvUDJkdS9jZ0hENzJwRVFWOExQWGdnbi9xZENwOThOcXpEcjBEV0RC?=
 =?utf-8?B?NCtnQkVpUkpCTDh2UEtzT2RBc2JtcmIyUU8xVHNWV1ZOZ0MzTTF1cjBqWHZF?=
 =?utf-8?B?NnByTVcvWTRPdG1kVk1LRkZMUjhYc3ZNSTlBVENNNGl5NUxmZy9ONDVSckpT?=
 =?utf-8?B?c3I3VWc0bmpKYm1SU2ZYZkxwdFpKRUlNUGpzYytiU1UvMHFzQXl6cjdqVDVw?=
 =?utf-8?B?cFdja3NNNVF0NDhlVkhkRTROWW9kdmdHRHU2bEV3cVZHMU1QWjkxN2EvdWd3?=
 =?utf-8?B?TXlTY3pIcXdHREZvZlJJVXdHWjRXYURYcDFNUlpmMXFjVHF3SDVHTWdxT3hD?=
 =?utf-8?B?NWp2RmlKUDEycTlkYjdiQlhKeElPR1RPT1drM25heTlGR1BrYzNDN1FzNTVR?=
 =?utf-8?B?ZTdNQkc0a0hkK3ZTdTdpbFhObi9Wa3ZNWVVjTldCaU1OMWZWMXpzMDl4TDNY?=
 =?utf-8?B?Rkg1OVdOclE4ZTJCeFBUTnlha1dkVXA0bFlOMGxlTVpyWDAxdnlKYzBxV0Ra?=
 =?utf-8?B?QnJYOElaWlgzTmtibTdrUzFnQkc3WnlucGZJY21xbm5lSitHRDNCUG9ITFB3?=
 =?utf-8?B?R2NzbEpIZFlORkd1SjlBcE1OZnFONmRCdUZIcmFoWjFrSjRoMUpBY0dJbjhF?=
 =?utf-8?B?QytrWmFycXAxTlowU3Ftd3kvaDlReEtnTEFReDNPNktxSktXbDlPMVBpU000?=
 =?utf-8?B?OFhmYTc1U2xwNnA4T2t6VXdZbVdVZUYxMHZKWEpvKzFBQlFtNDRLRFlIeE1L?=
 =?utf-8?B?WHhYK284MWltZEgrVWRsWEs1WjU3V3loYnpCdnpwSFhXVzFuMDYvQXo4Lyt3?=
 =?utf-8?Q?0C10=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K285VzByQ2xzS1Blb2o2bC9vbllVd0srQlNTdTFFTHR5azFPV3JDd2lEakht?=
 =?utf-8?B?Yk4wRjRyQ3FpdzdOR1d0cloxZXl5UTBOM1BtYldoazVBcDhHdFg3U1VQQXlI?=
 =?utf-8?B?eGNYcVFsanJ4TVF1M0JwQTJxNW5COUZpUWlJSFZpaGxHNjlyek9Gb3hNUkpz?=
 =?utf-8?B?QWRtVU0wbGxpQXRBRVIvVUpDemJ2OXF0dTc3K29pNzNCUUlmMEw0ZmRTY3Ru?=
 =?utf-8?B?ZlVGbXowK1hnYVdwUm1HODdBdXZWYzhsTVdUdHFaNlpZRnVUVjFmdUtrVnRn?=
 =?utf-8?B?bG4xM0RRa21HZUQxTE9Lc1VXUGVwVUo0ZXRhaW9MZG1ma3U0dHhLMGM4dUpN?=
 =?utf-8?B?RkwyMElqWXI4QjRGb3I0M1ZjOXJiRXRnbUpQa2JHNmxGV2w3Vkh1SE13NERj?=
 =?utf-8?B?L01nbkpTMm1RdzU4eURBWE1lamZ1akl3ZXE2SUNXdjVBU0FGNjA3MUwyT0lH?=
 =?utf-8?B?QUI1c3Z5ZEZpdDNMc1RTRXFGbDh4RzhOL2pPL3BvTzBtLzJPdS91ZkJ5b1pM?=
 =?utf-8?B?NlBINDVTZTV0L1llNDF0Z01VTXlqZEEzOE9TRW94bVh0N1d2N09PcHVONHA0?=
 =?utf-8?B?M25JQmd2NVJvZ2psV2x3M0loSVVFNVJDNnB3WHQ1QkFVR2tHcWtBRUR6L3M4?=
 =?utf-8?B?OVN5NlBMMTFRbFBUZ1BjQmZkSDhoUXNwUWx5STRWWUpGeXRsNE9xNVFtZjAy?=
 =?utf-8?B?TWQwbDhEVkh2NHcwL2lUVnVvWmovVWp2bzVUUjJEbGtqYmZETEZWR3hBdnlj?=
 =?utf-8?B?MUZIQlpsWk13bXdJU3VLM0NSdk5TWEwwZk1PSEczM3BHUCt2WWpZZlhtdDNk?=
 =?utf-8?B?d3IzRmpETEVmQ1BFeWlsK0pWZkhCSERkbFdGeVM0VjJ0T1NSUEhFWXY1VmJG?=
 =?utf-8?B?U0hXR0YwUW0xM2FQWWlwY291L3dEamZHU2RKWkxtakJMbmxsWWE0cFBadjAv?=
 =?utf-8?B?R2NwSTFUOGw1NGdKU0JYNHJFOXVQK1hUdE9iNVc0RGZJRTZVV1kwOE54ckVG?=
 =?utf-8?B?QUxROHJRNFdCaWxZaWlnaWxWa2Rmb0oyOGJFbGQ5ZmsvRVYwVGNVM24rU1lB?=
 =?utf-8?B?NWZzdVVVd0pINWVNNFFHR2tmeTJzNDYwNUpIb000OTc4K0kxSDF6Y1EyZlor?=
 =?utf-8?B?R2pZdklYNlo4Rm43UThYR3d1ZmdoY0dTNFVTSzJPVm5VSFZaTWZVVlJyQ1Mz?=
 =?utf-8?B?MjNBQWE0RThuelBISVRiZW11ZUViWnJlR3hJdE82eExaR21xNTNBRWFCWVk0?=
 =?utf-8?B?STFvaGJXakE3V2p2YmtRTzgvZ0NqcTgzTm53cy9yRFlzVEcvbzFQKy9UMGRJ?=
 =?utf-8?B?Y2NTeWh4TFVhNkNFTi96N3BVTUZQQnE2VlhDSW5QTkgrNWp0T0xYSDBkaFRO?=
 =?utf-8?B?Y1I4TnRaKzd2NEFhNW5BYzVaRFZPQS9rMTJqQjFXRVBIb0RKejk3VnY0UTZa?=
 =?utf-8?B?QkxtYWRxR2g3Unh3TVhzRGRvUFRxeGFkMFpkbUIzN1Z5ZHpEMWJFMDVJTkJ5?=
 =?utf-8?B?WjlHaVFKNG81b2h2dGplejMyTEF5dmJjQ3N3dm9yUHQyQ3IwckxKbW1EWkpL?=
 =?utf-8?B?SjBYVy9sdXZFTVlNb05SVU43YWpiMWMzSW9RUXE3RTdCOU1oanoyRFBVdUs2?=
 =?utf-8?B?cnJ3T3h1MlRKMUlvcTI1UTJybDJSbER3Q3dKdnJOMUl0WGdZTzNoTnNJU0lL?=
 =?utf-8?B?ZmJKUlJHdjAxWS9iZU5ERnlmbUJJUEZBK1IvRXZiTHBwMENhSW9saGtZa21u?=
 =?utf-8?B?aVdzZW1PTnhVTWFLT1hMU3A0SStnek50dHNkWlhwVzI4bDVSK1pzWkVScTVR?=
 =?utf-8?B?RFJlSUN3WXBJOW5uaG53TXlPaFlHZm1QWjZXbXRtV1dXYXJjV2JjNkVXbUx2?=
 =?utf-8?B?eUFaS2FNQ2FTWmRIaTR5WWwyaEo0K0JxaG1CTHNzWndXdmlnM0Fpb0hqR3RK?=
 =?utf-8?B?eU8vTDBOTnE1TDEvMUdmTUtWTEZRc0t5WVBiUEViUFg2TGplNVBnMTlsVWxV?=
 =?utf-8?B?ay9ON0FZTlF6OS9IQXY0TTZTQmRRZi9VcENlRjQyOVFQcHVPUjFnKy8rYlhW?=
 =?utf-8?B?MVlOTnZ3M290L3FvWEZBMUM1cjBjMzRCdUJ4cnVYWHByWUFDVVE0RzJhSGhh?=
 =?utf-8?B?UTFmWk5WNFpMNDRuc2JrS3FMOTdTSjVSdTE1alBUVUlPNVJOUTEreFRCVEky?=
 =?utf-8?B?OTZsU2pERTMwd3dNRURsY2luNHhPMWlEYTVvbnJKMUx5YTdPVWFkV0FWR2xC?=
 =?utf-8?B?NmZXUlE3NkdEc2JTbDZjUDZEbVM3SmRxVmV1MWdYZG9WZEFxeXR3cXZEK1FE?=
 =?utf-8?B?cmVsYkhwQTJiU1B0RkVRYmVzOGtYbWozeWE4cVMza0FjT0lxYmsweXlBNk9t?=
 =?utf-8?Q?mlE5itVIcOqAdfeQ0e1qBhSgjSCeRHF9SoY8o?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 028161e1-f3c1-4bba-52e9-08de5dcb6117
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 17:42:02.3710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7XlDWu8NT3KHXcg49JmD9GZfI0YtLAdsGm0IReVAII0GPXfF3SP9o0Ya8rjxjfPGt2/16od1m+MDOZSLMhu7nunfETWPIm0xD/IxisLPvCU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9697
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 17:42:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8744

Hi Antonin,

On 1/27/26 9:19 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Remove references to the Poky repository, replace by OpenEmbedded-Core.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/kernel-dev/common.rst | 112 +++++++++++++++---------------------
>   1 file changed, 46 insertions(+), 66 deletions(-)
> 
> diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
> index 2142d31c0..a653d897c 100644
> --- a/documentation/kernel-dev/common.rst
> +++ b/documentation/kernel-dev/common.rst
> @@ -44,25 +44,15 @@ image and ready to make modifications as described in the
>   ":ref:`kernel-dev/common:using \`\`devtool\`\` to patch the kernel`"
>   section:
>   
> -#. *Initialize the BitBake Environment:*
> -   you need to initialize the BitBake build environment by sourcing
> -   the build environment script (i.e. :ref:`structure-core-script`)::
> -
> -      $ cd poky
> -      $ source oe-init-build-env
> -
> -   .. note::
> -
> -      The previous commands assume the
> -      :ref:`overview-manual/development-environment:yocto project source repositories`
> -      (i.e. ``poky``) have been cloned using Git and the local repository is named
> -      "poky".
> +#. *Initialize the Build Environment:* Follow the :doc:`/dev-manual/start`
> +   section of the Yocto Project Development Tasks Manual in order to have a
> +   ready-to-use shell that can execute ``devtool``.
>   
>   #. *Prepare Your local.conf File:* By default, the :term:`MACHINE` variable
>      is set to "qemux86-64", which is fine if you are building for the QEMU
>      emulator in 64-bit mode. However, if you are not, you need to set the
>      :term:`MACHINE` variable appropriately in your ``conf/local.conf`` file
> -   found in the :term:`Build Directory` (i.e.  ``poky/build`` in this example).
> +   found in the :term:`Build Directory` (i.e.  ``bitbake-builds/build`` in this example).
>   

I... just realized that bitbake-setup init actually creates an 
additional directory. It is bitbake-builds/poky-master/build actually. Sigh.

>      Also, since you are preparing to work on the kernel image, you need
>      to set the :term:`MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS` variable to include
> @@ -79,7 +69,7 @@ section:
>      patches created for the kernel image. You can use the
>      ``bitbake-layers create-layer`` command as follows::
>   
> -      $ cd poky/build
> +      $ cd bitbake-builds/build
>         $ bitbake-layers create-layer ../../meta-mylayer

I would suggest to change this path to ../layers/meta-mylayer such that 
it follows our recommendation of having all the layers in the same 
place. In a separate patch/series is fine.

This patch looks fine though,

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

