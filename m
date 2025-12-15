Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ADCCD59D99
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 10:58:14 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45951.1765796288226834515
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Dec 2025 02:58:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=hhailzZ/;
 spf=pass (domain: cherry.de, ip: 52.101.69.9, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hwFnfJrktXGtyuRjYEUijlQdGLIxg3w4cH83F9BNwcRAnCEwT1dlo4tmDl8jDwG7qxVw211qTEhfz9wq+JFGmSouQPzPRypm3wve5xAc3qOnW4mr1fOIJTyJC3IcwHfEwap9aIYWOLJoBFV1Lw/Ut9lEZug9tD7+wSbzRts107vPbOesTfUMXF5m4wwLMRv81xEn/m2h7Wc4OkRCYTA1nRMDVhWbi1aQqx+LJCvep7+69SSq/B+5GFBU1OdHaKxZ4kl2bPGJpFESdC0czjHvtJBE+etKf3sl97XoddSUKq5kjqU4lanshI0G+05daT2ck7w1b0cngD9fSuYHdParYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P0dbNy/BG8Uy6VZUhMPRlOxVmJo+cJa8BR8/WRWJ/Cs=;
 b=AQNFGBqyNsXwAxz+fXRMmKZp5SMyQwKt4q5DOd8RoiKv0T3WxffXqo5GydpvuGMPFMvHP6OVHSftiSBPm1EeZs1rICCE3v0zWB9LEn5EvbnXILmh+wnYWJc4l0Ch4Ak3ZMxF8oM53iLTX9f9//uoljyrnG8yI0HTbmVKMrL7+fOBIxXezM4Gy4vox6wfhCU5EPZyTgmzPz+lJbsiSxkcBftx739TXgERhXzJ2M+0Shv6u57lgSxncaK4WHVfZvcV5uDvzzgXetAvpb71lrotUCo6v3QwOQ1oeSyxByVhA1Nc+RHfsXY9r+mQct/aZN3SDbUO/uK5EDeymCz1jRPp3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P0dbNy/BG8Uy6VZUhMPRlOxVmJo+cJa8BR8/WRWJ/Cs=;
 b=hhailzZ/IxDJI91j1HAqc9r7wNuCCVZKZvyRhK3/QZw5xiun/amvOpFNrJbS9A/I3owxQ2AUyc/RJDv6ylJqqGWmToAXznNZwO332mOw7Rnv8hzq/d+qR4i/wZBS8p8NCE25WJT0K6k70NCy7NkPOdAl4mY6mQQ46yXtCHxxbAY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AMDPR04MB11680.eurprd04.prod.outlook.com (2603:10a6:20b:71a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 10:58:03 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 10:58:03 +0000
Message-ID: <b3fedc48-fb69-451d-ab52-f170be87d013@cherry.de>
Date: Mon, 15 Dec 2025 11:58:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] convert SVGs to PDF and PNG using
 sphinxcontrib.rsvgconverter plugin
To: Quentin Schulz <foss+yocto@0leil.net>, docs@lists.yoctoproject.org
References: <20251202-fix-make-multi-target-v2-1-7eea1d64cf6b@cherry.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251202-fix-make-multi-target-v2-1-7eea1d64cf6b@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VI1PR09CA0133.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::17) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AMDPR04MB11680:EE_
X-MS-Office365-Filtering-Correlation-Id: f52c40f7-c023-4240-0f4d-08de3bc8d1c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bnA2UmttNDNYY0lrUUpNTktLY2VYWXFOUFRDL0tJcXVxV2tnZlpDTGdKb1hK?=
 =?utf-8?B?eTRTTlFBYWUveDJYTWhQS25LMU1UQzViL2xYZ1A4UWtnRG1KaTAvQ3lOTG1k?=
 =?utf-8?B?dmtCaFIreVZ1cGZpaEhBaGVnWlN1VjEyU0R2cUVqOW50bnJkZHVUellCNmhj?=
 =?utf-8?B?TWhnKzBJbHRrWW54d203TG5DdDVHNGhlQXBXZXFqUzgwRjFqNWQwYXYzc1ky?=
 =?utf-8?B?cUdpeVA0ZHZuWTlaZDd5S1dwcjZqSHMzOFJydXMvb3RtUmpELzJiMHFMdmdE?=
 =?utf-8?B?eHkvdFJwU044NVpxTEhOQ2ZCeFRRb1JnREhrc1puTG53VWNKY0RQNHNGZ1NU?=
 =?utf-8?B?WnJiNjYzT3FmTDVuWUwvRlVzTkh1SXZmcFBOS21GVWFiTjEwNnNnZEdvUE5S?=
 =?utf-8?B?VERmNVlOSTZTT24wODkvK0hkYmZRaUZmNkdhRnFPMURrZlFHUXpPQ2RWemxp?=
 =?utf-8?B?YlZ6WEJJSWJ3bVdESTV2VURBb2luUm9KdkRRelllMXB2Q3hMekJMUzliN3hC?=
 =?utf-8?B?TnFTeTFOeTRMS09CalVBZ29uQTRoZmp5N1hrNU5NN2NjeHVvRHFPVTZmTjBV?=
 =?utf-8?B?T0dqM2loL3JTY2NOTy9iM1JNZ1NBbVI2M09qa003LzVuQVRZVFM5alRudzR4?=
 =?utf-8?B?ZUN0LzY5NUtNbnBXcGFEekloUG9sZlNQVnNBMU9RNDUzMUdxcE1LaWVubXlh?=
 =?utf-8?B?VmdaMk5mWVZJcW1NMzdmM0xjb3pZcm1LV3lzNjNHRGsxYjBNZ1h6R1l5S29z?=
 =?utf-8?B?MmtESmtCVmZqWlg2MFRxVnkvZURPb05mbWhOMnZEQzZEM2dTdURUeUhtSHor?=
 =?utf-8?B?Umxycjg0MUZ6VWJwNHRuVG1FNVpzMXM2UmhkYW9KaEFaZ3phR2g0T2xIK1Nk?=
 =?utf-8?B?bTFyNzRJcU9EZGlFdTIxYVN6dFMrWjZySWpDcVFMNk54SzVIYnRKcjVCSHhK?=
 =?utf-8?B?RmJPcEt2Sm0wMHdLN3pLVTB1bERNNjNKU1QwT21zR1lsZk1QOUtWOXoyeUkr?=
 =?utf-8?B?ZzRiaGE2M1NDWlVjRUVoZ2loaDh6a3FDOWkrLytBWnlOQjI2ZER5aWtEU0JP?=
 =?utf-8?B?SU82S3ErSGc1Q1c1QXNHcVpSaHZ0cTdxVG1LSU9yMmt0OFpoUlNzSkxtWjQr?=
 =?utf-8?B?d3puMnllMXR6UGltcjQrTmdFa1V1bkVobmZCV1hpVkk3cUkxKzlmNkxFZGRp?=
 =?utf-8?B?VDBzQThQQVh3c201N0tyZUUrL3NMaDU5L0FsTktDYkFBaCtVRFhpb0FnWmZh?=
 =?utf-8?B?NnhOYllsaHhFYmVOMDNHaEpYTzVHK1NmK0tDRVVQaEpia3VKckJIeDBXSU15?=
 =?utf-8?B?S1doRnNmajh2MmZUUGNZNlF1WmFtVEp1cFJWTEl6dHk2Vis1ZHRkazNmMFo2?=
 =?utf-8?B?R3RWcEZoMWdkUGNSNmJkYjNFcEFyRlVrek1hUDhZbExFamVmVnJhRlRDcFhH?=
 =?utf-8?B?S0xLVW94UGRGaG8vUEo5ekJENWpPbUZBY3pjeEF2MlI1eGsrbGMwZTFpcXEz?=
 =?utf-8?B?a3Y3eG5lOGh4Vkt4TE9jNUxSUzFkTERBMDhPYXBCSC9vU2hlRE84SGNwVG1U?=
 =?utf-8?B?T1B6WEU3Rkt1bVZ6am0xMHlCblRURzRRQjNTVkVPWFFuTG1wT2J6bkJZNVVG?=
 =?utf-8?B?U3V4K3c1MmU5WFhRMHZvKzdFNU1naXltTEFpbTAweUhKaGpLR2lxbkMrK0tM?=
 =?utf-8?B?SHJqdDUyUmp5WWNLSWFwSkRHTFhYTjEzKyswYVdCSmJVWHRDOXRVM0p0SnJ3?=
 =?utf-8?B?eGhQL1dXZ1FNUkM5dXJLdDh5NjJlMFFwV0hJKzBjTC9xMDdYYlJCWVpSSnJ2?=
 =?utf-8?B?dVlybWFzVGd4M0RhZ1pjaXlrTGpYbjY5dnVkY1JNQ3ZJS2tuMlJ2QzkrMlB6?=
 =?utf-8?B?U1J1K0hYYkZkTkppR1VhRHorZE5PZVRNalJqRncrRU5Fc1E9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NTNhWGVDMXlHRzVDSlVmTnZWTzhqb2wxazRCWlgyVkRiSzVPT2NVWHdKc1Fo?=
 =?utf-8?B?YlJlc0NBdytqQURHa2RKd1QyYTdvRTEwbG02NzBhVm56YXZ3azRvWFl2VzVa?=
 =?utf-8?B?RlRraG9RQ0IwZlR3ZE55NGFHM1pjNFk4SGU2bndCZlhvdUtNMGJFcjdRdnNO?=
 =?utf-8?B?Z3owR1RrVkoyaWlPOEs5M0JpRWJ5V1hEMCthTFM5d3duZDJkc21aWnlXZE5D?=
 =?utf-8?B?ZkpVQnFGUk9qTkwvNUpCaGFtTlBzT1pMMUhZakE3a2orbForUGVaUjExWi9F?=
 =?utf-8?B?RkpSNGxpWHZ3Vnp3b0xqaXE4WmM1SXo4anZhTldvN0VFLy9seTRBWElXMUk0?=
 =?utf-8?B?ZHpOUFN5TTVNTFpVYWxHZ0VhVjdFTmsrTHBqbjF5YWUwbzAyRkpaWU1MMEo5?=
 =?utf-8?B?NWdQMjRiNUJ5aTFnc0JJNVh0dzRuMmZnRG1HUzVIL0llY1llYjRmWmw3U2M2?=
 =?utf-8?B?SWJOdFBXWkRObWdMV3JwbllPNmNmQWM0Y05xc3hoVU15WUprM2RQM25ZbFVP?=
 =?utf-8?B?elIvV3RZQllZdEg4ejVhVS9GckQrOXkwTFkxemFobnhWQVBMQ2NOOC9HTW5P?=
 =?utf-8?B?MjFEVG1idkNZQ3hCTkpyaXp5bHRvb0RyQmFka3NadkhYY1c2M1gzSytKQlFL?=
 =?utf-8?B?eENTTG9SQUpFb0czK3ZyTFZwSU1SeFlpMzYvR3pHaEtRK3RwZUpUK1huQnZH?=
 =?utf-8?B?c2ZNc2lxNmNEZmFVZ08vOVNkbE5CdTFhc0F2WVdlUVArTzlvTDF5U0REVUhE?=
 =?utf-8?B?NGljK1lEWXVmMndmNXNjang0YW16dmlZd3FaKzBaUnlZL0xGcnlDSUNRSmx5?=
 =?utf-8?B?MFBwWUtvTnJnQnhTTi9DODZvVnFpTWdPVk9tS01rK3FSTkpSb0NVMzBFaGtR?=
 =?utf-8?B?V0VidDBqU2NyZU9PRHNoazd6VlpXbmpCcitZbktQeDNtREhCRW1BVVRieVZI?=
 =?utf-8?B?UnFQM1dhYU4wV0tFakZDdkRwWithK081SU9jNGFOWmFXb2hoL0l0ZXB3eUxw?=
 =?utf-8?B?b1lBUkNwRTVwWW8vYkNlVlZOa1U2SnVxTFBiWlN1RlhuanpReDcrd2R2bUNN?=
 =?utf-8?B?OG5iR2owRkY0TklsSVQvWTI4S1Z3NXdCcVFYeGIvWVdtQTJXa1N0S1RZWmRh?=
 =?utf-8?B?WEViMFl5TzQxcmtJNDFIcFErTzdaUlZIcVZmTkErazhVVUlrVGsyRTBtMDd5?=
 =?utf-8?B?dDFwU1p5SW1CSVZXeXkzOHI1cjUwV1JvRHNHNU9tY2E3QUZ6U3NhVllMT0U1?=
 =?utf-8?B?eWxRYURXbTBKMDJpdy9oWDQ1UnMxOHZnVnpJWXFwaFdyWldFTWh5R093aFhI?=
 =?utf-8?B?WEpsK0F1YWNLaWZycXFPUUJJZTA1ckkvaDFNYm54eDNBTGw1V3RKTjc2RUVO?=
 =?utf-8?B?am5oT3N2c05WbmhmbEdmWjRZazhXRTBzT2hYNE1OQjJvNUVPZVVCZ1VneGRa?=
 =?utf-8?B?RzRxWUVOYklsUEx2aktXSE9jWWNCU2hWbUxSNmd6VHRIMHFtcjZiQjlYZW4r?=
 =?utf-8?B?MFF0VkVZVjVLemc1b1RuRjlrdHp5ZDluaGF2bWs4b2d1bDQrWDl1ejhHVVBM?=
 =?utf-8?B?dWxVa0djc1kvUTJldXFFZHJ5TndwcXpUVjlZdUZGVEFReVdBZm1oTE5kb094?=
 =?utf-8?B?cFljdW1mWGRaTHZrcFdkSTNMakdWdDJIeDBsd0JuaW5xaTRNTmxnZjcya1pQ?=
 =?utf-8?B?eVJ5V2RSWWxwMGVJd3p0OVF1N2JuaVBXQ1QvNWVJYm5HM01PRVdqbTlqQ3Zr?=
 =?utf-8?B?MmF1cjdoY2NCbThyUEhRUlRLWktlODdGU3JjVktnV1hpWmx4YkpOa1Frankv?=
 =?utf-8?B?NTZMNDI5S01maXNEMC8wMXh6YVVwSDg0a1lXZkFLZStKOVdJVGQrZmJvdzAx?=
 =?utf-8?B?b2RSK2tmbDFiVUQ5Q05PbGpxeS84M2VNdWtjSGoxRUhUZWRVcTIwTWdsWGVO?=
 =?utf-8?B?amdwYXp0NGp2WldhN2pZckk5aE1RZitGdkhJb0d2Z3NlVmFvdlU4Q0thWmNo?=
 =?utf-8?B?blhNWkRIbDlYRkoxemErSmtHT3NvK3gvRytDVE5sME9qdmJDak1Ub2ZENnVT?=
 =?utf-8?B?akRPYzkwMVNaN0grMHZEZlF1M29NZFpIV3NnL2hwNWRoSWRRbWN6cE1UbUlP?=
 =?utf-8?B?VnhKcU4vM0VKWHpSUU5jRUhYM1JxcW83NDc0Vzc1LzJGdTkzckNlMlR2QmpV?=
 =?utf-8?Q?yS3q6ZEseamRfrIYE6a3Xek=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f52c40f7-c023-4240-0f4d-08de3bc8d1c8
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 10:58:03.3273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XPYoxjLrOH23CsJRpuIG81X3jy6rYvSENCWCzknHv7gjD0ArWQ1cmAvSVMZ+7o0lLdteiNOOInX4NRMRiKWLsAQV+r3XGiI8l7q16ndN5uM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11680
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 15 Dec 2025 10:58:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8274

Hi Antonin,

On 12/2/25 6:06 PM, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> The sphinxcontrib.rsvgconverter plugin allows to generate a PDF or PNG
> from an SVG.
> This is what we already do manually via Make targets but it isn't good
> enough.
> 
> Sphinx generates a cache upon first parsing and stores it in a doctrees
> directory. Sphinx claims that it can be shared between all builders[1].
> For glob patterns in image or figure directives, Sphinx will look for
> all possible matches in the source tree and store those in a
> "candidates" map for each file, along with the associated mimetype. When
> building, Sphinx will then look in this map to try to find a match in
> the current builder's supported_image_types. If none is found, the build
> will fail.
> 
> The latexpdf (using the LaTeXBuilder) target does not support SVGs by
> default[2]. We used Make to generate PDFs from them before generating
> the doc PDF though (see PDFs variable and %.pdf in Makefile) and that
> type is supported by default[2].
> 
> The epub (via the Epub3Builder) target does support SVGs by default[3]
> but we disabled their support in commit ff3876ca4910 ("conf.py: use PNG
> first in EPUB output"). We used Make to generate PNGs from them before
> generating the doc epub though (see PNGs variable and %.png in Makefile)
> and that type is supported (c.f. Epub3Builder.supported_image_types in
> our conf.py).
> 
> The issue is that this is done transparently from Sphinx. When we
> generate the PDFs or PNGs variants of the SVGs, we put them in-tree
> directly along their source file. Then, when caching, Sphinx will find
> both the source file and the appropriate variant. However, the cache
> isn't updated if there are new files in the tree and the source rST
> files aren't modified. So, the cache will not have its map updated and
> we won't be able to find the new variant when building for a
> non-SVG-compatible builder. Take the following scenario:
> 
> - start from a clean source file (fresh clone or git clean -ffdx)
> - build the html target (which supports SVGs by default[4])
> - sphinx will find all the files in the source tree matching the glob
>    pattern in ".. image:: test.*", in our case only an SVG since the PDFs
>    and PNGs are only generated for the latexpdf and epub targets
>    respectively. The cache will only store the path to the SVG file
>    because it is the only source file that matches the glob,
> - attempt to build the epub target (which doesn't support SVGs, only
>    PNGs)
> - Sphinx checks for the file to include for '.. image:: test.*' and
>    finds an SVG in the cache map and then check the list of supported
>    image types for the Epub3Builder and find that it doesn't support
>    that. It cannot find anything satisfying the dependency and thus fails
>    to build.
> 
> This scenario can easily be reproduced by running the `make all` command
> since the html builder will be used first, then epub and finally
> latexpdf.
> 
> The `make publish` target works by chance, because the epub builder is
> built first and will cache SVG + PNG for each glob, then the latexpdf
> builder is built and supports PNGs so that's fine and then html, which
> supports SVG as well.
> 
> To fix this issue, we could simply always generate PDFs and PNGs of all
> SVGs in the source tree, but this isn't ideal.
> 
> Instead, let's use an ImageConverter from a Sphinx plugin. This allows
> to map a plugin as being able to generate a file of type Y from a file
> of type X. When Sphinx wants to build an image, it'll try to find the
> image with the type the current builder supports in the cache. If it
> cannot, it's going to try to find an ImageConverter plugin that is able
> to convert one of the image types in cache with one of the image types
> the current builder supports. Then Sphinx will call this plugin to
> generate the file and put it into the build directory (not in the
> source!).
> 
> This allows to simplify the Makefile as well and is a much cleaner
> approach.
> 
> The epub target is removed as the catch-all target contains the same
> instructions as the epub target we remove in this commit.
> 
> sphinxcontrib.rsvgconverter is a plugin from
> sphinxcontrib-svg2pdfconverter python module. SVGs to PNGs is only
> supported since 2.0.0.
> 
> [1] https://www.sphinx-doc.org/en/master/man/sphinx-build.html#cmdoption-sphinx-build-d
> [2] https://www.sphinx-doc.org/en/master/usage/builders/index.html#sphinx.builders.latex.LaTeXBuilder.supported_image_types
> [3] https://www.sphinx-doc.org/en/master/usage/builders/index.html#sphinx.builders.epub3.Epub3Builder.supported_image_types
> [4] https://www.sphinx-doc.org/en/master/usage/builders/index.html#sphinx.builders.html.StandaloneHTMLBuilder
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
> This depends on
> https://lore.kernel.org/openembedded-core/20251202-svg2pdf-v1-0-bf4bd322e528@cherry.de/
> in OE-Core for still being able to build the docs with the
> buildtools-docs-tarball SDK.

This has merged as far as I could tell, c.f. 
https://git.openembedded.org/openembedded-core/commit/meta/recipes-core/meta/buildtools-docs-tarball.bb?id=056686eaf1a3a27f5e83537e5a1b7c837bc16fb9 
so this can now be freely reviewed and/or merged, thanks!

Cheers,
Quentin

