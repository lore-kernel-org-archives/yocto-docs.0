Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D01D5D49203
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 11:48:04 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.38])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10879.1765540067718522037
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Dec 2025 03:47:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=d+3sqowd;
 spf=pass (domain: cherry.de, ip: 52.101.83.38, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XjcobvInKcCEKsw0RMsWHgRaXT3voNXIOs51fSw55djuBDTOUAZxHsssqPsVCAAxzOy86MPURJbQTqhzA4XqoZNF2mC8Q9AolijFrIHbr5bfMQX8ZGaRGVcmhO1yRHqZ1ixORcq8B40SGTCbDaUs/s7pgYll6UP1yVoF4FKiLcfMv//0YN54fhs2rIjjaVNPynMRLe+kJGGbMkhIlTV2qhss0PRMSSc9nfWbu8/WuEoqSMQxLoG45acBK8y7JKEbha/HLckegrFsRQPzCYFXA3ZF5YTXlv2SXmbXsFCQxJylik9z6SApitjxdHsR71PjhnqhELvgUgdi5uRmv69Kgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SiDF9rInxtOTrreD+YWp/QnsKTil+65NBDuOFC133sM=;
 b=MASRap/R256bsgSVE69ZtIHr2YRvX3qeXWJBk+8UIrlYa96K0S8/OMt0y7PnfZ4IXOjcpTw/uxWY/n7KGIidk02YFxrhSo76pgVFrW/BMuxHHUwJeaAAiSnkxRFRoYBX84GSuSLY5pt9EEMpfT6ZI5/gssztDJMe/QzeiwrBtzeyxm9lUvHDKRSmHUqZt7ctNIMl9aPNKvrkgPso35ZnlBWjJQte/IzZkG8xCh6pllNSrtOhbIvQO5bkux7g4sBq2ZdTwkG3yIr2h3tL81pbyDWRLMUiUD82nuvrkl6mOSDpZz5ia7YDyYKD8iCi6erG0K5mh8N3RKsl6lHo17AO4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SiDF9rInxtOTrreD+YWp/QnsKTil+65NBDuOFC133sM=;
 b=d+3sqowdc+pPGZz6f0GzKaWun7vTbONKM3Y4nXFszp6+Wp3dMtw5djMtUEp880buBbZuocSHG4A2IlGDijt+0qIWup7fcLgjyGZ1BYkj+gz7Z6xi4lqbTzBaDE8GfiGCRPUI4z0JNkUSRN6nlgEC8TDjprW5RBd0qKDx/ixXGVQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DB9PR04MB9675.eurprd04.prod.outlook.com (2603:10a6:10:307::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 11:47:30 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 11:47:30 +0000
Message-ID: <96896a0e-f1fc-45ef-8416-c3fe8af9f71a@cherry.de>
Date: Fri, 12 Dec 2025 12:47:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3 4/5] ref-manual/system-requirements.rst: fix
 AlmaLinux PDF build
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251212-build-docs-container-tlmgr-v3-0-a45c1ce6d8f7@bootlin.com>
 <20251212-build-docs-container-tlmgr-v3-4-a45c1ce6d8f7@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251212-build-docs-container-tlmgr-v3-4-a45c1ce6d8f7@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR2P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::15) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DB9PR04MB9675:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dfc34ed-0e76-41ca-518b-08de39743b22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|10070799003|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UGV6N3RtV0U3NjRwdmJCd2ZOc0RWRHBJTW1wcG1uSC9JK0FWOTJ1am1nZmV0?=
 =?utf-8?B?Z3I1VExGUkhYMktnTDBPODJ1VlVXTVJENSt3Y3oxaUpvZWt3dmZxanJCNDJ4?=
 =?utf-8?B?bm9DMHJULytLSkRqU2FBVFR3RWdHeHlRd1JpSzhNOHR2Z0xLQnczM3NxODB0?=
 =?utf-8?B?M2hJNUJzaVB5WmdaalNsQVhPK0N5WUlOMExIc2RqY3J1ZGZSc1RKdE5LK0Rt?=
 =?utf-8?B?UTFsSGtvL0Y1ck1rbUVyOHViaGF1MklTaSsrUXZIZVlOV0ZqSkw1Y0JHN3Vu?=
 =?utf-8?B?ZXlpcXp0dXhJbWZ2ZldSMTVsTzM5ckhPME9vZmlpUDVKL3Q3cHM2TERsRVJ4?=
 =?utf-8?B?NU1IYlkvbVpuK2NPaWtBZEpiZHZnWWFEUlQ5dHdoY2sxOXYrUUJSdnJ1RC9I?=
 =?utf-8?B?dm8rVmJkS0EydDFxQ3kyQWN4STY3WUgxRFR3TGJ5WU9jWUVXaHAyYTZqMisy?=
 =?utf-8?B?d1pITGx0ZGlIS1UrcGdKWGQ4WE5KY2NvNHQ1cXQxTTlYaGZhaStBTWEyMmZ1?=
 =?utf-8?B?cnZkQjlvL3hjT3MxNGhhZHNlWHYxVWNQeWg1WDdSQVhkbUp6ZGdvQklKZlhG?=
 =?utf-8?B?UXl2Y3JuTnBkZy9pOEtKdjI0TnhQa3R5RHVpalIrN09qUmwwa3lGeTd5eDQz?=
 =?utf-8?B?ZGx0c0ZFYSt5Tks2OHc2alFFWXAvK2tSaWJjNVFEY2dJQmYxeGErL3RVSWhW?=
 =?utf-8?B?Nnk3Z3J0RmtnWXhzRE1mVCtYMUZkWlRydGRiME5VTnlNWkNhQUxxVGRhTXIw?=
 =?utf-8?B?ck9CMXR1d2JacUJiNHJuQ1QrV1MvQytWK0puYnM2ZWtMdWxQVTN5a3hwdXlI?=
 =?utf-8?B?dTYwMmRDUXFaZ1ZFdjBZVzd5Z3hQdFl6YUhDamhOSnBiL1N3bzd1NXdQTFlj?=
 =?utf-8?B?Tm50dzNUZUNmenhkV1pHQmtjU1VLWU16T3B5YWZSWWJxSjNnWkNqTzVxUEJC?=
 =?utf-8?B?VGFDYmhaNkZILzlZVzZnUzdvbzM5V0FNRTVkZTh0dUE1dS95Qy9yWS8vZGFz?=
 =?utf-8?B?a0R6WkE3Y3JSQS91ZjZhc0JrS21KcVhpM0R0WW5oV1EyclRPTXR2VTVVN1pD?=
 =?utf-8?B?Z3dUcGRJbTFHdzZlQnFTb2NlVlNOL1IvY3lYWVAyRmROZmZHVUlDenRLeWtx?=
 =?utf-8?B?Q2cwazc0VDREMWNUUGZJelR1ZXZBaE10M3k5MUs0K1M0NGRJL291TUtyZGo0?=
 =?utf-8?B?Uis0eXVIQzYxUUNteG5yWEM5dHFrY1JUVi9vK2NMdm9oU2k3M3V6eGpkVHU5?=
 =?utf-8?B?ZzM5MDhuRk44MUVTNFpydDZldTNObmg2RkNrZjMwd1o2Z0pQUXRVL1BMRUE5?=
 =?utf-8?B?eTErYzgwV2lUTVhGRkZiUkNHNFFTQmszem0zUDBwTVR2NnE2QW5yWjE1NnM0?=
 =?utf-8?B?cHY3SWl3bkJuaDh5ZHZqNXdIbTc1WUxvRm9DK0xBNTRpQkxnN2lna2g1bC91?=
 =?utf-8?B?S1hlbjNBWm8xbGZJTFVOZjlQeWhKZDVVekZhNWhuVHh0OE5RMzhvc3N4ZThI?=
 =?utf-8?B?UmxnaFprVklGdjhGazVvK3F4YkdjaXpRZjZWZkdaK0UxclJsV1JDR09kNkRJ?=
 =?utf-8?B?d0pFWnRvUWFZaEhXKzNIQ29oR20wQ3ZlYUIxVjJrUU5DL3ZBbnE3bzhOcVQ2?=
 =?utf-8?B?cjNwT2U5VVphTlhkRXhXMmtmUFZuaUlYN09UWE42MDhCWnFRUENEZmswTXNQ?=
 =?utf-8?B?Q1daTVlyVmZnTlcyYzRRY0EzZEZvNG1EV1p3WGQzSjY1cDJHdXFKaEMyd3dz?=
 =?utf-8?B?NU5xY2cvaXpCaTZMVUtKaEVsV0pLRGFIVC80QTVBd0lqendFWEVnVzhRUmgz?=
 =?utf-8?B?K05sSDNmZWVOUXIyRlVCTVNkZWNRbjlFY1R3NThaaSt4cERlRFMyc3JmeVpD?=
 =?utf-8?B?TjE1Um55WlpybkFBd2JQMUpjeHF1RWt3K2hXRTJaTkMyQzNRWUFqU2hacEdP?=
 =?utf-8?B?TWppVWt2eFFKSTZMSDgzaGhtOHZzYTE2WExDUGNwdVUwdDVrWlU4Mmd3SFpB?=
 =?utf-8?B?cElQQlZJRmVRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bHhXYW5md08yd0QyclkrbnhkdU9lZ3YyNlNEZ0tORk85QW9ZM04vVGYwMDVS?=
 =?utf-8?B?eTJUVW9FQ1MzQzc3TzJML0hOaEpZYzV5VlVHYVlDdGhObXdxTkg3dVd1dW1G?=
 =?utf-8?B?WE5Wcm54UDFGSm9wSUZBM051UU5oMmRrWlZOajZ3VWoxdG8wNDMwaXc3NmZR?=
 =?utf-8?B?VDFlRHBIOExLMmhja3RoM3cxSGN4RUZMQ1NwenkzMmZUNGsvd1V3bzBvWGcw?=
 =?utf-8?B?c285aC9KdkNwT3pkMFdQWVJEbndxQ1hkUmY2ckgzRUZPdDBrQ055LzNDZUx2?=
 =?utf-8?B?c2dOT25hc3FwaEpnUWZGN0hlTTY5bU1sdkJhN0ZiaVpBWmQ5WFpTaTNkRkxh?=
 =?utf-8?B?NUhtZjJvWjIvNGZGdDFCZnRBbjZmRVdqZHgraUNGWGRtZFVuN0hlcE1KSEdy?=
 =?utf-8?B?c1lscUVLWklvZjFGWjFtdDQ2TTRLZXBDWWx3L1laRFhWLzREb282clZ1VnV5?=
 =?utf-8?B?L2NMN2dIeDlEWURjYk8wL1Q0MVJybllJMVJGZXJqUGVTK3NiU0FEc01xMC83?=
 =?utf-8?B?SzJSK0tObHhFU2h6alo0aElsV1VvcDl6VG5mY3d0b3pQb0ozWDJuUmdwMEVI?=
 =?utf-8?B?dS9FMVNueHBidkxxWHlNMi8vclp3cmU1cjFsK2VNVStwa211bitvY2liWWQ3?=
 =?utf-8?B?QjEzUHAwQlZQY0RsdlA4RXV3NXVCWGlYR0NZTzFVMzZ6bjRZQVB2RjhmYXhM?=
 =?utf-8?B?RHR1aC90czR3SGNjMThUUlVmaVRtZGUyQmt3aFFVRU9TR0FGZUdhVmNVV3Rn?=
 =?utf-8?B?T2JGemEvdE9kYlFTa0UvYlRVS1Bua2hEUXFzZG1mSTVDU2pKcTczb2orY2RI?=
 =?utf-8?B?Q0tUajFLSGNKNGVrc3I4a0tnMUtMRm1Lbk1QWGl5Y01yL2phU2VLcTZIV0U5?=
 =?utf-8?B?WFVoYWxxbDM0eWdIQnE5ZCs5L0JkYm9sdXF4cFFsbHBmZDhuZnlsMkhFZ2I2?=
 =?utf-8?B?RzhZbEFPOXg2b2hWd0x0dUxBTVg4ZXE4RStOb2c0alZiR2NYYnpOYUFRdExT?=
 =?utf-8?B?NWFwa3hyUitlOHF6MEtvT1VIRlArcktEbUFsQ29ONkVYK3N1dnFudjkweHVH?=
 =?utf-8?B?SURBQ2hqTk1XY2prREhuVjZHVkdtdEFjbHplWmJnVVduLzZGcnIxTFVvNGR5?=
 =?utf-8?B?b1o3VzlGNUE1UFNJT1BGRkIybUtFdEQxV2d2RG1XYmY1bmM0ejRCWEpETTRh?=
 =?utf-8?B?S3M1WHJHTzM3N1FNOWNFbUdLWUUrS0ZxUDBmRnVQN3NmT2w0VjdSd1krVTVj?=
 =?utf-8?B?RzZISFZuaDlRazZyUUxtWk1QM3VUcTY2MUhKRCtoNGhRNWVvWHRPOTlBYk94?=
 =?utf-8?B?aHlHbk9jREUydlBYaTdQa2ZGQXVNV0VmMDFORjBqVUF1UndTRHhkaml2NUow?=
 =?utf-8?B?aVAyN2tLZnU0MmZKWG9sSGJUYk1CNVhFQ0kzcGo1ekNEQXhHaXlkeVZQcWZq?=
 =?utf-8?B?WGpHUmhtSWt4QkZMK1k1WHJ3Wk43YUhTUVE3SHpzQTZybmdXMVE2Q0IxZWti?=
 =?utf-8?B?TGhjNllRVHR0NmFBakphVERrUTlkVGVjMU1qWUt4QzBrNlp3dW9JWkhRdWtk?=
 =?utf-8?B?d1gzTXZsaU83OFkrNGZ3aXVaTU9KUU40YW1jVStaeW4yRmhwMWZTazdhbzV1?=
 =?utf-8?B?Rk8wQm9Md2ZZMHg2dERqR2wrOUhpcngyTzAvZjNmdDRuZTVWakJ1OXpqYTFv?=
 =?utf-8?B?NHZkOWcvMWtjSFVYZjU2UXIreG9MUGRZTTlJYlZhK0p6N0JzTVZXZ3Rvando?=
 =?utf-8?B?Qjg2bkVDS3VQY25Ja0ZoWEpQY3VzSjYxeUVDT2t4R1c1Z2I4VDRJMmJITWFE?=
 =?utf-8?B?Vk1aWDNpK1dQazJkQUZTaFk3eUhHOGxpbTlnQ3BZQkFzYWFUaEhGSnlrTHh1?=
 =?utf-8?B?c3dvZzFUOWs0RkZ0WS9XVG9qQkFzRjhKWisxTEFBRGxya3B3U3U4a1ZQREg1?=
 =?utf-8?B?M1cway9aeXVGeE5hSWxBck4zaDNlU3huc0VpaEpPaFFuVEl6Q0NiQjRTU1RO?=
 =?utf-8?B?bUk5ZUNXMnFJZVdWZGRUNEpobk1tVllFdGhyYS9yVGUySHRzRGl3YlViZ29C?=
 =?utf-8?B?dHovWEFMZ3FrVmlhVGNMUklVSElhWGljVjhlU3NQOVc0QjFHcHZZQ2R4QWxT?=
 =?utf-8?B?WEM4ajg2dUpaMWpwNnNzQVB3Q09BWVhIb2lEUldHeFI2enVZdUdENzBiS1BZ?=
 =?utf-8?Q?4cZWCiczD2+F9veVYwbdp44=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dfc34ed-0e76-41ca-518b-08de39743b22
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 11:47:30.4865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OZam+Yvv+tZSiXgfbbgJiWAJyt9u7r6LPUAAEprdJrZ43+itp3BcD/8mTeq/Xrd1NGhFS9ECsLSvD/0i2NLreRBcJfrgXDAgU10tS+SBoqA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9675
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Dec 2025 11:48:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8269

Hi Antonin,

On 12/12/25 11:22 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Use the new tlmgr_docs_pdf.sh script in build-docs-container to fix
> the build of the documentation PDF for AlmaLinux 8 and 9.
> 
> Fix the almalinux_essential.sh script to either enable powertools or crb
> depending on the AlmaLinux version (powertools for 8, crb for 9).
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/system-requirements.rst   | 22 ++++++++++++++--------
>   documentation/tools/build-docs-container           | 18 ++++++++++--------
>   .../tools/containerfiles/Containerfile.almalinux   |  2 +-
>   .../host_packages_scripts/almalinux_docs_pdf.sh    |  1 -
>   .../host_packages_scripts/almalinux_essential.sh   |  2 +-
>   5 files changed, 26 insertions(+), 19 deletions(-)
> 
> diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
> index 7d110b886..b41295c4b 100644
> --- a/documentation/ref-manual/system-requirements.rst
> +++ b/documentation/ref-manual/system-requirements.rst
> @@ -253,18 +253,24 @@ Here are the packages needed to build Project documentation manuals:
>   .. literalinclude:: ../tools/host_packages_scripts/pip3_docs.sh
>      :language: shell
>   
> +In addition to the previous packages, the following TeX Live packages
> +are needed to build the documentation in PDF format and can be installed with
> +the `TeX Live package manager <https://tug.org/texlive/tlmgr.html>`__:
> +
> +.. literalinclude:: ../tools/host_packages_scripts/tlmgr_docs_pdf.sh
> +   :language: shell
> +
>   .. warning::
>   
> -   Unlike Fedora or OpenSUSE, AlmaLinux does not provide the packages
> -   ``texlive-collection-fontsextra``, ``texlive-collection-lang*`` and
> -   ``texlive-collection-latexextra``, so you may run into issues. These may be
> -   installed using `tlmgr <https://tug.org/texlive/tlmgr.html>`_.
> +   The Tex Live installation above is only valid for `x86_64` hosts.
>   
> -In addition to the previous packages, here are the packages needed to build the
> -documentation in PDF format:
> +Before building the documentation PDF, setup the ``PATH`` to use the installed
> +packages (with ``${textooldir}`` pointing to the TeX Live installation from the
> +previous step):
>   
> -.. literalinclude:: ../tools/host_packages_scripts/almalinux_docs_pdf.sh
> -   :language: shell
> +.. code-block:: console
> +
> +   $ export PATH="${PATH}:${textooldir}/tl/bin/x86_64-linux"
>   
>   CentOS Stream Packages
>   ----------------------
> diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
> index 6a83faea6..6a33b9068 100755
> --- a/documentation/tools/build-docs-container
> +++ b/documentation/tools/build-docs-container
> @@ -33,6 +33,8 @@ $0 OCI_IMAGE [make arguments...]
>   
>      OCI_IMAGE is an image:tag of an OCI image hosted on hub.docker.com. It is one
>      of:
> +     - almalinux:8
> +     - almalinux:9
>        - centos:stream9
>        - debian:12
>        - debian:13
> @@ -87,14 +89,14 @@ main ()
>     local repo=docker.io
>   
>     case $image in
> -    # Missing latexmk texlive-gnu-freefont packages at the very least
> -    # "almalinux:8"*|\
> -    # "almalinux:9"*)
> -    #   containerfile=Containerfile.almalinux
> -    #   docs=almalinux_docs.sh
> -    #   docs_pdf=almalinux_docs_pdf.sh
> -    #   pip3=pip3_docs.sh
> -    #   ;;
> +    "almalinux:8"*|\
> +    "almalinux:9"*)
> +      containerfile=Containerfile.almalinux
> +      essential=almalinux_essential.sh
> +      docs=almalinux_docs.sh
> +      docs_pdf=tlmgr_docs_pdf.sh
> +      pip3=pip3_docs.sh
> +      ;;
>       "centos:stream9"*)
>         containerfile=Containerfile.stream
>         essential=centosstream_essential.sh
> diff --git a/documentation/tools/containerfiles/Containerfile.almalinux b/documentation/tools/containerfiles/Containerfile.almalinux
> index 7237e9b99..5430d17dc 120000
> --- a/documentation/tools/containerfiles/Containerfile.almalinux
> +++ b/documentation/tools/containerfiles/Containerfile.almalinux
> @@ -1 +1 @@
> -Containerfile.dnf
> \ No newline at end of file
> +Containerfile.stream
> \ No newline at end of file

Any reason for switching the symlink here? In the end 
Containerfile.stream is a symlink to Containerfile.dnf I believe so... why?

Looks ok to me otherwise,
Cheers,
Quentin

