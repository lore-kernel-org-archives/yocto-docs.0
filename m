Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6760CC531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 17:16:06 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.16])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36325.1785172555862368085
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Jul 2026 10:15:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=JE9oXssq;
 spf=pass (domain: cherry.de, ip: 52.101.69.16, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=loSMC8we6QOd2PpHQFM1DT9pE3lvEKxImBIgYg47qABr2NMN+E+UVT47x24K/riQ5aLUp5jFdPayqtJICYfFLC3twedRG8TpIQc/HaDjhh6kOXLWkG3ytEmuke/RPKM9bb12YCRbSIkxgGHv/mU07Vfq6+VNcMzad60ze5aoYuNDSCeBGaU8zXQTMBpfPuzVTgkSqeOaafrv8aSYkBuLKOU08k/ei65Av16n1GeNfNDKHqrr7PZHamRkNEiuumFhCgLVNbwNWzUuShDojmZL3RGJ8Vj4eK4xpxKAh4jDr2Guw5rXc7xl1NE7cfDeELM2b1MKeT1/ap/9NUMs/BHZsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IicTdfByinaBPL1BK/fIvPsD3H9EbV+bq1JEd8FjRxk=;
 b=J78MiDdZeoezzISazVvYW07edCd9aRk5E9XYuerqfIvx8kHACO7PaBIxEypcNwvtnvpD4mgkXwJxG//nIsZr+VyiGhxPJ+4taKPAVOr6wIpU4q74757V22TgjyhjGs3kbUn0WAOgQOL4JquRe6S4hrXuhJylrtq+0OEL3n2gFTRQ5RNLrcexYSFAUEloJbRJwkHxDwTqonBD2+70qmF0Eq6c7WeoMsVDLWWLYpRjbC9rCGpGpII2k4gKQ+/BWtXTaUSFhEIcIhoiBpbxGvTu8huZSjTnSvmEyo0COcyBfyVUb/ASL//rIub5mLNl19JcIuV0A3RSRk8i58SYPaayqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IicTdfByinaBPL1BK/fIvPsD3H9EbV+bq1JEd8FjRxk=;
 b=JE9oXssqagbtPnsaCU4FUvfpZ+O7w3D5NrAwhSmp66tdx/+Szlup95Zdd8Iu6S0HxeknRcF2YVF6p3EDCabGnUQ5DCgfS22zTOkxkwaAvkpak2swra7xvHdCKdO6UHRaTGeVUqAYCaAat2lMxuirGWzlUtEyrlPrd72Mi46xETs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by PA4PR04MB9568.eurprd04.prod.outlook.com (2603:10a6:102:26e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 17:15:48 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:15:48 +0000
Message-ID: <a376b49c-02d8-4cac-aa08-9983315ced5b@cherry.de>
Date: Mon, 27 Jul 2026 19:15:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 1/4] ref-manual: Fix occurrences of omitted space
 with :prepend
To: niko.mauno@iki.fi, docs@lists.yoctoproject.org
Cc: Niko Mauno <niko.mauno@vaisala.com>
References: <20260727163529.30595-1-niko.mauno@iki.fi>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260727163529.30595-1-niko.mauno@iki.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR03CA0018.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::30) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|PA4PR04MB9568:EE_
X-MS-Office365-Filtering-Correlation-Id: b47fb06b-0b7d-4d70-1c6e-08deec02b38d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|18002099003|56012099006|10067099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	9HVUA8rF3ECWjv4ZrsDL7aQsYFpKzUeZozTEO+TjNd9hMeSZw0Ug6WoPVv05DJFAdXmUbikXmtJleltYOxZv1YeYNKqG+hsWq6olpatspn3Y5BS44LsR9yrl44GEHirpM4uz0H8Urt/bVTLDUnUOUBe551/Rn2RUch2j3uP7bthETVC0dt8/BhDnHLScEAiqfsSMU1IOjWT15/cRPADurKS+H7bD3GM9cJW2h4K2ZxPPJH1QWmHvD9cdyq+aX786FhNfyv/hRoWHjKVkE0qah9RGrkC1fs+beIhtFIVuYDw2HMjAoMHpXanawtwrkVi1JBJ6sDh/3z3na/ohFGHaQLy6NXxkQurnfG75xoKP8HI52WCnlH0V9BUtp9iRY10pdBa4A0eKH+I0W0ASphn6nuWVYz1NvQrZW5pxQKKBTTm7WGi1QmXfTVKPQ+bZsQNeK09i5VtYQvByaTlqQt3O8qfiOI54JCvEVNNVIs5DKVgvobbFbw3yazFmSBxn/ewI2ub+ypJZ4T2394F3YZbw7w3wGw31Y5IxE+rWDoFH0xRPzzoJ3LD7IbZslHn5upqhih5Sx1I/tyQdkKzZkYvC1gJCwb33XqA/I6B1w6itDp0tnG2qDwYc8nYdqUiQwjTf+qurSj9vYw2nQQk8jsKsYqCVDokqThJIfdn7XxtY3UA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(56012099006)(10067099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q0owV3dGTDNuSG5WUDRtVE1YaVpLTFZsMlYwd2JMWStyR0g0ZHFVeE9BYXpR?=
 =?utf-8?B?NlQ3QnVGYTZYOER6alB3RjBoOW5VK0ZudGZxNTNhWlMvSG4wd2cvUnNHSkVa?=
 =?utf-8?B?bDJYeHBxaXJndFJqSzVhZW1QSFREdW9vQUQ2dnYvT1ZZZ1hydFRIdlQ4Yml3?=
 =?utf-8?B?QU03dGJaaXRQMjRlTkgyTGpCR1FmcUZrK1cwbnFkNGdiSENZbEtiWHU5amlq?=
 =?utf-8?B?bFpHTndPQytUaE1XY3ZhNHRCK284eUdyb1A0TXEwTjA2ajZ2T2RKQm1jMS9B?=
 =?utf-8?B?KzFlZHpmc3NLUTAyZzc2bmtDZllOR1RqelhsaGZFdXNKcE1RVmVPZFRPcTVh?=
 =?utf-8?B?QnZscGdnTXlNd2FJVlp3dGYrWTBpaDRYRWRJRk5Mbk1MYWNFc3JDcHQ1UmFP?=
 =?utf-8?B?SE1MNTNHOXduUThLRVpPTjdTNkx4SWRFSm1VbUtJaFVZMzkwZ3cybitNUXVN?=
 =?utf-8?B?ckJyY2FKOG1BVTcrbjBiWXQ0Q0xrZFNrYW5wK2QvK3F5QWtkWjdWbkxVYkwx?=
 =?utf-8?B?U3pEN1lxRzdKMkM4bmJ2SU5SU0tudy9YbXNJZWZGTlVYU29iUi8yVXlraE5h?=
 =?utf-8?B?TTFJbUZJYnpDQjhiYnY2RDhyNGNwekE0bmpKc1Fmd0QwbE50TXIzNzFTdGdI?=
 =?utf-8?B?dGxDYjdxTitRYjh4eEJwWEhMdmR4Y2FXSXZpb2tJdGwwQmlMUDB6UEFPZ0lv?=
 =?utf-8?B?MlhIb0VVV3dXRldJdE05WEV4Mkc4blY2eGExcnBaaTNJZXpPVWR3MGJHYlZP?=
 =?utf-8?B?WTJyUi9lbWNQZWd0VUJBWklPKzdxMjRQSG94M2JmRVQ3anNPWndNUDNFeVM5?=
 =?utf-8?B?WFhmMnRydUdGN3lNMk5DQm91M09lY2N4ZnVkMUQzUmQ0cTAwWjl2UkJQSEJW?=
 =?utf-8?B?aHgvSTg2RXNtSkxzKytDV2dYYlpKcnNUaUJuZVE2OXVIb0FMLzhZaitaY3ZN?=
 =?utf-8?B?ME55d1ltclVPNFBxWWNFRHVQYWMreVhuQ25mVmlveWhQVEk2YmVmcU5wd2kz?=
 =?utf-8?B?YmJhVG9QbURFS1pFeTkyczZic3VsakxuVzVCYUVJYS8zMkNNVVJSb3J3K0dh?=
 =?utf-8?B?RDQxcVdqVUo4VWtJZ1ZmRTdCUU5BMlVsQlNJRHgzWTVnOThocmRYeUE3NUhM?=
 =?utf-8?B?blVERWtZczZjYVZFMlhWSXM2dHgyMDk4UUpzaE45TXNwUlVQSXZ0cUQzd1VS?=
 =?utf-8?B?aUllbTFWMzZ0TEtqcEFpL0JMK1M2Rit1L0hoU1gzSXpJeFdXRFd0aFhPZlc2?=
 =?utf-8?B?WVRzK3VKR2VheVNyMENidFpuVTltR080TThUK2pqNk9EbUdRT2VwWWZoSWVR?=
 =?utf-8?B?cVg5aUhqaFQwdkVGL1FWdEsvTFZLdnJQRnlCbnREdkZTcG5udVJ6MnAzU2FE?=
 =?utf-8?B?LzErdzIrQU56RjkvMkcrR0FJeWZBaUM0ZHh5OVdEZlFSWlR3cHBQbm8vR2JB?=
 =?utf-8?B?eWNIYkQ2b0VBQUVWN25jN2pJMitsQ3dmdVljNFlTRnJUWTVVOVBobkxVTHFE?=
 =?utf-8?B?eWUwOG05NGdFK0VnVjB4QjcxNVIzVnZVdk9mbEcyaXRkL1QvN1VsZWN0alFp?=
 =?utf-8?B?aGNzN0NzMi96K3pRc3RhdlNSNG9BR3VRdXpNcXVKWU9GSVZwYWpXbnR4c0hh?=
 =?utf-8?B?MmM1aThJQU1lU0hRanZqVWhyYnRRVjBoSUNSVTZWek50K01jZGtlU01XT3RH?=
 =?utf-8?B?QjhIMllSMHEvaG1MNlNMNGYyZW5TTGF2eXZ2bFNRVi9JOVlNNDlVeVorMEJv?=
 =?utf-8?B?YW9LOEhSNndZeTFVbHRCOWU3blV0bVIvR0xvbitjSzV3cTlNemIzcHgzWHgv?=
 =?utf-8?B?NjBoaFVOY1lTQUFKd0hOOWpnRFhyZzU5Y3hveW01S3EzdGZQbWpkVml3VGFS?=
 =?utf-8?B?MG9ieXdtTXZBc3VvemNWRkY1TUdWOFlEMkFlK1hLNnJYMWNJYXB5OC9NQkYx?=
 =?utf-8?B?azVxUDNaaVo3WmsvczRhZmcyd1VuUU5jN1orcGRXd1ZnVjlkbDdSVVg0WEwy?=
 =?utf-8?B?SllCUkFOajQ3SHJqQmUxb25NVW5ndDFSVHBDRGlpdjBFNG9TRUM1dnkwUlhs?=
 =?utf-8?B?UVZ2aXB5dWVSbTJCSy85cS85dEFKVnI3d1JORWtxdC9JRmpxeVcvckxzaTJN?=
 =?utf-8?B?Ynh3VDNjcGZLbkFscWlrN0Y4ZElvQm5KdGxNMEphVEZiRElRVXVua29pOGJE?=
 =?utf-8?B?Wm44RkJEVWkyWUpNK0R2Mi9NWTFFK1JqR0poSXlzR0lqVUlqb1hmTUhkNHpr?=
 =?utf-8?B?dGc0WEt1S3d3SjV5Mjh4SHkvRnYzby9QODRzR1prT0ltS3Jaa2hLYUxnT28v?=
 =?utf-8?B?QTJLTHg3VWtlQ1VjTmNUOExhVnZDSDloZjBpK0I4LzN0OEl6NHJMQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b47fb06b-0b7d-4d70-1c6e-08deec02b38d
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:15:48.1446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iDnS4SY20eEKVCFdSM/gHkX0aXuBPKRxmT2sIynotuqfhQCwxL+Y9+1TxWUETA1lkkL0U45VDHBv/SmT2G7D6ALMTdVgaYgUbSiBEO28uRM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9568
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Jul 2026 17:16:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10147

Hi Niko,

On 7/27/26 6:35 PM, Niko Mauno via lists.yoctoproject.org wrote:
> [You don't often get email from niko.mauno=iki.fi@lists.yoctoproject.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> From: Niko Mauno <niko.mauno@vaisala.com>
> 
> Add trailing space to value field in :prepend assignments, in
> order to avoid providing examples which could lead the users to risk
> inadvertent string concatenation.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

