Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E30E4D2D108
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 14:01:02 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.58])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.59357.1768312853152184005
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 06:00:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=bJH3BDeW;
 spf=pass (domain: cherry.de, ip: 52.101.72.58, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iNoFK0z6NSjqs2HB1qwSS073UHs1ZJWLSvUH/CmxP98OoAXV37d1jhZ1guArwEHUYI1Vr+pU91UqKGVoX5mYQUSzsxutT0qf9Q30ZbqEPNsLLRBuxCA9CstaRFmk/g8WF2aBj5u7ZNjDndLoTwhNN+K3dwT5dSG2yNd1qhlaAA62d4iKajtInUNtX3GUrP2CU7hZiQEX0yApFBmWTZ1Cq3O8rBOsGwiK5gfkyx7hNCQAGg2vpdmJzlj/LrOfYMRUz5RwLbjPZgokdeKmt3uE9gSK6cWkIdqdCWKOUqrlZzQhClWpYf9UbMvUUJ5qmLM28xAdgPe3pSBnvnkuhJ3fDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8lUyQsbPuZFToHTyeRo7pZIgmFllkFnVI+WvcB852Wo=;
 b=gqH8U2biqkA2DAP9K1/C5HKUPOV+dnFPTn6kSEhVv9DnBhQEL8WGoN1JiPbYr8/Kzeqigdqe1k1FHLdOn6rL5zXsMgKboy2JHJTqlp6FgtgopUrvbw3JpyceBWAZHR21zC+HUzlNaoMMxDrtGcqBhdZ3bWzI1XqPwqn5fp+i5qHCYrLHp7tgeEs+KV7rKpGJ0KHrULJ789e5NDB2byMiA0EzvpasJciEox3sLabysKNVFt8+mNwFPkBBPqaxRWMYNVByvO+qJUwS9E255Nbvrd8U/x8c6ec4NODpW87iYuJ4/bnojF5m4kSod1cZLQqkM/uz9mmtipRH93ts3Q9/5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8lUyQsbPuZFToHTyeRo7pZIgmFllkFnVI+WvcB852Wo=;
 b=bJH3BDeWc6hJx5XxDgZ4sRnEC6GG479c/t/M6H1KuB85DSx2nEd/M0li1BpXGyr3wIp54nbTA9JPvqdVEMlJwD5v3rB4cBNClBKvmvbP3PG97XfT3iZJzjoSt4cA5qtAfJC9RB6iSB8mokgLN4TaZPmtxxvlerzWkKxdWcWNBHk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AS4PR04MB9574.eurprd04.prod.outlook.com (2603:10a6:20b:4fc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 14:00:45 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 14:00:45 +0000
Message-ID: <93b85c8a-df99-4d50-a288-2c676cb77e8c@cherry.de>
Date: Tue, 13 Jan 2026 15:00:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 24/53] ref-manual/classes.rst: remove obsolete poky
 repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-24-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-24-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::17) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AS4PR04MB9574:EE_
X-MS-Office365-Filtering-Correlation-Id: adb4d639-57f9-4a32-4f6a-08de52ac25b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Y2pGMjlJRENOdGFnMFdEcm40M3lacDZQOUwybDNsWXpkRmJXTGtLMXBQaTVt?=
 =?utf-8?B?c0ZzNlpzMzV5Y0swVnRwbitvNTBieWZHaHJXOUNBWmlycERDZnpHbkJsNGtj?=
 =?utf-8?B?eWttamh4TVFETEw1aXE5L1FxckpPeWNrZW5PVnJNbmRsSi9qc3kxbmVLR2di?=
 =?utf-8?B?OUhPVkZNYzhqL2QyUGlZeEpoTEpkeFhPaVVsZlNSeDhoSWl4clUySUp2V0dC?=
 =?utf-8?B?dEorK1M2MEI1cGIyQWkrWUJOM1E5NE8vc1hTNmt0WWZNbGFzV3FNcSs5UlU1?=
 =?utf-8?B?WWIxazk3M2FhbFFJQUVtUFlLRldDeHRPelJ2blF2cGFQdlVablpsSlVqN2Fn?=
 =?utf-8?B?K2ZMT1c3VEZvTFlMbGJweVFwakY5eGd6aXdVSHhGK3BsYWxrbERKS09Ndkxj?=
 =?utf-8?B?bFN3dUJsaTRubWpTQ0I2b1ovOUx6cUtMUUtKMmxMalQ1Qi9wTDd0ZEVPcWQv?=
 =?utf-8?B?MUFtdmpZNjlZZDR1QW5ZMlZsSUsxRlBQYlFPOGFtQnM5TzlJNXU2N1RLb3Bo?=
 =?utf-8?B?Y0ZHZnp6TTdOUEZNNUJGZzNxcnNlTVVHUUNqOWxvNHpZRlNscDJGVXRYMVcv?=
 =?utf-8?B?KzlqTGRIc0dOMzZaUEdIWWx3TWI4MGkwNUo5VXVtb1IrTDNXeUdhaFBOQmZB?=
 =?utf-8?B?SXNaeGFSTkFoTVV2a1ZKWnhOS0M1UzNpMU4wU2RKc3pVT0V4OTBGS0R4MVc1?=
 =?utf-8?B?cFhzZnd3LzdZRDFLVDVQU0o3VTBPUlZnL2YrbnZ2NG9yUml2TCswb1FSUXVB?=
 =?utf-8?B?K3pPY0hjMHVIdmNCM2kzcVNIMWxJZXB3ZGh0dVBiR2dGQ0wvbXZjZGRrVm9X?=
 =?utf-8?B?eU5Gc003TzZJWXVTRngyRklWaktsa2EycmZsRFIvSHhtUUFYcUJuT0ZOMXZO?=
 =?utf-8?B?ak4wSXZnVlVJK2VYSXRFNUVxMWhnVjdXaFRIa0QvMTFQb2JlRWwwd3JJdmpY?=
 =?utf-8?B?NzcvaGVGcGNMekZZdlppNUYyVUhXdmlFTDY2S3owTGhHT3A0QVh5N2VnelFo?=
 =?utf-8?B?amppdXk5V2wvMEtCM0poSjRIVGtXMGFha2RTMmRrWmdmODY4SzZhQW5lT3pP?=
 =?utf-8?B?M2VwN1gxRm9JM0NlQXJnSUplOWRRUkNCVGN6TVFpckZ3K29xbW0xQmhTRUpO?=
 =?utf-8?B?aDNVaGFKWHZuVWFpdUZNMFMrck5zT2JMQmJtcnJReFNwZTdhWFJtV1hTWDlY?=
 =?utf-8?B?WmtnaS9jVFg3UTFSckxLZVQ4K2I5QjlHS0FQQ0ZjUGl4MXdRMVRwb0tSLzZU?=
 =?utf-8?B?RXFVQ0lxUUNPaXEyNkhjUmtjRXN6d1FJM2plVUw0K0ZoMzZIWDRQT2ZjMm11?=
 =?utf-8?B?RHV0QmJ5WWRsYU9HT3BDUUJGZWdmQ0ZEMWpILzBFb2oyeDFZU2JXanBLNkE5?=
 =?utf-8?B?OXpVTDl1aThhYmZVelNkbzVGcXJrelFvNHRndnZnVmNLdjJvY1NEbWJiWTJF?=
 =?utf-8?B?OUdnU3grY3YwSGJwVXQyV1BNT094YUZNa0FTSE9Rc0Y3d0NVUHViNkxYQ201?=
 =?utf-8?B?YjRuVzJFcGljdnpMdjZjd3ZTOUFWWGRMWmR5eE5pb1B5NE16blM5WXRSdnoz?=
 =?utf-8?B?WXZCMGxhTzVKd28xU1hwZ2dDeXBTdlhtWUZvbXE1Y0llM1BFY3g4eC96Z0p4?=
 =?utf-8?B?SjZpbjZBV1M1d1kyb1gwbTdLUDlpS25Hb3gzK1lQSVBlNzBvUmkyYzlYeUQx?=
 =?utf-8?B?bmFOZTFMRFBZU0l5WWRPbmVuUmY1a3NwWmRnK0xIOW5McUlqeDhzR1VkZzcy?=
 =?utf-8?B?N3BESDdSM3RhRWUyYU91QWYzc0NubG40cHlyZlJReVp1K25PQkxQSlIzU1Z6?=
 =?utf-8?B?aUFQVkZWNkFZbkwzUGNFZUJGbGdxdmR4Rk92disyTStTM2dXQmdkOTR0azNU?=
 =?utf-8?B?OTNoYnc2QUtQYnI3ZWFha0lDUVdaVlJaRVFHaXlLZlFLb3lsUzZEeFJiSEFz?=
 =?utf-8?Q?PWkgGrrs/ky0HzIre9cQr3D9CCiyBqq+?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TDYxSXRqRUhLaEsyZDFZT1VEcVRXYXpsWmhBN01POGpPNVZNMVJUd0RpRVdH?=
 =?utf-8?B?SC9ROTY5aFNPR011Nm44STQzOFg5OUFGQ21FSnMxbEZqOExraEUrNCsydHJk?=
 =?utf-8?B?dTdmSHRnKzVxc3VxeElWRENJSTRBdloxdFMrMWg4bmVkdk5ZRmF5em5VMW1Q?=
 =?utf-8?B?NHFkaVc5OHNHRGVFa1FoM0laK2grazZLVEh0dlNCYlRicnQwbCtJbFQzVWE5?=
 =?utf-8?B?MlpQem5LSGRIOUFGRDRsS3VyQnQ2V3F0WktTWDVQZWxqem9jVmNZWjhuVEJi?=
 =?utf-8?B?Q0c1d2k3cmR6L3BuVWhITWF1cWRISlhRb3duVWlwVCtkekkweXZGcW9OeG5I?=
 =?utf-8?B?SmhhZ0lPSkFDZG9TME1JeWlYTXdhT3dYSlMxQXo3NlM4bHZ0d0dQVERkREpV?=
 =?utf-8?B?K2pjVXlZYzFqOGgrUCtKV242SjJRbjZKdklCb2ptQkducnRoVFVURmNrTFBt?=
 =?utf-8?B?UlBseEdUK2drT0JCZk9FY09WNWY1MnpXOFlNQ245RVJ2ZFc2T0RTOXMwRUtF?=
 =?utf-8?B?emIrSUlIaFU1c0R4TkxiMXhjZmNSV3YyTFZONGRaZG9KU0dkQ0dUNE1tUHNr?=
 =?utf-8?B?MUVLSi92SFdPcjgvMjVqWEpEYjJFSUhoZEt4Z1Q1cXhjVVV2SEFyZ3BzRDZR?=
 =?utf-8?B?b2pnRWJrWmNjQkpsc3lYcW5jd2FlVlYxYWl5MlJMM001aUNFc3ZLaW1LWlhh?=
 =?utf-8?B?U0dlc2t5MHJLbDYwR3YzTWFCWWVEbzI4ZEUwNkprcTdGRm50N2V4azRxZUFm?=
 =?utf-8?B?N3BNbW9hWUw5a1lYdnh4OWxTNVMzcVNSeUM2MlEyWnl3RFovZ25PZjZVSUhV?=
 =?utf-8?B?WVpuYmpMSTMvT3RqNlVjM2NpNjBSb0g1azVOdzRJTUdVMExCSjV0NDZjbTF0?=
 =?utf-8?B?MmI5bkR1UFpRUjJETUZqcHZjMnhVRHVxVEtrWElTVTA3Y2JKdkRWa1BJWnhh?=
 =?utf-8?B?ZlBJS0dCMHByS2NVTEVidUlXYUY1Nmw0S2JVVkk0NFd4YmtiMnVZWEdqNngv?=
 =?utf-8?B?MG1PZVJqQkhpQVd5d09TelRRVS9FQ3hOVzZxdjh5WVBhbm1lVWZoVThXeXdL?=
 =?utf-8?B?L1lSWFZoN0h3K2VSNi9kanRsdDVCUXovbnBCN2I4S1U5MXJ0VDIwQUZmemJ6?=
 =?utf-8?B?REJVYlE0NTJsUTZOSUd4V3RyeHl5YXpDRjQ3eitNbm45WkdvQzdmalcwWU1n?=
 =?utf-8?B?dm1WekNuQlFkcHcvYkp4MS8zc2pISXN2ZVNXNGlKd1NEbU1yMTJhNU5kelVK?=
 =?utf-8?B?MGt4aFF3eHN2QWNKTy9SVVFkeDFOVlZlMENhY21sUHlzSWhwUVduNjRFdDc3?=
 =?utf-8?B?OU9IWFBmMkEvekFjZHNkNndXZmdWenYxenN1WVVwOHRzOFNrbTV0Y2dPKzZr?=
 =?utf-8?B?YXFBUnlWSlBHalROa0JHNGl2a1BvNUNsbEFPdjFYdFNSR01ZTGZ6ZlI1YnNK?=
 =?utf-8?B?MDErNi9pc1RsY2kyem9nQ200L0dYQUs3RHRQc1FjMkFtbDFyREpRZGVEcWsx?=
 =?utf-8?B?bmp1OGF3Q3RNL2RyN1J6OEtGNFpJNjFxL1BKZWJha0NPWG1wUndNRE5nYmtS?=
 =?utf-8?B?SldsUkhVYkZVSDNvR1J5MW5BMkh2OGRKQkNqd016SU9tSmRKbVR2ckorTHZa?=
 =?utf-8?B?R1RPNVk5UkpUZlVia1Rsa2N4Y2grSGtzUFZCaS9sU1hCdW8xUU1IaHRDVm1I?=
 =?utf-8?B?eUpLSGhOejBMbHRzUHZrUGlIWnA4S0pmZlp4ZVczMWpIenAxQ29DS1phY0VP?=
 =?utf-8?B?M3hkU28yVE5YZEpvTmJVNEtvbkMrL2RXN0gvZlMrR3dMY1g3TERzNno5S0Js?=
 =?utf-8?B?a3Fmd2Y1MFhvbmZoLzNFMm9tejZNV2JCdlBiU1dmamFYbjYrQ2FjZ2lVSEFk?=
 =?utf-8?B?czI2dmM5c29hZUZyVmZGZ0hnWXlwOWw4WURpQmFYWENPeWFHaXk3ckpzR0hm?=
 =?utf-8?B?aHhhUkNCVzRUVUMzNFY5dy9oVEFSRDhMUmIxRWpWMy9GU2VHS0Z6MEQ2WW1y?=
 =?utf-8?B?QThpbXBiaWxFR0tJSWFCUngzdTh4YjFPM1JaWkFMRHpwZjZWV2xCTTlhQVQ3?=
 =?utf-8?B?dXhxMWxjeUFBYjk1VmRMMVh5MWlqOWx0dlJDeVVONEEvY0tiQ3R6NXN3b1dj?=
 =?utf-8?B?MXJ3T0pZZW9UUURPZ0FxaTZRN0wxT3FiUVZPYmdyM2hEZjZvWDNKRnZ5ZGtS?=
 =?utf-8?B?R0lmaGU0UWlLTXdMMk5HcTVGU2QyU2Y0TXozYkg4Z0hOV21SU0FmdUx6SHJz?=
 =?utf-8?B?RkV4cSs4cVpxRTMzMU5Jc00raWtvTGtiTE5WOGxXMXBpcnRoVUxQeHowZ2w4?=
 =?utf-8?B?bG9MNy9ZbjB5M1ZJY09jbHpTOENuQVo0Z2FWZTJBRDdnMGN1aWVIZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: adb4d639-57f9-4a32-4f6a-08de52ac25b4
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 14:00:45.4442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OjDzwyTe55FNgcECvZWOxFptYpmZUhdhelIv3f2b+LRenyBaqj/vPuz6KnWzeSnOgmDGHGhzOtFFZaCKiIkg1mxo3GOhPXV+LHeuTQ+RV3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9574
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 14:01:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8513

Hi Antonin,

On 12/24/25 5:31 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Remove references to the Poky repository, replace by OpenEmbedded-Core.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/classes.rst | 34 ++++++++++++++++++----------------
>   1 file changed, 18 insertions(+), 16 deletions(-)
> 
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index eae15fd62..bc98e2575 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -9,12 +9,13 @@ amongst multiple recipe (``.bb``) files. To use a class file, you simply
>   make sure the recipe inherits the class. In most cases, when a recipe
>   inherits a class it is enough to enable its features. There are cases,
>   however, where in the recipe you might need to set variables or override
> -some default behavior.
> +some default behavior. A class can also be inherit globally (in every recipe)

s/inherit/inherited/

> +with the :term:`INHERIT` variable.
>   

This also has nothing to do with what the commit log says it's doing.

>   Any :term:`Metadata` usually found in a recipe can also be
>   placed in a class file. Class files are identified by the extension
> -``.bbclass`` and are usually placed in one of a set of subdirectories
> -beneath the ``meta*/`` directory found in the :term:`Source Directory`:
> +``.bbclass`` and are usually placed in one of the following subdirectories
> +of a :term:`layer`:
>   
>     - ``classes-recipe/`` - classes intended to be inherited by recipes
>       individually
> @@ -28,9 +29,9 @@ in :term:`BBPATH` using the same method by which ``.conf``
>   files are searched.
>   
>   This chapter discusses only the most useful and important classes. Other
> -classes do exist within the ``meta/classes*`` directories in the Source
> -Directory. You can reference the ``.bbclass`` files directly for more
> -information.
> +classes do exist within the ``meta/classes*`` directories of
> +:term:`OpenEmbedded-Core (OE-Core)`. You can reference the ``.bbclass`` files

Is this supposed to be "refer to" instead of "reference". Triggered my 
"doesn't sound English to me" spider sense but no clue if it's actually 
correct.

With the first reported typo,

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

