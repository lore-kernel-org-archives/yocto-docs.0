Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A3F6CCD1A5
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 11:15:40 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.0])
 by mx.groups.io with SMTP id smtpd.web10.7579.1761304531433286012
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 04:15:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=mciBCbUw;
 spf=pass (domain: cherry.de, ip: 52.101.83.0, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fn9b9q5XU93TDTP8Yk5a5lSfWjFq2qHSp/QwHoIYKsFoYzbYkrUih4BygESNeoUUFe34sAz5FtKJljzzSCIR0obrcrvpUXKJI3G+J3Tnoy+hfqEE0o0sCX7pz7QLsfnpWlR4xpGNT0sUa/BIWwRSuoyWLHomk5zUSulprpOVx8YiHq8AY6dK2kGZeGU5IdiRrkc9gdUMGyTsisuShRsWtT2meZJxFBP65R9Q5oXuc1UvVcwhogkcyUg6r/ImEGStRT1huFM69MFJnFSet32jViGx4PGl7u80avUC8PG2p9oaijzQxT17UbIExn+5pKkNvEUuG+aTjkeozeLYXvT2ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qjM6TRlXUgzatfvHM3groI/7/yQxryC3jSb6Rnj/MWY=;
 b=qTDzd7KFpLstwDaPTMNgHRXYeWlvskMoeIYSFC6yhCIhl8B7cmEjhcD0RA2OoxBrfmFchG95qWpOPpO+jlIWHmt1HpvQ97I0pTd1BSWjJ7CiyfTElJlhpaKqw39pSiIiGSOt+SvDVWNn/63dx7eiVzO/VvrRukMuygXDd8Q2C8+BBVXfSoYyGImfTeY/yQV1J0tuwiLuAhmO11DXGcBbEL+W8C6m8DErCtw7b6YAb2n1DUeRlJozfpOuEPhmTtVseK5yWtfooW4jarEiYxsh+5Ii97zEEkalVQJDLA0MGC8aPisZcL+D6vTVcn1Dcs3tvrokQv9l8nQPRHn2hvCkcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qjM6TRlXUgzatfvHM3groI/7/yQxryC3jSb6Rnj/MWY=;
 b=mciBCbUwJBu7tjQEVBRTNPuAE0ma1DamDVFnJzfp0HFH+tdtrTaP/VjSi3X1mVeG/xOnKQQvklv1p9DRO/aUeIcBpxCobmB43m2B7egI91gbTI40qPlAmCetrl5RE4iAcXia9jl7G+UA/V6y9ouAPSNC0814GbcNlHAgL+Bceuk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU4PR04MB10695.eurprd04.prod.outlook.com (2603:10a6:10:580::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 11:15:26 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 11:15:26 +0000
Message-ID: <213f45ef-54dc-459a-9f0e-bd92aa3e1795@cherry.de>
Date: Fri, 24 Oct 2025 13:15:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] overview-manual/yp-intro.rst: update on-target
 packaging info
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <f94df486-b32b-d301-fc6b-b1a5d560298a@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <f94df486-b32b-d301-fc6b-b1a5d560298a@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0160.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::14) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU4PR04MB10695:EE_
X-MS-Office365-Filtering-Correlation-Id: 56317808-8282-40e3-f003-08de12eea229
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RDUwN0E1QmZSQVR1SDhlQjNuTG5vQzJuOGliR2gyYWt5QVRZTVlGQUJEZm5i?=
 =?utf-8?B?Wnd4VmY3TTZhTUhFNjBmQVNPdmJmZDdGNDRya0pvb3UxMjRmOEx2UHlZWUxF?=
 =?utf-8?B?bzRXTWoxbndMQTA0dUhrT1M3TE9HVE5aUlNDdkYxc2RVSkdkR21IUENKWU1u?=
 =?utf-8?B?OGpCdlV2Uk9VNTNtV0Q2VHNEUkRDUHNJbWt6ajNGeGtjSTJ3N1Y4RHdnd25O?=
 =?utf-8?B?bUxlbHRVV1ViK1BIRUNLSTdzcFRDOFVmM201V1MxMUs2Ym5lZXRTRHVpS1Bx?=
 =?utf-8?B?bzZ2SksreGt1ejJ6NHJ6MVhVbDNkb29VNzZISVRLb2ExWXdoZ2Jld0VYU0Nu?=
 =?utf-8?B?MnJqclRDWXJKbnRKbTVyYWZPMWJJZStpd3RNeDcwV24xcFRkTzhubEIxVzlH?=
 =?utf-8?B?cnA3aGMvSTRCSUdqekk0clB3NUE2VDlUSEZZemJKUUl1aHF3eUkzUEczZUI2?=
 =?utf-8?B?QmF5cFUzd0VqYkphcjhVa1AxVys5UEN3bTlwRzVmMmJ1NnJwZTZ6NHBYL1I0?=
 =?utf-8?B?UklCZjdrMWF0WkdITkh2ZVBpR0Q0WXdSVlhzc0N0ODVMaUQxaHl1RUlJY1Fw?=
 =?utf-8?B?WmdhYllELy9lMm1mVWcwZUdtY1dmSlNMYmNMaWRmVW1ib0grcjJjOUIvMFBv?=
 =?utf-8?B?ZlBvdzVHTHAyZkdUbG0ydGlTQkxmeFlpUG5UT21iRENXV2E1UCswUFRyRmxO?=
 =?utf-8?B?TVA4SWhkaXdLWDhONmErSFNNd1hJVm5VZUxockUvd3dCSUp3KzV2ekVTYTFJ?=
 =?utf-8?B?cUZLK1doWlYzVEpHSm5rN2ExS0trUWd4YUM1QXgwaDJrOVg1elVoZGtIbzlP?=
 =?utf-8?B?UWZieVc5MmV6b0N2Z0hIRWpBVG93MTlzU0FQd3F6Ti91Titsa2gvSysrVEto?=
 =?utf-8?B?eGxsaHJCUXYzZlNYSlRLMmU2eXFYdWp4U1hTNWo2WDVRS1B0eTNmajJxK1BI?=
 =?utf-8?B?VmJidllDTzh4U0p6WkZPRE5Ocm9rUEtsVjNxckU3dTMwckYzcXZkcjBlWWho?=
 =?utf-8?B?NllYMGMwbmtDRmJqUHBlQ2VrcWhRK2pHTjE4ZGlOK3pOUjZ6MDJMamV4L3pp?=
 =?utf-8?B?eG9pUHpjaUlFS2ZCMEJ1S1FVNnI0VFlSaERXR3dGZEN1dDlMQVA5Y2tMdVRV?=
 =?utf-8?B?cDdISktGck15d0UwQVhnYkdkTDZjbUh3Z0RGUHVyWHVwZGFlUEhuMlNDZzBy?=
 =?utf-8?B?S2MyVWczTjVoZDFhYlMxWmZEQ0tpS0c3S01WYlp5NDd2T056eStQc283cDJw?=
 =?utf-8?B?aFkybGJkMCs1TFZiNXJ1MmtCblUzRU4zOTFlU2hVTFFkSWgyelFmOEV5NTQ0?=
 =?utf-8?B?d3A5dk1BSitUYjB3N2JqamUwcFRaYzNwc0xyQy8zN2tMRUszdXQ1VEMrSzRB?=
 =?utf-8?B?OTZmeWhwZmRWOHprNlNVVWVnVmZ5MnV2TU9PaVJ6OE5IdFp6blk2Z0Y0cktW?=
 =?utf-8?B?QTZmQlk1aTA2QTJOdlNheTZoeXI5MjhUSmh5UHI1YTBNV01TM3ljbVlYbTVH?=
 =?utf-8?B?LzE2a3J3VC9IbU1oODg5SnJxOEUvbVRBRkdwRy9tRkZ4WW5NN2UvZFZURmQ4?=
 =?utf-8?B?Rm0zODNxK2c2QmpVR1ZKelJnajZMMmsxYVl4TiszMXZkM1dKVjBSMFZpTFhv?=
 =?utf-8?B?OVBzWnliRklZODJDZGV4ZHZnQ25ncWxuc1JTUytEZmFzUUpRQXR0WkF1Q2tW?=
 =?utf-8?B?bkdKV3dRRTRIajNlT0d0TWFWd29vVjRRclVCSTlYcGkwVDVNYlNsYXFEVkMx?=
 =?utf-8?B?YTNuQnZxWFJITWhtOEtrZXh3TFJ2N3IxcTRrakhvbm1nb1dUT0NYekZCTmhs?=
 =?utf-8?B?NUtlWmkyem91QWFWWmdTTjNZQzk1QzFkNU5xc3c4eEhJSzJ3OEs5TmhVbU1B?=
 =?utf-8?B?UGp0R2NpS1FzemU3ZG9GTlVzYVNmdVlOd0JQQlRqb1ZXV0VLcnJjR1FDazRQ?=
 =?utf-8?Q?sUJ0p6DE7JLvl/Vv0E85c9yV1tUq78/Z?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TUNlVENWZytXRlBDNmtMWC9RL0FmVzFnMll3dExoQ01jNDVLTEIxS0ViYkpj?=
 =?utf-8?B?NlNhdW1WZkdOOUlMc0ttbFZLbTl3ekhSREVWMU9QSy9FTHJQWnVucW1WaFZh?=
 =?utf-8?B?R1pveXU4dWdlRVZ2cVpTNFpjWW1XNW1wcGQ3NlRzL0ppMzhPdTRvK1ZJSXE0?=
 =?utf-8?B?eFEyWGY3cEliSGVSbHRRcUJYSGtRVUxXVW5IMkZJNzRkeWM0cnIyNXlLZDRs?=
 =?utf-8?B?S0NIckQzRGg2MnI2UHBwdU8wWTdyYmpBT0VkRUhLL0Q5VytXTk5KRWtobStv?=
 =?utf-8?B?Y2hmcVM2eVQ3TDdDd0ZUdnNLREtXWEhRbGJnYlRWQXZsM0xKMXU5RzYwZ1Va?=
 =?utf-8?B?NkNSc3hwTmtXN2VjUzZRWkhUakdEUkUyUUpKRkE1c3JtSUZCeHJLTndyT3dj?=
 =?utf-8?B?d0QxS215MWJRWUNUWFZYQkJkTGdzTW44NG40ZEpEQmNNUGhFV2Q4QzFaczRk?=
 =?utf-8?B?Y3FVZWxCOFo5bVhtdUpEMFJKNXZScTEwQ3JIblpUNU9ETURvTC9vbmo3MkVH?=
 =?utf-8?B?NXhTeDVaSEkzQlQzNHdFK2JleTl4NytiNEQxM2xvVUkwRWRJYUJIcHgyT0FO?=
 =?utf-8?B?d2lWWGRWM05HZ2o2RCsvYzRNYUtHSkFyRlptQ1YwMStsQ3RpeHBsb1RtekNq?=
 =?utf-8?B?bXB6UklabzdvVzBvN25JNmszTkl0dkpnWVlKUUROWTJEMU9OajJhZktNVnhW?=
 =?utf-8?B?ZEtmYXdjVkRvbmM0Tk45dllKNDRxRm1WMGdneTdHNzFZNTFLSld6K280RmtQ?=
 =?utf-8?B?ZUM1cHJqdHkxQkpQK2g2Sjh5Z214YWNmUVFqSS9HbGZkZzJITVhlUTZpLzIv?=
 =?utf-8?B?YVRuaE9OUTJxcVR6Y3N0bXV0RTJEUEtZcVJBVCs1ZW1wWHBqNFV2bFI3Vlpv?=
 =?utf-8?B?aHJZV0lYclQ2c1lIQy8xK0xRWnpybGdVQVhBNzFoU2VaWXdGMFUrNlBNdXB6?=
 =?utf-8?B?MlVkZXhiNXpVTFlJMWNHZXp2dDdTU010ZGM2UUFBb0lsOTVyQUZTWU9ZNTA4?=
 =?utf-8?B?TkpMbWYrSG1XQUFMUi93ZENqK200NWhrOXJmNUZPaEoweStINEdmb2xtUkhN?=
 =?utf-8?B?dy93MUxabWhmYWxnNk5rb3dVM0dVQWV4VWlSWlN0ZUFPRVJJSWdRcndQbFBU?=
 =?utf-8?B?U2hpRTVOcDFrSVRIR2ZneVlDWkN3ZzhwV1pmenhJMVlLenFXZlJDRVdDQzJi?=
 =?utf-8?B?bE9NYVByQS9YV1FEV0ZXS0YvZ1dJem9pMFVHelRsalJ1V3MwWGpuQU5VdStL?=
 =?utf-8?B?c0NtN0FEdHVpOStPN1k2V1dncFRpSEZzRWNVbnhKTlhOeW1qSWpUUUYzZWU0?=
 =?utf-8?B?a1J3a2FwdnJkZm1tZzJHVGxXdXNQSUhkUFhwRUV6OEsvVzdPQVhJeHdDbjVX?=
 =?utf-8?B?bFlhMTE1dm9rUjVNMGEyQXczaUxXVjgwWlo5ejhPZFAvZ1ptS2FRUHYrd2Ns?=
 =?utf-8?B?MUtYc0w5Qm5sTWU4QWlaL2Y5WE9XSE5CcWo5UWs2SU9FSnRZZTU1M2hZbFNB?=
 =?utf-8?B?ZmdpS0hwODJ0SEtDL2RQWlVSUzh1WjIyVmZidTdIZ3hlT2tySVQ3dy92QnV4?=
 =?utf-8?B?OGhWU0NPS2xTS1lkWXVld0ljSWdKTExFOUtId2lKUHlUNi9TMXhtcjdDM0JL?=
 =?utf-8?B?Rk1OdGl6RnR1U3lKcnpvMlA4bDJhUElXTkxjSFR0cUw1NHc4NlpuUWQ2bmZq?=
 =?utf-8?B?TVRLT1JlSmg0MkI5SSt4aEJaMWFRSWkxK1JKdGhrTFV0MUxybDJicmVFL1ZN?=
 =?utf-8?B?MDlXdmZ4WVBGZmpWNWl5Rnl1OEtWL2VUZHpMakZ4OHdWR1EwUk5Qa2J4eDBt?=
 =?utf-8?B?MkxzLzM1RTdlYjZQTTE2d2J6SjNBalhyeURZU3RheGttV3RMalFUWjhLV2NU?=
 =?utf-8?B?YjZleEVEUjBWVWpEK013R1YyL0Z1dHh4TlJFQTdxUXJaV09wa3dJN3BUR29v?=
 =?utf-8?B?QnRtNDlKaXVhNzNuYmlCQ2N5YWxJclg3TENla096TVpDc2tPa3UzNkdnWDNF?=
 =?utf-8?B?TDlZVkJiRUthS2NIYjJPbnUwWmx6SzZsRkhQWC84OXExVkZmSm9mS0NRcTlZ?=
 =?utf-8?B?VEF0aE9CajdJSlN1YmJrSzlQMGVpRmNnbEhHTGlQYUthM2t5WlhGakZvMEFj?=
 =?utf-8?B?TUlBTGIvalJQeHFhcEpTYmFlUzJwUUdQaFZjUnpiYm5aZG9BdGl5c1FJbkdn?=
 =?utf-8?B?V3c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 56317808-8282-40e3-f003-08de12eea229
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 11:15:26.7244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b3T7kdKVWZfk199bVorxp1ElT9o70Onzy+VJI7SGp7RABNBZkl06n8ri/lUZXv51BQdLwtTWTfnXShZeXbi7N9ys40cI/LMharT5R6LRMHE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10695
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 11:15:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7814

Hi Robert,

On 10/24/25 12:55 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
>    - drop references to obsolete tar packaging format
>    - add reference to on-target "apt" utility for .deb packaging
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> ---
> 
> diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
> index 8fa17b191..ed50aff93 100644
> --- a/documentation/overview-manual/yp-intro.rst
> +++ b/documentation/overview-manual/yp-intro.rst
> @@ -174,11 +174,11 @@ Here are challenges you might encounter when developing using the Yocto Project:
>      changes on the development system within the BitBake environment and
>      then deploying only the updated packages to the target.
> 
> -   The Yocto Project :term:`OpenEmbedded Build System`
> -   produces packages
> -   in standard formats (i.e. RPM, DEB, IPK, and TAR). You can deploy
> -   these packages into the running system on the target by using
> -   utilities on the target such as ``rpm`` or ``ipk``.
> +   The Yocto Project :term:`OpenEmbedded Build System` produces packages
> +   in standard formats (i.e. RPM, DEB and/or IPK). If you included the
> +   "package management" feature in your image, you can deploy

The feature is technically called package-management (with a dash). The 
use of quotes imply (to me) that this is the name of the feature to 
select in YP/OE-Core but that's not the case. When not used to refer to 
the exact string to be put in IMAGE_FEATURES, we currently do not use 
the quotes (and sometimes also add runtime as first word). SO pick one 
or the other?

> +   these packages into the running system on the target by using the
> +   corresponding utilities on the target such as ``rpm``, ``apt`` or ``opkg``.
> 

The tools seem to be dpkg+apt for deb, rpm+dnf for rpm and opkg for ipk, 
c.f. ROOTFS_PKGMANAGE variable. But I guess since we use "such as" in 
the sentence we don't expect to least every possible package manager.

Looks good to me otherwise,

Thanks!
Quentin

