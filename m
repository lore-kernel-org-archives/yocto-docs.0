Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD139CCA471
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 16:04:31 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.64])
 by mx.groups.io with SMTP id smtpd.web11.105.1759766665118082659
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Oct 2025 09:04:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=TyA+Bndk;
 spf=pass (domain: cherry.de, ip: 52.101.69.64, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rdSFoDPZSUJkMS0kVym6eZxF5UpSsQLyCKCI5lqntlXL24E2Lqkpqzh2xqnG1ytEBRsiRIxHyxavfUXIKATIYzBokNHe6d6+3BeLtBlibQuiAiGniXLJL9tYHvlceAVNzTJQxQ9MTC6PwtzycI5btv/kCxPR4eEYMTUXvdZOQ83vsd0a4nrZl5CiEmTCPvIPhZL3io3LdQ1rNt3JDge6jEvD2bzqTlK3k6PerA324n2Mq4aoU/m8izEL0RgzXKTwDhOqOX+SYyha8At7xfs11TxiZOfhW+Typ5UZ92H7J8ynTo9fjDaUwVkraK6K3zXEgYGK4ZUPQ+bQL4UisCf8/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K4GPK7X6EOByQhtb4Xw6N4HkVX2DiktHOZny2S8sR4Q=;
 b=MmDaDba5ZBrRzAROvc7S3N/tUyo0kLIoSrX8zbx8Ns7IMTSxufy0q/ZtYSMKW7IHgBOl9TfS2ZoMxd0HanFCph3ImfmT1XFwdm1yRwXXqfYgF/4ObvW7AyFHtTW1WKExVPLePSvp97z4PWsYjUWzQIpfIsaq5NNA0f7ClanwI0Pzn81ZfmHWRQXWd3cHJ8Y4Fz8lJR/1FdAPipxSFlvr4sLTu7sjmvPssgYzCdcZsKNpu7mwzdW01iSy5swwRUdOur8ly6eMJsosygjDDjJSHwqm5PKEo5B8+ZXOkm0PCypJyllM4mu70uK/5NLBWjMzaq8dHcL/wPnFUmBHjhzmcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4GPK7X6EOByQhtb4Xw6N4HkVX2DiktHOZny2S8sR4Q=;
 b=TyA+Bndk3W455wOT/71v7lCCqrlUDO6fSp30ZQxT7fzhkMpoWM0wr5Dk2EqU04amx2+f333vlj99ycslx3iUPJDYLCvSnR2WcSWMCp1AihvI4ZXGyxPRrLOIgbXc3LgVPzOJqYDZNZki9HX4GcBm2w3MrrT/FN6RGRQSTPe/T0o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM7PR04MB7095.eurprd04.prod.outlook.com (2603:10a6:20b:11c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 16:04:17 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 16:04:17 +0000
Message-ID: <b6c534fc-d9ff-442e-a8b2-5b8521cd164e@cherry.de>
Date: Mon, 6 Oct 2025 18:04:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] tools/build-docs-container: add optional option
 for essential packages
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251003-build-docs-container-essentials-v1-1-558fb531a9c7@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251003-build-docs-container-essentials-v1-1-558fb531a9c7@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::15) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM7PR04MB7095:EE_
X-MS-Office365-Filtering-Correlation-Id: d59bb090-f49b-4083-e78f-08de04f20062
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NHZRd3ZNQk1yb2dvcE55OXRleDNINHJhN3U3cGF1d2FsSnBkU3FkMTF4Zllj?=
 =?utf-8?B?a05Ea25kS2FySE1TTzFPMjFndTlqTFJrRmRnejd5ZGVIelpyY3YzaE9mdnZr?=
 =?utf-8?B?ZmdKRFJpS0FKeHdna1BUMWs1bXQwR29LRTd3Q3l1MFpPRGR0anFrcWozeVgz?=
 =?utf-8?B?VHVYWktJdU1oU3VvWTlRWFZTQmlIdnhmcVo2SGMrQnVRRnZCNVRRdk4rdndo?=
 =?utf-8?B?VFJLOFV4VStEL0VJdTkzOGU3MXdxOEthM1pxREM1MVYxcHpia2lvS04vcmJy?=
 =?utf-8?B?SnlDMU5tUExhMTM4d1dQRXhCVmhpK0F6U0lFMTdMSC8zTnorQkZETmN0ZzRj?=
 =?utf-8?B?YmdYZTc3OHk1dmdCUlQ5OCtKZWN1dU1kdVZsSjhBbUs0TWovSEltMUh3d3dt?=
 =?utf-8?B?c00rZ1l6bzl1RDRpZDVDemV0Sk1uUEM1ZHdwTFlTa3FGVFlzODFkS1ZTWUEz?=
 =?utf-8?B?Z3NSWmdTTGQwanJtSkJNaVIwbEcwYU1ic04vTzY4cURFNXJQVVJSaWR5dWVS?=
 =?utf-8?B?U0E0ajM5dTBRamx3QjU4Ymd4UUVhb2g4bmh4dmFzUE5WWlYrRU4rc0ZybVo3?=
 =?utf-8?B?VDFoZ1BDS2pkNmp1dDNSNFNKZldQS3dLeDVnU3ZzTXg3SUJvU2hRdW4vRzFO?=
 =?utf-8?B?TWQ4Mk9OOEs5b0F0K1NIK0lnQXdRaTJzUXFhcU9WRzVNcElDMHZLWms4ZUFG?=
 =?utf-8?B?UC9kdlEydVZ6ejY2TE1CTkNjNVFRaS9FNVRoS0kyVnpZdW0zeWhvVno5aU01?=
 =?utf-8?B?aGU5WUlRYjdmRXZJbXErMkRMT3lKVXA0ZWdRdFl5MU1iRU16MHY0WmdVcWZw?=
 =?utf-8?B?VGkzOExqd2hqSHlEVnk2bUpzbTRFME9YOUdLWWorUkFjOWdDb0tQcUZ3YnR4?=
 =?utf-8?B?Q2RhbTRuU1VtQllsRVBIaFljRWJEZnA4THpXRW50bGYwUGpMc0V6V21XUDBi?=
 =?utf-8?B?V1l3WndzZGVsZXlqTVFSZkdJL1kwZjhjUTRlbG03aVAvaSt0QW91TUc1aC9O?=
 =?utf-8?B?TFVYUng3c0FRWHVWSHgwNzdhZ3hXK1FYYzJsd0tSU0xnTUtIVjB4S0dkanpi?=
 =?utf-8?B?azY0UjgrWkZiaVFBTVV4Mmo4UFZKNnNPY1ZLV29vL2RsRXgxZ1pTcEtnWEox?=
 =?utf-8?B?R2w2MzVSMGFYYjU2NUQyT0l1R0VVQjRPL1krKzZQamoxbGxuczNHZlpIM0dG?=
 =?utf-8?B?YUsyTTZLOEQ0WGZuNGFDSUc0VGdzTGFNeldrMWZlUkliZ2FKeXZOMDJxUE5W?=
 =?utf-8?B?UDlXeXM3RHFuZnd0RHlCZHpQTDdzeTZuN05NWGhBc3JvZU9VTG5QUkZwZWNW?=
 =?utf-8?B?MjV3T2Jwei9VeFBseHc5eVZSbm10ZFlQdDhRRk1HWFBXZWh2MmpyZ25pQzRN?=
 =?utf-8?B?MVR1MlR4UFkzcXVsai9VMTBVdGViMzJsa0lFMHRDbk9CNmdiRGNod2NNTjc1?=
 =?utf-8?B?dHZtTlZsdU5wT29aVTdTbWY3UEVHQ0dlRWxVdlA2MDVZYXFBbkxqbmdGOFgr?=
 =?utf-8?B?YWJLL0hPZnpiaGxLZXdDV09iK2p1cEgwUVZGSDM2UWtiNittczd5bXE4NVRU?=
 =?utf-8?B?QU5oYmJsTExtUzFIRUhsUWN6WmY5b2xxMGNoV2RLK0xiNE5IbE5NNFprcitE?=
 =?utf-8?B?MnZrYm81UmtReW1sdDhUTm1ENFZpdVkvN2wxR0dLdVBpVUpYSFJOMkk0U2da?=
 =?utf-8?B?MkRhamdzQVlxOXdDYUlJQTAySm1oVmJpMW8rNGNKNWV3eHAxVGhoWU90emNI?=
 =?utf-8?B?Q2lraVcydm82eW5NNkVoRVpETWl3aE9lWVI0UWNoNXVtckNiMmFOK21KNHlZ?=
 =?utf-8?B?djdBVGwvZG9XdVRQNkZKVWZaM2tJbnJ0aXFQdC9OMTRMSjF1REJFK1duMVlq?=
 =?utf-8?B?WmJqbXArUlBTLzl5MmJjNUtxSytLTEkyNmlrY2ViYW5XOTFRekwxNmJQRm5B?=
 =?utf-8?Q?K1dOzIqayCXJLIDJR7WZameYKU3ffNI2?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z1FLTWUzT1IrdGtYb3BzT2NBMi96RklUWDFhaU9mSEtrSWFqUElMMWR5S0dp?=
 =?utf-8?B?WCtyTWNYWkFKcEhpRmVDYVE1b2M0N1g5aHNDWTJUWDBGUWtlVVJ3ZytTRnpQ?=
 =?utf-8?B?ajJ6alBXSVFGcS9PdDdmbHkyTTVMeG5SQkwrNXZWYVRia2FWZlM1WVVISXpn?=
 =?utf-8?B?ZTJGakVodE5iQlFXZk5melhBelh3TWJ6TWhzTksxR2Juem9mdElNNm8vSEUy?=
 =?utf-8?B?M0tLQ2VtQ096cGZvRGIvUjVSeForVFJsbFVMNzhiZ0x0NUQ1ZHhZTFErSjI2?=
 =?utf-8?B?NTJzdDBqY0dyR0Z3c1o2RERaNklnM0RlWEZHbVhjZmN0cTVlRWFVWTduTzEz?=
 =?utf-8?B?WStlUXRIWGNZaHkvTndoemMxRHZhWk1IajJPK2wxY1NQYmd5UUVyTG5aMWFj?=
 =?utf-8?B?MjlTMmFrNzdMWDR0dXV4Y3EzbmhtZkRmYjNmcFhxTDRxQkhaU082VDlWSGdL?=
 =?utf-8?B?cFMrK1pjWEgza3BjU2psb0tkOVdEdjBhK0RSU05kM1NuOUhsdkl1b3d5THkz?=
 =?utf-8?B?R1RjVXhYWE9ZTXAySkJkZkh6NHkxM0dySjEzb1hlUlh2MytWZGNTMWtVVjBM?=
 =?utf-8?B?am1lWDFTOG9QTU5QTFFOVllQajdXVWpHWU8wNW5zdFRZdHNvbndWbUpXQUo4?=
 =?utf-8?B?cTgrU0xmOW4yQ0hPQS9oZ2d1akFHbzU4UjRURTkzQytnbzVRVGFvbmJad0pt?=
 =?utf-8?B?SzJGdzFJSmt1UGptd1JxZ0ZXcWljTHMra3dPUU1DTGVYLzU2ZmlKZUZjdm80?=
 =?utf-8?B?VVNaWjJGREhwNDJMMmRPQ3lYdUYyY0s5NE1vakh3MWtra0FrNzQvcVBnWHpo?=
 =?utf-8?B?enkvMWJmNmVXdUFwNzdNZ0N0VWJvVmZBZlZRQitIdGtHNzVsT0VXTWNHSkRF?=
 =?utf-8?B?RnFyL3lpNGRCSTE1dGZONGZsR2F0bmtYcjJ2ZWwrVVNsc2FDWFptcWRBdmZS?=
 =?utf-8?B?aGlxTXdtRXp4eTdsT0Z3L2RQYXdGVE80ME1GTGRRb09UTFJCQ3FIb0NrMnF1?=
 =?utf-8?B?NHVuazJkZ01vei95RzZWL2FJMGMvdXg1SnlQRmFwRjAxWC9UbmVRVlhmZHh4?=
 =?utf-8?B?R1lpcXA4Z0ErTGlCN3pPRkVhNUVQODZOWXd1eDVkSG9EQkNFVFE1RDBPOVla?=
 =?utf-8?B?S3habGxkNnhoU2N2LzVNQloxbkpnYTFGRHV4bVR1QkZQVnBLWGptczV2N0M5?=
 =?utf-8?B?RElCSWNTNmtlU2FKUy9FUDBWUzhERnk5cWhJS0xzd0xZOHQ0ckZvcWluSk1M?=
 =?utf-8?B?eFlkVXR3dlBwYmQxRE1YYXQzOEluWGcwb2Npa1pwOVR6K2dEZUdlb1NVN0FX?=
 =?utf-8?B?M3JQNXE0QzA2dEptTXo5aHJBVFprVGxXc1p6MmhQalZ4a0tRUTZnVE5UNUp5?=
 =?utf-8?B?bXZhM1lxdFk5ZEIxZjErUStnV3pJcEJoTzVBWXE2eGVESjIzMGpSWGJPRTUz?=
 =?utf-8?B?RVlwYWt5OHZzT3FYczRyR3ozd3pJTTFCb2lBTXd2UlNVeENIekM2WnNDczNM?=
 =?utf-8?B?V1pmbHBzMks5aWRGUXNzN2ZkeUtmNlBSUmYySEJ6WitBSkM0MXBGQkFzUkVt?=
 =?utf-8?B?cUtkdG1mcXBpWUpHcXM1UVRRUTNDenpsbEVHZmJTNUNCTTlkSGZkbWhhTXZk?=
 =?utf-8?B?em9lOWc5QmJ1MytDZ01ZOHRDUVQ3L21Zc1FyRHplcDRhMEhGQzNXTFRjczd0?=
 =?utf-8?B?Rm5QdjhjNG1qNW9wdWlDWUMva0gxcXhScFFEYlc4YkErTnY1OXRYZ09FTklY?=
 =?utf-8?B?ajZxUkNVSHpHSU1PT1R6Z1ZHbkRqME9ucWcweWJwYUllMkVFRlcwVWlKeCtW?=
 =?utf-8?B?T3p6d21RN3ZGQTBTMWt0MmZSMFFxV1dhTWtwQW1md1EvS0Vyb3Q2emxUWEQv?=
 =?utf-8?B?d3Y3dmp2TVk3aFFub1E4b0NGQ1ZUK21ndWRrcVRIWVRWVHZ5dTBJVXJ0cEsx?=
 =?utf-8?B?RXlISTZZUUUxc1h0RVMxOG9vZTh1bzkvVWczVXZBZzY1Nmw1YmpodGlPdUJB?=
 =?utf-8?B?elFLMWlxd2FVN1BEcjk2N2M2NWw4YXZQVko2Y1lZYVgzenl0a1dkNzFUY095?=
 =?utf-8?B?bXUybHlWNDMyNmZ1NXhJblE0QS9NQktaVXZsTWdRR3daeHdlMkZvTGtJRFc3?=
 =?utf-8?B?Nzd6emVJRXNBZUMrQmdNYlJQUTgvckd3SlV3VGtLL2k1Y1I2LzdhK3FweUs3?=
 =?utf-8?B?dkE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d59bb090-f49b-4083-e78f-08de04f20062
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 16:04:16.9802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ni9Ek5mfqkvVcmhW3u57KckrqeXDHf+7V3YPMH7sjCEWW58ydA7Vx1HC4hHX8fYDTYM5cD7BgSNq8s/5lej2+gO8AYqEO23t7ogrp1v5Bzg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7095
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Oct 2025 16:04:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7658

Hi Antonin,

On 10/3/25 5:07 PM, Antonin Godard via lists.yoctoproject.org wrote:
> The script currently only installs the files necessary to build the
> docs. Since we also have the essential packages listed it can be useful
> to include them in the containers, at least to validate that these
> successfully install.
> 
> Add an env variable for including these packages in the container. The
> default is to not include these, so the current behavior is unchanged.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/tools/Containerfile.apt    |  4 ++++
>   documentation/tools/Containerfile.dnf    |  4 ++++
>   documentation/tools/Containerfile.zypper |  4 ++++
>   documentation/tools/build-docs-container | 17 +++++++++++++++++
>   4 files changed, 29 insertions(+)
> 
> diff --git a/documentation/tools/Containerfile.apt b/documentation/tools/Containerfile.apt
> index 5e30b65eb..a573786f0 100644
> --- a/documentation/tools/Containerfile.apt
> +++ b/documentation/tools/Containerfile.apt
> @@ -1,6 +1,8 @@
>   ARG ARG_FROM=debian:12 # default value to avoid warning
>   FROM $ARG_FROM
>   
> +ARG INCLUDE_ESSENTIAL_PACKAGES=0
> +ARG ESSENTIAL=ubuntu_essential.sh
>   ARG DOCS=ubuntu_docs.sh
>   ARG DOCS_PDF=ubuntu_docs_pdf.sh
>   
> @@ -8,12 +10,14 @@ ENV DEBIAN_FRONTEND=noninteractive
>   ARG TZ=Europe/Vienna
>   
>   # relative to the location of the dockerfile
> +COPY --chmod=777 ${ESSENTIAL} /temp/host_packages_essential.sh
>   COPY --chmod=777 ${DOCS} /temp/host_packages_docs.sh
>   COPY --chmod=777 ${DOCS_PDF} /temp/host_packages_docs_pdf.sh
>   
>   RUN ln -fs "/usr/share/zoneinfo/$TZ" /etc/localtime \
>    && apt-get update \
>    && apt-get install -y sudo \
> + && if [ "$INCLUDE_ESSENTIAL_PACKAGES" = "1" ]; then yes | /temp/host_packages_essential.sh; fi \
>    && yes | /temp/host_packages_docs.sh \
>    && yes | /temp/host_packages_docs_pdf.sh \
>    && apt-get --yes autoremove \
> diff --git a/documentation/tools/Containerfile.dnf b/documentation/tools/Containerfile.dnf
> index 3dae74445..65c526705 100644
> --- a/documentation/tools/Containerfile.dnf
> +++ b/documentation/tools/Containerfile.dnf
> @@ -1,17 +1,21 @@
>   ARG ARG_FROM=fedora:40 # default value to avoid warning
>   FROM $ARG_FROM
>   
> +ARG INCLUDE_ESSENTIAL_PACKAGES=0
> +ARG ESSENTIAL=fedora_essential.sh
>   ARG DOCS=fedora_docs.sh
>   ARG DOCS_PDF=fedora_docs_pdf.sh
>   ARG PIP3=pip3_docs.sh
>   
>   # relative to the location of the dockerfile
> +COPY --chmod=777 ${ESSENTIAL} /temp/host_packages_essential.sh
>   COPY --chmod=777 ${DOCS} /temp/host_packages_docs.sh
>   COPY --chmod=777 ${DOCS_PDF} /temp/host_packages_docs_pdf.sh
>   COPY --chmod=777 ${PIP3} /temp/pip3_docs.sh
>   
>   RUN dnf update -y \
>    && dnf install -y sudo \
> + && if [ "$INCLUDE_ESSENTIAL_PACKAGES" = "1" ]; then yes | /temp/host_packages_essential.sh; fi \
>    && yes | /temp/host_packages_docs.sh \
>    && yes | /temp/host_packages_docs_pdf.sh \
>    && yes | /temp/pip3_docs.sh \
> diff --git a/documentation/tools/Containerfile.zypper b/documentation/tools/Containerfile.zypper
> index f27ad1b47..3850b9ff9 100644
> --- a/documentation/tools/Containerfile.zypper
> +++ b/documentation/tools/Containerfile.zypper
> @@ -1,11 +1,14 @@
>   ARG ARG_FROM=opensuse/leap:15.4 # default value to avoid warning
>   FROM $ARG_FROM
>   
> +ARG INCLUDE_ESSENTIAL_PACKAGES=0
> +ARG ESSENTIAL=opensuse_essential.sh
>   ARG DOCS=opensuse_docs.sh
>   ARG DOCS_PDF=opensuse_docs_pdf.sh
>   ARG PIP3=pip3_docs.sh
>   
>   # relative to the location of the dockerfile
> +COPY --chmod=777 ${ESSENTIAL} /temp/host_packages_essential.sh
>   COPY --chmod=777 ${DOCS} /temp/host_packages_docs.sh
>   COPY --chmod=777 ${DOCS_PDF} /temp/host_packages_docs_pdf.sh
>   COPY --chmod=777 ${PIP3} /temp/pip3_docs.sh
> @@ -20,6 +23,7 @@ RUN for script in /temp/*.sh; do \
>   
>   RUN zypper update -y \
>    && zypper install -y sudo \
> + && if [ "$INCLUDE_ESSENTIAL_PACKAGES" = "1" ]; then yes | /temp/host_packages_essential.sh; fi \
>    && yes | /temp/host_packages_docs.sh \
>    && yes | /temp/host_packages_docs_pdf.sh \
>    && yes | /temp/pip3_docs.sh \
> diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
> index 6b4d42543..704731232 100755
> --- a/documentation/tools/build-docs-container
> +++ b/documentation/tools/build-docs-container
> @@ -24,6 +24,7 @@ SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
>   CONTAINERCMD=${CONTAINERCMD:-docker}
>   DOCS_DIR="$SCRIPT_DIR/../.."
>   SH_DIR="$SCRIPT_DIR/host_packages_scripts"
> +INCLUDE_ESSENTIAL_PACKAGES=${INCLUDE_ESSENTIAL_PACKAGES:-0}
>   
>   function usage()
>   {
> @@ -46,6 +47,16 @@ $0 OCI_IMAGE [make arguments...]
>      documentation/Makefile, see that file for what's supported. This is typically
>      intended to be used to provide specific make targets.
>      Default: publish
> +
> +   Environment variables:
> +
> +   - CONTAINERCMD can be set to 'docker' or 'podman' to select the
> +     container engine (default: 'docker').
> +
> +   - INCLUDE_ESSENTIAL_PACKAGES can be set to 0 or 1 to also include essential

s/0 or//

Otherwise the wording is a bit confusing.

> +     packages listed in documentation/tools/host_packages_scripts/*_essential.sh.
> +     This is not required to build the documentation but can be useful to validate
> +     the installation of packages listed in these files (default: 0).
>   "
>   }
>   
> @@ -81,6 +92,7 @@ main ()
>       # "debian:11"*|\
>       "debian:12"*)
>         containerfile=Containerfile.debian
> +      essential=ubuntu_essential.sh
>         docs=ubuntu_docs.sh
>         docs_pdf=ubuntu_docs_pdf.sh
>         ;;
> @@ -88,6 +100,7 @@ main ()
>       "fedora:39"*|\
>       "fedora:40"*)
>         containerfile=Containerfile.fedora
> +      essential=fedora_essential.sh
>         docs=fedora_docs.sh
>         docs_pdf=fedora_docs_pdf.sh
>         pip3=pip3_docs.sh
> @@ -114,6 +127,7 @@ main ()
>       # "leap:15.6"*)

Not in this git diff but it's in the tree, we now enabled leap:15.6 but 
we kept the comment, so either we shouldn't have added support for 
leap:15.6 to the docs because it doesn't work, or it works and then we 
should remove the comment.

I'm not convinced this is the right way of testing the essential 
packages but I see the benefit for now and have nothing better to 
suggest except building a separate container which will do a world build 
of bitbake + oe-core for all supported machines but that is a LOT to ask 
for a test :)

Cheers,
Quentin

