Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6905FC77B7F
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 14:10:00 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.61])
 by mx.groups.io with SMTP id smtpd.web11.20747.1750687791579522339
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Jun 2025 07:09:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=H0ufH/yw;
 spf=pass (domain: cherry.de, ip: 52.101.84.61, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+gZkElqH+B/CtcaQR3FXwZ3S0qJzOJXncJkVxiDhsYeYGER7YhGSjFd+0AM03rXjpCzRPrQGr3M9WSdgKEe3dbCzZUOGWaArh9SdHxgBLCooJ1idRxnP/azrCamVziE3c+Tj1P6/7flPUHXOeNs/g2tqtAwvrPR2uJQ2XM1XcXIya0CnY50SUITn6+MVgkcgt3vsKsq1DzSgE0Cflb2iINpFRrEUjek5msrVBE+BXr0O+eSGxzRkOdA+aEIgnxoEr3PEsuJcMT3PHg81SVrSqWine9f2AYT8mkl/lZAQlTVATmWpPhrWahe2nAPIn0Zil86m0FOQtgp6iHw1sh3+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mu0+lLpAj/VumVxXTPfUXc/SjS8ztjD9Uz4Cf50FvnA=;
 b=N8psAk/EqNod0GHVk+dhIwoOV0JBpIs1GoYBfdLb0JBiDZSeE77WITKc27IdWbdW41blL3JWpyAGPKx4L09kB34PWl/5RaduZoLWGzWWsXgvWhAr/VZjJVQ1PqqNOccY5rFjC8+14mm3T4JahFUTCzfVolHalqQbj683AZ0GrJaRUdmmKo2XBSvT5v35Zxkpn+Hydt5ZWheqHwDyrz8GRDSt8UI7mFSoYlGyJGG+3cqvxH+/Cgv+EHqunSfeXSHuEQ5hKPaUXKri8mP39N1dyftrX/keV2jxAdcibsK2NjxBOeC9q2/AUzqwkbBdpfSfGpIAPAIibdI6MbPta0aV0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mu0+lLpAj/VumVxXTPfUXc/SjS8ztjD9Uz4Cf50FvnA=;
 b=H0ufH/ywY2yJE71mJQ0Fo3rqWnY6ABtfUjHxWxnlp09O8K3CAMr89QFQ9aP5gRHVUt/O3weTe2rTb5Mz8GXYEsBHTJnRl5RjAYNsKGsw6s93Xokqfrb9EHA5oeDqa/2pb5Bd9sBaHsRAN5Xv5y/u0f0ezUYNYFM54lDNIWd2AxU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by FRWPR04MB11198.eurprd04.prod.outlook.com (2603:10a6:d10:171::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 14:09:44 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 14:09:44 +0000
Message-ID: <301a3cbb-e3b9-4624-a7b4-a194f1916b2c@cherry.de>
Date: Mon, 23 Jun 2025 16:09:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] how is YP "search docs" supposed to work?
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <833d5f5b-795f-b669-8c71-a56ae6a630e2@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <833d5f5b-795f-b669-8c71-a56ae6a630e2@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: JNAP275CA0060.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::14)
 To AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|FRWPR04MB11198:EE_
X-MS-Office365-Filtering-Correlation-Id: d2331f79-fd5a-447b-49ed-08ddb25f9aab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UlI3WHEzNEN2OC9TaXcrc29mK3NaeG9Nbi9jMUtiV3crWFMvQ2FTVUlCQWZm?=
 =?utf-8?B?VDhCVVRSZEV4Q0dPbHJLL0tmUHVXK0FCN0owOVRjTnREYmV2eTFxMXZ5a21S?=
 =?utf-8?B?bW1aQitjbDVzQXpzMC9GKzB2OFMvRnkyZHU3ZFozUjFDaGpKcHk1SHJEN1FI?=
 =?utf-8?B?U29yaHZlWXRoMTNIR09EYlAzZzF1ajNrYUx1WW1mVmY2Y0sxVzd5Y3pGNDNu?=
 =?utf-8?B?R3RIcTVMb2tQbHpVYSt5MUJ0T2taT1p3NjlFRTNOUFhaL28rR2dwK1RDUkFE?=
 =?utf-8?B?c3pXc2JyWDFONk9rNDhEZThuVEFlblBSTGdVZFZGbWpZY0tMQmxTcUljblpx?=
 =?utf-8?B?Z0h0cUVNYmozQWNPeHQ1VksrU00rNnRKbW1tT0VsaUpVWE9mWjg1M2tGSUY5?=
 =?utf-8?B?SXRYc0l3Z0VxRXpaU0xpV3NaUzZDM2RvMWZkeTRSSlRGRHVJZVRpK0c1dHVE?=
 =?utf-8?B?c1ZFUGQ2ZlBvZXdPblJnaE9QWHdtSjVvU3Jjd1dGL2FCelVxMTJXcjBRZEpr?=
 =?utf-8?B?anlOZDllTjJQNUJJUWZ5bnlLRHBvcTdyc3BNYnJ5aEhucG9weFF6b3lCU1Yv?=
 =?utf-8?B?V2RSU3loNjNaa0pTVCs4Y2o2ZUdSZ0ZXL3UzWWFTdW1Selp0M0V1Z1oxc25W?=
 =?utf-8?B?MnhSeDhyWHFWQ01oT05aWXZ4d3JxbFZaYUhhS3BLNUhPamR4YmhOekE2T1cz?=
 =?utf-8?B?ZU9zQzUzdTdLUWFDamZPWkFMYVhxKzdrOWY2WUdvNzVGcU9wRThOTGFHRldE?=
 =?utf-8?B?UHc5TGFvWmZWT2xJWXFkdm9nZW5pR09ZZ1o4K01LWU5EWlBPYjJWMnJVRGYx?=
 =?utf-8?B?cFpGOEtLU0U3OEU5cy9yZURRSjZmeUhYOXRDWk1sSTBYKzlqMkcwZE84WHR6?=
 =?utf-8?B?bFVBWjhWS0tlSnhlcmFPOFJRODl5STQ2eHFjcHhlZXFhNExNTDFNSjlIRkVF?=
 =?utf-8?B?eUJwQnNsMnhwalJSdTRpaS9Rc0xnOFZQbDE1aXVkRDZNbjRGNDh4V0V6blhR?=
 =?utf-8?B?dm9OT2RZWFhpeVM0dXZsRHlEMnhRaFlhZzZ1RmtiY1JHMGRabTgwY011Vld3?=
 =?utf-8?B?OTlESmJBeWl5SmNxbnRoQm56N0M3WHVmR2JjUUE4RFN1QWNSK0t2SGtPOVJT?=
 =?utf-8?B?aXNmU2VJZ1hTRUlvQkxNcE1tenBpNmNxcW5IVU95QTdBWlVwbkZIWFVvMWtX?=
 =?utf-8?B?MVNjSytwZlY1KzdkWkMvUHlCbWpsdER4cGpTMnRTVUVyQUdTU0xTSk9neEFq?=
 =?utf-8?B?cW5DTUhmc0tSRkxKZmVoTmxTMGVna1V4cE1CeTNGaElrWVJpdDJWSFZyQlBB?=
 =?utf-8?B?c1RFUmF2UVYrckxGellTU3hnNXZORkpuRlJrUTAxVXo2N0ltUzYxcnhQOWxH?=
 =?utf-8?B?VWtpa2JhMG9Vbk1KWHIwZS9KRU1Qc2RJUVNWWUpFTUd2YWFiaFJsUjVpSU0z?=
 =?utf-8?B?aDhBOVA4ejRodjhBWE00akM4clRPMUlDUy9JdUtBZ21wMDd5aXlITE16UHl0?=
 =?utf-8?B?b2tEQ2pZalU2VzdoRFVPaG9EWXBLZkVTb0FRc2Mzdkx2ME9QNUZVOGV1ODBP?=
 =?utf-8?B?SUZVQ2pjZGtyejBnUFhIZ0RTQkJZMlFReEJkSUw3MnYwRDQ0TGJsQnd2ZFoy?=
 =?utf-8?B?OVhxRzdTUG5mMERPcTJxWWUyQm5tbWk1aFdpVUwwaGpUem9HZGR2K2UxeXJh?=
 =?utf-8?B?Rm43Q0VSV0tGcVFwdks4ZEcybkQ2c05MS1h4eUtmLzVvS2JJTEQ2UlZlODFq?=
 =?utf-8?B?QmRlVGJIUU9vM1I5Y1F6eExHTEdWY1hqVmw1UHd2WmhnUk9FS2FVVHpCQWZX?=
 =?utf-8?Q?AdNVcWqNgAmeVwf3WNyhw3lOUKCjOcRwU94IM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QStoOG9MdTV2aDZ0ZisvMHMrRWJWaEJ0blQyTzlxcG5RSGNDM0I4MWpwV3Uw?=
 =?utf-8?B?MjcydEt0Yit5cmFtZFZHS2w0bkl1QmpCeGEyalVkTFBPa2NhWVBJSXZhb21w?=
 =?utf-8?B?WkQrRkRRdStZUHBlSzF1K3JlVmIwSld6Umh4cmJKblRGclZSaXF3VklGSkQz?=
 =?utf-8?B?MEt1WVVzYkU4VmdoUlM2bHBjQnBqNGw5cWxmUEN0U081YTIrVXplZStVdXBi?=
 =?utf-8?B?M3R0ZUVsemZQdnlJcTBQUFVLN1RsWlN6QS92QUVZRnJvVDFZckFwSm4xZkZm?=
 =?utf-8?B?KytFWXJwMnhEVXlCWksrbGFZSTV5M20rbnkwWTQyK0M2TGorTmtrQW9JRk15?=
 =?utf-8?B?b1h3bzVoL1ZVbFZLSld5QmxkSmE3cnI2MWMrTFZXR0lKQ3RCYWlTNUlkVXZI?=
 =?utf-8?B?dDUrZm5nYk5UYU1Nb1N0bGpIamd4VStCZm1ZSEhaemg1RzhBRUR0SmNteFR2?=
 =?utf-8?B?aVN1TENOaURlU1RZRjVKNnhkQUxHcUJTVzVDVmRyTDJqVXNCZ0pEcStEdzBv?=
 =?utf-8?B?cFh3QUdaa0txeXFCYU0yRERYa1VkOEJaR3ZleXgvUFFzRGZGelNtZ0YreFVi?=
 =?utf-8?B?bUlwNkxzTDhHQkozNmwxcUpxVU1UVU9zQWV3Y2d0ajQ3cElqMG5NMGpacHNj?=
 =?utf-8?B?akFydlJvdXJHWWF3dU5ZU2x6WFJGMk9OOTFMb0tTM2p4SUFyNWdvSHh3bUt2?=
 =?utf-8?B?eU1MeTFLZnExalJid2JRbGxHMDBQM2kyamhmVk9BUGpHTDBWRm1GZysyaFJY?=
 =?utf-8?B?OHBlcG93dG9YeVJISnhDVjJxSnJHZ1prVklaYUlad3lETStnZnFWbW5EdVRC?=
 =?utf-8?B?RzdDSG84QjVwb2xIamJhSVgvM2Q2dnNreTB0QkV1cTFXMlZqZHBLNHRzajRo?=
 =?utf-8?B?OUlGcThnNjFKSXhRUEViV3p1R3VHWmRveVRNMDJvdUR6MlpaNHVzemVvK3R0?=
 =?utf-8?B?UGQ1YkcrV2d3T2Y1N3hmTWRoYWNkWGFRZ3FjYlY1ei9aVm11elYzOFN6RWJ0?=
 =?utf-8?B?ZzI2bWg2V25lb0dtY3l1RUpyZk1SYTM0dkgyTmhIK0thakZTQXJ3WWhXZHNx?=
 =?utf-8?B?RUpLTUVEeGQ2bzRka0dlQ0NGQ2pDQk5TVUxqaFF5Z0NPbGdRbkFmRkVjZXNB?=
 =?utf-8?B?YTNyQy81VzBNek1QRThxMENMdm56M1JsY1BBakNwcTVxOTV6ZzFwTFNCL25j?=
 =?utf-8?B?aTBNS1FFVnRObGRDaDFwZGZYMitWZHlXd3REcUtlS2wyNEpkRUZYZXhlY3Zx?=
 =?utf-8?B?MnB4TnBWMmk2N3I2VjB6OGNGbFpOekFYbVJDaU9tSFk5emNQQlErbTZ1VWpx?=
 =?utf-8?B?YklPa3AzOCtXQUdNZWtlQmVFNEJydlQ2Q2paZU5HSk1hbHNUYkxDS1luMW9p?=
 =?utf-8?B?eUZHLzYxQTNIeTFJMk92S01QYXE1N3R2NFRpem1HT0ZPVDF1aFZYL004U0Qv?=
 =?utf-8?B?QzF0Mk5aV3FYWWEwbHRCdFVaeVo4bVAxT1FCamlzZXg4YlN0QjBaQmFUWmRm?=
 =?utf-8?B?Q0cydS9la2l1cUJVRUowT0RwZGVKWHBXZ1YybjYwYlZjeUlLa2h2QStabDhp?=
 =?utf-8?B?aVFwOUJ5dXZYZmlsZE5GVFR5czI5dXZWTWZCdGhJQW5MaEsvWnpqNEFZd1Fk?=
 =?utf-8?B?RlN0S3lIZFhYa2lDbHpKVnNqYU1WMFRXWmpPenVNRmtJUitYNmpQd1orWUtj?=
 =?utf-8?B?aGRjdThSL2gxV3FPcTluWUJQQ2o3bE1NTXFKZnRzblNSYStLTUR6VDFXWDR6?=
 =?utf-8?B?eGY1ZER6aUorS243STd3eE42am9lRWdKMWo3Vi9jVHNiSU9mWXQySUJFTWdz?=
 =?utf-8?B?bU9GV2U5RnNkWUxoNmFBUDc2a2NOUnY2U0NaUE5aSWMyMXA3NGVsSE1zS1lI?=
 =?utf-8?B?ZmpNeWtKVWErU1BQelNqcDlZN2FkU1cxVTR2NnB0YnFFOFplc2pQOGxCb05x?=
 =?utf-8?B?NGRXdERqQTd1QmY5dlpkRnlKdU9rbTFja2xaNmJmdENkNzh4VVlQTkplZ1Ni?=
 =?utf-8?B?ZVByVlQyOUZXZms0UEtLTTdXYUVoVE00ZWVCUWVtK3pOdlRIRlVGUHhwblE1?=
 =?utf-8?B?UFNmU3ZRamlWeFN5VzdrTEIvOEJLNXpHWEhDeTN4YmdjUENZOVVJcyswZUF0?=
 =?utf-8?B?a0RaZ25oOCs1NG5tc2cxR1kvMDMrUW9wUXVxQXYrc2hjZCs5WGluaWx5R2V2?=
 =?utf-8?B?WWc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d2331f79-fd5a-447b-49ed-08ddb25f9aab
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 14:09:44.5717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: de4QBxePN/RpUHuAhKsW+h/7IyCNQyN+Lj8mTxC9hRYVnutC9O99RvhMKjp4GTd5IK30qgtZLbQVhOnwM3OQsfqgZRyxJ0TKH9v1PmzkBb8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11198
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Jun 2025 14:10:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7156

Hi Robert,

On 6/22/25 10:54 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
>    i just tried to use the "search docs" box at
> https://docs.yoctoproject.org/index.html and typed in the search
> phrase
> 
>    "container layer"
> 
> and got a ton of matches on simply the word "layer". is there some
> special format for search strings?
> 

Absolutely no clue on how this should work. The search feature isn't 
great to be honest but I'm not sure if it's not something we cannot fix 
via some configuration or a third party service or something.

There's been some improvements recently, see d4a98ee19e0c ("conf.py: 
tweak SearchEnglish to be hyphen-friendly").

If you find something interesting, please let us know :)

Cheers,
Quentin

