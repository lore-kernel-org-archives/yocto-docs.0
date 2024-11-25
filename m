Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02FBFD58D74
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 17:58:56 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.68])
 by mx.groups.io with SMTP id smtpd.web10.24927.1732557531260099912
 for <docs@lists.yoctoproject.org>;
 Mon, 25 Nov 2024 09:58:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=QivkfwaX;
 spf=pass (domain: cherry.de, ip: 40.107.241.68, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q6PygAO3FIWa6XdGT4pB7F6UDGcPTNYf3SrFBcRsQuRDTWkbUo8GDtGfxeHU/r7tLeKOLstG21CLAgSemTIIyfJHoYSL3/my1HGVYAYsmkwc+SuBaXRcomtrfjeyMy8TUM/Y3FlQ98+hDy1UgEe9by7+XHbHKSqSwmh9qPSXmFFruWpZtX+aLzV1lAegHYI6J0DV2HSDk0c1M+Ivhwrw3dRjFWOHvTYP/r7Onn5d1vq3bgXcfZCfiRNm5A/1VO7bCmqs1N3tPx1fZ+K/vALqW+yR9ZmyTcxvK9gEt8lf78uEXq/oBiJgcpvJaHQy3s4CSoT4TIPOlWRtTtzLgJiIAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fy0JVEg27czOVIILQeQZ2P5/au5FdRG1NFBGNXltIiE=;
 b=L6i3wTUj49QKaqsja4GUgWGnmiVBLaCEVqbB1D6XEsmxK/FpigNf0Ss8CvwoXNDbXSmwJXWpdUqTSyTfDuPdUFg29VJ33V3xlfjvgC9qqKzaLWBlw7m/8kPXLsSroayLaDHbsZoaAY1K/upjPdpyFVq+b3Z3LcW3QYyLPAyAJ46YleEAxj8FeV1iFg0BB0AdZMBnAccrCogSzDb6uF4qXOdgymxia4v0UPNtLeoZ29PiILEHrTOUtwljsG3O0vOoGhMKmwyeAZ3cYstmAIL5bUg56Vxp4Q4pjllNGh5C/5DpGnMUknlIPoxnQsBrVELTXzEJ9YsH4m1IiK0Peuih3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fy0JVEg27czOVIILQeQZ2P5/au5FdRG1NFBGNXltIiE=;
 b=QivkfwaXXPet18iQAys1CJNK1dJje0HeUTz/ZleVvganjA6/ZM/e0sT7f8mp0Mg8TM+cOFutoRG/akkEhNLhkKwKdb1WTAkQZFzSsBDDBPQPtFQkyNvP4sSGH6GxFI1rkrhr8e1gBJ09E8t80uDwkoFzGmSgtOd9qtxVizbcgac=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB9219.eurprd04.prod.outlook.com (2603:10a6:102:222::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 17:58:48 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 17:58:48 +0000
Message-ID: <2ddb847f-9290-4e65-b265-8d2bdb918831@cherry.de>
Date: Mon, 25 Nov 2024 18:58:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs PATCH 2/5] poky.yaml.in: replace inkscape
 dependency by librsvg2-bin
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241120-update-doc-deps-v1-0-50e267ae4123@bootlin.com>
 <20241120-update-doc-deps-v1-2-50e267ae4123@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241120-update-doc-deps-v1-2-50e267ae4123@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::12) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB9219:EE_
X-MS-Office365-Filtering-Correlation-Id: 19f089dd-db2a-442c-b999-08dd0d7acfb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Ynk2UElIVFcwTWxYbTJ5dEVTM3B4QzJ3Nnd1bVlXYjVHTWJyTFdtYnlLN1FO?=
 =?utf-8?B?ODB6R1F4dTllZTFRZmFJR1lUbXcxelNtSkNVd0xoUlZXWFhjdENiUTFwUUww?=
 =?utf-8?B?UDM2VDZtVGFuUmxsdUh4RC9xMXM3SUsyUXNybGRDYW5Bc3V0aXBOaG1EQlBE?=
 =?utf-8?B?dFZETm1lWnEwNGV5ZFM1Wms5NHFpL2JrUEpwWS9IQ1oraWk2cWw1VEx6N2sz?=
 =?utf-8?B?Smpmd1BEVkN4dGhtRzV0UWRXTE5VTDlGTGVBUWZqN2pjQklrZTdJNWtlNXF0?=
 =?utf-8?B?aXBHblZhdVowdmtLS2gvd0o3NzNoRHhTRnZ4RmdXalByNkptQS96US9QY0JT?=
 =?utf-8?B?RWw2R0ZnOUJBZ3g0SmpuTjNlV0V4MGRTV05uUy8vSSs3MkxhMmR2aXhjS21T?=
 =?utf-8?B?R0RKdFZMdFhmQVRHdG93OS9XM1NBZXVVTThvVG1OaW5xQjNhdVJTWXRiTDg2?=
 =?utf-8?B?Tm5hTXU2MVl6K1F0RVQ5bjRHajhQSDJXbTVyTlpIQklXRzM1N3ZkQnFBaHlz?=
 =?utf-8?B?b2x0aGdhSFlzVkx5bzJleSthMFFXSVljemZYMVJLZytCNkllVFdEZGhaYzE5?=
 =?utf-8?B?QUFlemQwTjFRelRiVUFtekhCTzl5WWRMTGNiVHdlc0VXak4raWl6aFJjZ1VI?=
 =?utf-8?B?NENXeWc2UzFOWHRWWmVMNVdhcGZBK3lsQ0gzclVOcXFnbGNXcHlGSEd5TDVU?=
 =?utf-8?B?eGs4RHNxSzhSMVhOUlZIREljSU5nejVNdHMvWWlRKytFUXU5cDJUcWtVejIw?=
 =?utf-8?B?UDV0KzEyYzlxNXFmeWRSTHA5RGhoaWJ6eitLRXozcnVBRzJXQjR1amQ5RkhS?=
 =?utf-8?B?cW8xYWpWWFQ1Mzh4TWRWaDRSZGhsTVNudGtNeGNPVmxNaWNZNUZ6aWFWZGU3?=
 =?utf-8?B?VjZBY09ISlJaM3NROE5WYjQyOE04WFlSd1Bld1VJQy91YjVoalNhVFhKTnBX?=
 =?utf-8?B?b3hwdUtoVm56dEp6WW5GT0o1VkY2bEsxQU1uU0VnUEJNS2FrYWFRWkRmbDFo?=
 =?utf-8?B?bjhLWlJXODd6a0ZxUnk5QzdlYlEzay8xY2FMbmVWd1pMaFkyeGpGT1RIbXYx?=
 =?utf-8?B?czJic3U4NnhtMEQ0Q1gzbUY5ZnZ5K2pmUVR3enAyMVdENnhTMGhERnpKdzE0?=
 =?utf-8?B?eEFCWXgraTNSaTFhNDYwNDdKUzZ5elVMaFd4VXc5YXFaRCtTd29DSFprOUZV?=
 =?utf-8?B?eW5tV0xMTGVRTzJXUTZSdS8zZThpdzVFNmdhYi9oNkFLNlZvdUNZWmw3VDgr?=
 =?utf-8?B?TGFYV0gzbXBNQ0drb05WbmVuSGhwd0RZOWNsMityanNZazZ1UGJkYWVSTUJS?=
 =?utf-8?B?akxWSGhzMGU1NDR0TUlOeXpiMStpeTM1M3VEcEFUeC80K3FLTG96VDlpdjl0?=
 =?utf-8?B?NWk0bDNLUXpBQ0R5enlBYjROeHZGUm1PbVJxZ0ttQUdyNW4yNDg1TGxiV1E4?=
 =?utf-8?B?NEoxcm5MR21DZWdBdWd3WDZWMWlVSUJqM09MSTNOdUxzelNmZG04N0Q0RVdE?=
 =?utf-8?B?M3Z5QkRtQnJkeFl0eVVxT0NGaERBV1o4cVVSM3k0Q1lKZmdMRDgvT2VRSndr?=
 =?utf-8?B?SzB5VS9sN2RIMVkzTlIycWcrS1FJZ2o5UGRqZXlFbnNmaWd1YlVBcWVtR1pD?=
 =?utf-8?B?bjJOL1pPRER6WXRWRjNBN2tLaVRmMmh1MWVMMjEya3BURnVJNWFleEtONUlr?=
 =?utf-8?B?Y2xZZ04xejQ5UjY0cGFpNWRCbW5jbDM5VS9aVm5jZmY0V082TVpFTlhDMTYz?=
 =?utf-8?B?M0VjcktYUzNmWC9mL3JpcUFyYUUyZS9DTjNGajVUV3JuY08vanVZZDhvVjlx?=
 =?utf-8?B?YmNCMkNUcU90N3NYbzFtQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SzNVK3AzZEgxRW1ib2wybEZnUXYwaEI2cW9qS251dDEydGJHRnlQSzV0dGgr?=
 =?utf-8?B?a0ZKMDZrdUx3N1U0MUNLa0dpRGxudlJwbk9nWjMrZVJKTy9QL0pCNnhuZjVr?=
 =?utf-8?B?ZWxVcittZjdEQUkzL1RCdlM3L056VE9HU3c2T1VXcDZOSCtmK1o5RmpXd1Mv?=
 =?utf-8?B?TllmVHFhdFZIbTZBampEVDRhQVBSbDZUd3MrTUtvNGRQdlRQamFBaGxrNmlD?=
 =?utf-8?B?SWplMkVQRXBlN3pIMlJLWkEwMWJIc1lYZWdEb25tOGdFTy95Vi81N3ZhdUFL?=
 =?utf-8?B?cXNkeU94UGROdllWK3VEOUpkSzJLenFlMWE2ZzBCUnpraTFIOXVXUzNFejJo?=
 =?utf-8?B?SitLcEZQSVpNc3hOMndnaHRtS09FbUhvbHlGUjBLVE5XS09MQzRqaGVOcGsy?=
 =?utf-8?B?RTFBYTNCVEhJMmVRZ3F2TlJQcVYrczJFSlk0czFOeEU0OVFHbzB2ZCtzbzdX?=
 =?utf-8?B?U0RGWURpYk4vRk1CM1NNWllLSnB6dlEyQ3cydjdLN2NibFdvT3JsM2I1NGhU?=
 =?utf-8?B?ZkZaS0F0N1FKTlJyYXI3L2NvdkI3YnNwVE1ndzJIbS8vdWMrWFRtWGZhbC9B?=
 =?utf-8?B?YmpneTBSa2pHRFRsM1JJSUdEdElYL1g4S3BaQWdlS0t5c1FReWJiYWJ5UWxv?=
 =?utf-8?B?RXdBUStaTHhGZGJhZHlINjlRSi9GVzhqb1A2TWZqVS8zbjhUaTFFdlJCdFJK?=
 =?utf-8?B?d3A3cGRoR3BrYjRjWHgxWk9zWDJIOE0wQ1BEMVNFbTRqWmZoMGVObG5HSkR3?=
 =?utf-8?B?ZEF2c21yRFpqMXhabzE3NDM3dUpzdEo3YUFodS8zdDZvcmNCYi9ySXRuVkVr?=
 =?utf-8?B?Rndwa0s0akJ0bUg2WEhmUVJHM1RNRFZPRGlGS096R0thT25KZlF6NlBKa1J4?=
 =?utf-8?B?TGMvcnc5MmlCaHR6UHl2cDZ1dzIvT3ZLNUJhMDBvZm9vUnhkbzN0aDFveWY5?=
 =?utf-8?B?emJPdlpUL0p6UGdub0ZFdGtnZ3ZIOENCQVB2YkhndU1WQ2dEc2FCYktmUlYx?=
 =?utf-8?B?SEJSY0phdWkyMDBLdXB4emF6c1lWZzROVkQ1VkJUa0dJdmtGNHVqb2hjaEFw?=
 =?utf-8?B?S2lVbUJBdDdyUkp0eFJ6TExMSEo5KzV2RVBpSGx2aU5QZVI0c2ZUKzBtSTNh?=
 =?utf-8?B?bDhTVVQvaUxXK1hicTBUVnlTNUFoZjZGZ3laOUN3Y1E3aWhYVytVRzFaSkFV?=
 =?utf-8?B?aDRNbkJCRmVBOU5mR0w4LzJkTjhmV0ZOUU5WWEhWd1dlVlRXWGlkaWs2NVIr?=
 =?utf-8?B?dGdGVCtvVjJ3MzVXREJXYzhEbEVMc0V5dGFVckNDNzBUUzIvNjREOGJVTlgw?=
 =?utf-8?B?Yi9ETHpnNkdybGxQbnVYbUFEVmdBcmRDcVU1SlBQZVlHMHFucjhlaE9HUGRE?=
 =?utf-8?B?bTVrMVU3aDVheDlzcjB5RVZDK0h2U1VjZHRSOVpWbWxOM0dCbGZHMm1pZEc1?=
 =?utf-8?B?RlRwR3FSRy9YOHF4ZG84ZUZDTUMyMlF6Y3pVRmpKdlNDeGJkempUNmJhL3Fa?=
 =?utf-8?B?U2Y1SDR5SDQyM1hlRndMSnVFMGR2bmp4V1ZVQ05Ma0VEZkhoMU1zV0daK2RJ?=
 =?utf-8?B?YTRzb2FGalVoWlpqeUxHY1MvUjlOY2c0aXJGaWIyRUdIMmwrOTc0YU9rU0Nl?=
 =?utf-8?B?dldSQmxtRXFzSUtwUkRkL29HNlUxYlFHeHpGUlBiWHh2VGM0QnRzNytQVnlo?=
 =?utf-8?B?dVJ2M20vbHBFaDh3eEFONWMyRFM1VmxReWM5ckpDSWpoZVRDMjU1Y09VQVBs?=
 =?utf-8?B?S2JQdlJlSnVEL0x4c1ZFMzhuTlJyakVRM2FScTBZcVgwNTY5RTBmVHhpeFN6?=
 =?utf-8?B?RnFaSk9Wakt3NjNiNlVwbVRWeU9WRGVxZGFHbWtRU2xOYTY5ZWZLZjRyUDBW?=
 =?utf-8?B?UXBLYzlaaDJQZkFmTnNRWnlhWnh0eVRJNjduZVJjVDdOa3QyRk42Y1ZwanVF?=
 =?utf-8?B?TXREemc3WXp4eWRnY29WVWt6NnZpcENsTkdpb29KS0cxWnM3aHh1US8zZFYw?=
 =?utf-8?B?dDhRczAwV2UvS09yOFZvL2NGcEhhb0Q3TWVNazl5SnR0Q3FsaUNOdjF2eVFq?=
 =?utf-8?B?OGJNSXRPUmFlUERFUTdiV04rdi9PSEtHLytFUHpRR0lsSk9ENFo2WUNabmQ4?=
 =?utf-8?B?YzUwS0JsOTkzZUxERmJ3RXgyVWFmYlo5aDhzM0ptWTczZjAxaTBWL1laUDBw?=
 =?utf-8?B?ckE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 19f089dd-db2a-442c-b999-08dd0d7acfb1
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 17:58:47.9917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WAHDkSAGhPREqqYZhJPmDa0KqSuqK71oCA5lOwPA89CxRpy0AiG7Lzg1Mw1F3KyCkkqvbcvSTATAeoy6918bj8Qzex0/jIciFOHVlfPKGbA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9219
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 25 Nov 2024 17:58:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5805

Hi Antonin,

On 11/20/24 4:10 PM, Antonin Godard via lists.yoctoproject.org wrote:
> inkscape used to be a requirement to convert SVG images to PNGs/PDFs,
> but we replaced it recently by rsvg-convert.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/poky.yaml.in | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
> index b840320a89bfadb259d5d9d0e11f951c55e13389..d0c8973db27340838f78f560c01d44fb67771b25 100644
> --- a/documentation/poky.yaml.in
> +++ b/documentation/poky.yaml.in
> @@ -62,7 +62,7 @@ UBUNTU_DEBIAN_HOST_PACKAGES_ESSENTIAL: >-
>   
>   UBUNTU_DEBIAN_HOST_PACKAGES_DOC: >-
>     git
> -  inkscape
> +  librsvg2-bin
>     make
>     python3-saneyaml
>     python3-sphinx-rtd-theme
> @@ -120,7 +120,7 @@ FEDORA_HOST_PACKAGES_ESSENTIAL: >-
>   FEDORA_HOST_PACKAGES_DOC: >-
>     git
>     make
> -  inkscape
> +  librsvg2-tools
>     texlive-latex-extra
>     sphinx
>     python3-saneyaml
> @@ -165,7 +165,7 @@ OPENSUSE_PIP3_HOST_PACKAGES_ESSENTIAL: GitPython
>   
>   OPENSUSE_HOST_PACKAGES_DOC: >-
>     git
> -  inkscape
> +  rsvg-convert

thought: maybe keep the packages alphabetically ordered?

Otherwise pkgs.org agrees with this change, so

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

