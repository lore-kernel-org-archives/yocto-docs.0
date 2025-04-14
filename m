Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA3BCC369B8
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 12:18:42 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.56])
 by mx.groups.io with SMTP id smtpd.web10.48446.1744633119455780826
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Apr 2025 05:18:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=YAoM6Atn;
 spf=pass (domain: cherry.de, ip: 52.101.66.56, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OlEaiT5d+nQ15aEbKHNlGq7OE1HtNIQtLt57v33NHLr7ZW1T/TG6mYkJ0MOylV2MDPbQp9YuLgY0I9ogoaXcbsHaJzJFXJGSZPTKdBA7Y5w67XQCnTi2VCcqFxZu2AXtPy9vxAPlbaarHBQ9YIoWrD1IWCkIFLRDk8DswTYfaoSNrTviH8xmgf3SlaxM336Jn2n0OYlLRFJXAtIW1fM1LENN/H0SxiRXhLXFPQfViWRR4BByq5PVAwdnYyRWNk3jCrcrJDjN8YUw/FlAuvyw4T/cAEwtKXuqgHqY7Fzz6GES2gKLQLzggfjyCuT2CNxijzn+3zlITd9BCk2seL8Anw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6vUm8W9Gf9/WlgiopQE/n9MwxIP4IM/q1NpzfGF1HV0=;
 b=dFJiTI1kARRf4H1fgtCTtL7jKGCHXE12f7NUSmxVWIokfhEQv2D9MYivwvuPhsj3kEbiVoE3bv7+dC6kYYDbjw3e7cn3lu2Yyy5D3m9IhdjV8KH4IXoEAA3tEjCZeQ4SSXAR7nmKlBrcCMZuQa/Sg7rWzxc0NrOHIniVPEkryQ3yPli+ShgbaRKctYv7AOnYof7imgY/ol5jVvg2JtoIfFJblXJX5vUzZbHPtP2fruANUtig8QEACVL87GQW7iRZtY8AmnfKFsSOnGvcdfg5HDHUMssEI1gKsUW+LBNJsOMq6LAuBc233vhSqfQgPti67TKvKwQQNuJdsIUu84GX4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6vUm8W9Gf9/WlgiopQE/n9MwxIP4IM/q1NpzfGF1HV0=;
 b=YAoM6AtnJ+72NveHlQR1qtZRKaNCuHa/+ZBbYNWVjyV6UxSlR9Cbdy2wmcJ17dXsJEO+EAapfQmkqWiWY/renRG05wNb78bW6aXL5OuchgFGtuKgUHqlWrjj+23un0QoCR8hxzOMnqmnYwRgocGf8w03llqHGqPb/oImQoAlrr8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI2PR04MB10977.eurprd04.prod.outlook.com (2603:10a6:800:271::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.29; Mon, 14 Apr
 2025 12:18:35 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 12:18:35 +0000
Message-ID: <e2d275ee-5657-4dc5-a831-1edb565f85f3@cherry.de>
Date: Mon, 14 Apr 2025 14:18:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 1/2] poky.yaml: introduce DISTRO_LATEST_TAG
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250409-fix-distro-dead-links-v1-0-616b62185d04@bootlin.com>
 <20250409-fix-distro-dead-links-v1-1-616b62185d04@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250409-fix-distro-dead-links-v1-1-616b62185d04@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR0P281CA0182.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::13) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI2PR04MB10977:EE_
X-MS-Office365-Filtering-Correlation-Id: 309ad961-7d8a-4682-5fbe-08dd7b4e7adf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Z2M2NnJUY2NmUWY3S1ByWjdHZFlVMG9wZ09EdG5sdnpQekNqakpla0x1NFlO?=
 =?utf-8?B?WmFEdWc3L2RTNXEyc1NETUg4RlhGNlUwVWJlS3JibDZ0NUxFc3FLbzBncTV6?=
 =?utf-8?B?emxkNnlHU2Y4MnZtZmxPcExtdVBWOGZPV2ZwMnhhKzBYeGtBN2tURDRmajl1?=
 =?utf-8?B?WmgxRnBiK1BXb2xaVEM4N3ZUakhTdE5ZMDlDdFFVNXVWQmlxYU1UTFFtaXdv?=
 =?utf-8?B?VGd1TXNvb3pJR0ExZ2s5RmhKVmp0bzJxNXFUdDAzR0dYSGl3ODQ1WmRuZVFr?=
 =?utf-8?B?a0U3VUlRcmI1SWhkcld0bFVERlhSWTh3MlJOT1ZERm5idHR5VDhrTFYza2xR?=
 =?utf-8?B?d1p5NHFjM2txSU9LeTVGVGpLMjB4K2NkM0JzN1JlbVZaWmM4N1RSbHZQT1gy?=
 =?utf-8?B?UWZGaXlIY0N0dStNN3RONzNsNjRCL3hIdzVsYlgwSWErUkVYYU8yRU03RE9F?=
 =?utf-8?B?bUs2WHR1ODRtR2tjOHpCUkxFMnpBYjNPYjV4MWlNMys2THpqNXhxSjFYckFi?=
 =?utf-8?B?dEl5dm02ZndYTVdHNU1iNng4L2FXL3NJcTFkR3lEVGY4bVdvbGNJc3VZNGRB?=
 =?utf-8?B?MCtFenc0NERrY083L1RQV0NlQXV0NVIwUlR1alJnK0ZEV0V5NXRKL2dTOEcv?=
 =?utf-8?B?bUJZKzNWZEREL1M3QlVvME9xbE5DTnQ1VTk0TFp2MWRtVW1kSmpjRjlMNWJ5?=
 =?utf-8?B?VWRKZzh5TFJOcC9NZmpmMnNCN0s5VjNvSUdhbWpqMGMreGFsVzF1QitBM2dT?=
 =?utf-8?B?SkpZYStqWVNHU0dhRmhvbUhYVTZpNnZyamlDdE55U1hlMFJkV3VFekt0dWpH?=
 =?utf-8?B?R2pZUWRTVjc1WGNKcGJBank4ZDg4SVlOUDd6RXVHNzJyQnNteU1wdmsxOXpy?=
 =?utf-8?B?VFlTd1l1TUlVZloxWXFLTHB2Z085S3ZNcjBkdnpDYnY1cEhYYWJqMTREVXA0?=
 =?utf-8?B?WHRsV1d1WDFiem5LNEwwOWYzV0NhZHVhWVh5aTB4bFFXcU9mWG9TVUxsakN3?=
 =?utf-8?B?K2huV2YyYzhYWmlrc094eTJqdDRiYzlCd0U1R2pERHhqR3I4UWlkM1hWVzhr?=
 =?utf-8?B?cDl5UFhnTW5CRmlhQ0paZ0xUY3VobzFwMVZLOTVyQmI3aTcrQXA0VFA2MFIw?=
 =?utf-8?B?enA1MXR5T3hUNnVlMXRHVitWa081Y1hPeW83aW0xZks0bndrTFNOWW04V2J1?=
 =?utf-8?B?Y0RKL3ZMVkh2SHRQUUJuVUtKMzJ4b1lBZGRGK29XK1Y0Y2hxWlpEbURqY3JI?=
 =?utf-8?B?dmhyNmVsQk5zc1lKMVRtZ1luRnJubk9vdTNJT1AzQ1N1MmlyUTB6OGUyZ2pm?=
 =?utf-8?B?VElOVDBGMno0ekdFQkh6ejgxeGNHV1UvMlhRNHJBS290UDIzbGdqUmtPZXJk?=
 =?utf-8?B?eW8yWGQ2eWJ3WmV3a2pUQ1g5c3o1RHBhNTVoVTJqVEZiMFdLNjZWR1dleTZn?=
 =?utf-8?B?NXU5WFI3V3RoNkwwdUNzZmUyaVk2VUZXRjdyeHAzRytxTTcyM3NQbncybk5q?=
 =?utf-8?B?U01MRHp3dlJuNytsK0VnZ2EzdVl4dkZmOEE0bkJSSjU3SjB5WklrSkFGNHB1?=
 =?utf-8?B?cUZGTlF2YUlLdnNSMWtoR3hMRThaNXJab0txNHhVSUFzTXI5M0xrVmd6ZE9L?=
 =?utf-8?B?aUZ3ckNUeTRUeXY1bFZkMmNVMnhLalFZWmRpQzh0NThuY0l1R01hZmViR0lq?=
 =?utf-8?B?SVF1NWRDcSs1VnZqNytwejlzQjIxLy9oQ21PVDZzUkhuRkFGWkNRN2NsUy9Z?=
 =?utf-8?B?bHg0bVZtUVpOQkNHZUgzdE5HNVJaV2tNNzZYQUszQVVmMWdvSTZiUHlmOExC?=
 =?utf-8?Q?kqN4cfuB0IAFkh7X6YLh6af9MtPl91HLh7tI4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YkhvaElZK2ZFNWhCY2M3eVRpSXBuOWo4Qno2bml0akNyTFBzVW5iV3FzNmNo?=
 =?utf-8?B?b0NFUkxSNDNBajM1QTE3M3dtNUlNbVd6eWRQeFdhUk5sMFpkWjFVaVNZM3N2?=
 =?utf-8?B?cXFiL2dsRVEwSlh4MUpOT2sxUVA0a29TSFg3eVdhY3I5SmxRZmxXWFUwT1Rp?=
 =?utf-8?B?SHdTRGx2REJXZE5lSG1RT1FpL21VQnQ5NGV0Y1ljamN0QzhzaXFESEUwTGhY?=
 =?utf-8?B?ZVVNYXQrUWVoRi81T3ZaeUZGVFZ6NjY1Q29SOUZiQ0FnZjZvOTBXUW5WZkVu?=
 =?utf-8?B?TnZyNTdhUnVsVmtrQy9GSENCZy9SdDhLeCtKdnVxcDNkUWprSzhrQTMwcFFv?=
 =?utf-8?B?blJTN3I5QXoyTFROeERicVdQZW80U3Q1MjJCZkxJYnRQUmVyYmRqZWEyTU9w?=
 =?utf-8?B?cHl3NHpzNy8wemVCVUpYQXl0MzhJRFQ5YlJRdDllUHp0SGZnekw2YmFhOVBJ?=
 =?utf-8?B?c09YSGV2SzAxeUtycEtBeHorZlNiQzRUeE14amkzenlaSlBlbVFUQWlwajlt?=
 =?utf-8?B?dHFpK1pla3kyU25sb2NKd3FjWjZSRDFBQVdQS2Q2UzhFcEFOSnIyUXpWdDhM?=
 =?utf-8?B?bmNiWTE1TlJiWmN1NUxhZ0VaMDVEbVhFZXgyVGRpdG1ZSjdjOTFTUEJ0VjF1?=
 =?utf-8?B?NWdWQlFZNmFERlFJckhHYXZCdmE3WW5NTGsvNzExcG1KZGoxU0xOdkI1YzRK?=
 =?utf-8?B?SVRMc0ZzK0VydlJTWlRlVytXdHBGL2NZODkzYnpJbU01MGNOUjkyenNVdHFZ?=
 =?utf-8?B?STNaaDhWS3U5V1BKUkpaRXlWVDFFRFZ6elJYWmgvOHY2WmpGUjNIdjV4UFRD?=
 =?utf-8?B?S0h1T3g4VEgwTVlyR0ErTXVDS2xWOFB0emt1VG9pYjZaem42aW91aFFsdTFC?=
 =?utf-8?B?L1RTalVHekZ5ZEJLTXdERDZETExibXhub0FjVmlBNzFGVk5qdGQ0OW95QWcv?=
 =?utf-8?B?Q3lKOHFjZlNhUzBMTWZ1d1pHSERSK0RLMStBNGprM3JLa1FtU2g5NU1yeG1J?=
 =?utf-8?B?bmZNb2k3Q29pK1BIWUJld2I5UXk4UVdYUG42QUtHWTl5czdiUmVLWVVnQVRO?=
 =?utf-8?B?NW80L1NMY2M4eUxyU1h6TVFYeCtiVDlUT0VqNFNIaU0wSGhucHY1c0dHNWxG?=
 =?utf-8?B?bjdYNFdJZUlxWjNXNmJFRUw0emdNd0FYNEl1WEhCak5hNVVCbnJHUEtHUW51?=
 =?utf-8?B?OGFyVVpFU3o2UGhSUGg4WXcvL1JzV3k3NEg1VUwwSXJHTUx3T1JhLzgwQWlh?=
 =?utf-8?B?bk5jMVVic2txVFJPeWc1T3p4b2twZytJY3Q3YUJCS3g2b2VVbEQxQ0pYUEJv?=
 =?utf-8?B?WUdrWmhrWGVCTFgrb08zWmthaDJ6VUtuOUlMVGxLaGxWcnpERE1SUWo1eWJw?=
 =?utf-8?B?enIvcGlhRUtLeXh3aDJUaUdpcFY1Ym1qeElYYjZuYnJCb1VIQzFRUEI0RDVY?=
 =?utf-8?B?eXVvVm5VemJHclVTTFh0aUM2Q2RzVmRvZnNTM3JQWFlSekVnTnVja1huZEN1?=
 =?utf-8?B?MHlsYkEwTkZPYU9UQzEzbjBZSGxaTXBuaTE3U3pFQkdGMWtTdDJYM2lQamdS?=
 =?utf-8?B?ZnhXa3BJQXlsOThic0JINVpFdUZ2ZzlhdE1GRWxmYnY4d28xUGgxTlYwZy9G?=
 =?utf-8?B?OVpWMitHNkNpamt1U0pRMGVSTThaUHliT0oyMVFaZGRLS3JmN05JUDRBV1h3?=
 =?utf-8?B?dWlHeVFsRzNhcStwWnptWnRIQithVDBUSkczWEN2TTE5WGFITnZLV3VmUmFV?=
 =?utf-8?B?U2plUGx2d3c3Z1lKbDNVN0xNQU1lTmFDR016Q2VvSHd0dXljVkxjcjVDZ0Y3?=
 =?utf-8?B?ZHFKZ3ZoMzU4b09qUWVUaDhXOUN3Mk81djRjOGc3eE1Uc2tQL3RJVGIxaUQ3?=
 =?utf-8?B?UUVVTTJvN1hwemYxbjAzWVROcjNtd0NSZllGRFR1NCtNWWtDVVpzVGlhck5B?=
 =?utf-8?B?QjQ0Nm93Vkhvd0hyV1hoZkRxNWxMcUhhVVcrK0FrQ3FtZ2M1Y0xCbXcwUndS?=
 =?utf-8?B?blR2S2J5U29JcHRNL21PcEtHWXloZVNYU2xlQnB3ejlGWmZTK2NKbitxT2Qz?=
 =?utf-8?B?TjlTMVRIbEZZWWJmdzg0L3g2ZStRZFY4TktUSEczVE5td3ovdTlXSjBLK0V0?=
 =?utf-8?B?bzNJTE54RTdBNFJWSlpiNlJlUE5wdnFLWmU2ZlM3UmYwdUFOTDdCQ0ZYczZK?=
 =?utf-8?B?Y1E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 309ad961-7d8a-4682-5fbe-08dd7b4e7adf
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 12:18:35.7072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sHfhL1TfkIMk0fcXz2rTrCLfgbFByFNg5fbf7SKd5MtCMa3jqEYps5wdbArBY66l+ROPxTVR6n1mkw8T+ck2OSdk5lK9I2BebOZ5SCSDfwQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10977
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 14 Apr 2025 12:18:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6741

Hi Antonin,

On 4/9/25 11:55 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Introduce the DISTRO_LATEST_TAG macro, which should always point to the
> latest existing tag in the documentation, unlike DISTRO which may point
> to A.B.999 to represent the tip of a branch.
> 
> This variable is needed to fix dead links in the documentation that
> currently use the DISTRO macro.
> 
> Also, make DISTRO_REL_TAG use the DISTRO macro directly, to avoid
> repetition, and add a DISTRO_REL_LATEST_TAG macro that has the same role
> as DISTRO_LATEST_TAG but with "yocto-" prepended to it.
> 
> In set_versions.py, run the "git describe --abbrev=0 --tags
> --match='yocto-*'" command to get the latest existing tag on the
> currently checked out commit. Fallback to ourversion in case we didn't
> find any.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/poky.yaml.in    | 11 ++++++++++-
>   documentation/set_versions.py | 16 +++++++++++++++-
>   2 files changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
> index 836f11454..26c21e346 100644
> --- a/documentation/poky.yaml.in
> +++ b/documentation/poky.yaml.in
> @@ -2,13 +2,22 @@
>   # Macros used in the documentation
>   #
>   
> +# The DISTRO variable represents the current docs version. It should be used
> +# when referring to the current docs version. See also DISTRO_LATEST_TAG.
>   DISTRO : "5.1"
> +# The DISTRO_LATEST_TAG represents the latest tag on the current branch. It
> +# should be used in HTTP link referring to the current docs version. In these
> +# cases, the DISTRO may point to A.B.999 which does not exist (just used to
> +# represent the latest HEAD revision on the branch). DISTRO_LATEST_TAG should
> +# always point to an existing tag.

I don't remember why/where we need A.B.999? I assume most shouldn't 
point at .999, ever?

Also, it would be nice to provide an example as to what is supposed to 
be stored in each variable based on a specific example.

e.g.

"""
# If building from master, e.g. commit 
3b50193fa0c9acf4a601aeae6e1c78d0e4a05aef
# DISTRO will be 5.2.999
# DISTRO_LATEST_TAG will be 5.1
#
# If building from a release branch, e.g. styhead (e.g. commit 
85e738e4c0e62f69699fff4bb0482ee3e3121496)
# DISTRO will be 5.1.999
# DISTRO_LATEST_TAG will be 5.1.4
#
# If building from a tag, e.g. yocto-5.1.4
# DISTRO will be 5.1.4
# DISTRO_LATEST_TAG will be 5.1.4
"""

Note that I haven't thoroughly checked the above is correct.

If that is correct, do we really want to return 5.1 for LATEST_TAG if 
building from master?

If you always want to return the latest tag for a release, it's a bit 
more involved. For example, I did the following for finding out the 
latest tag in TF-A, including lts branches:

"""
# Use most recent release, the latest annotated tag reachable from master
LAST_V_TAG=$(git describe --abbrev=0 --match "v?*.?*.?*")
# Find all tags from different branches that contain that latest tag 
reachable from master.
# This will return lts tags, of which we want to take the latest available.
# If no LTS tag, take the latest non-rc tag reachable from master.
LAST_LTS_TAG=$(git tag --sort -version:refname --contains "$LAST_V_TAG" 
'lts-v?*.?*.?*' | head -1)
TAG=${LAST_LTS_TAG:-$LAST_V_TAG}
"""

I assume we could something similar here.

> +DISTRO_LATEST_TAG : "5.1"
>   DISTRO_NAME_NO_CAP : "styhead"
>   DISTRO_NAME : "Styhead"
>   DISTRO_NAME_NO_CAP_MINUS_ONE : "scarthgap"
>   DISTRO_NAME_NO_CAP_LTS : "scarthgap"
>   YOCTO_DOC_VERSION : "5.1"
> -DISTRO_REL_TAG : "yocto-5.1"
> +DISTRO_REL_TAG : "yocto-$DISTRO;"

Separate patch for doing that (with the removal of it in the 
replacements dict in the python script).

> +DISTRO_REL_LATEST_TAG : "yocto-&DISTRO_LATEST_TAG;">   DOCCONF_VERSION : "dev"
>   BITBAKE_SERIES : ""
>   YOCTO_DL_URL : "https://downloads.yoctoproject.org/"
> diff --git a/documentation/set_versions.py b/documentation/set_versions.py
> index 5c55f470d..b94a7daad 100755
> --- a/documentation/set_versions.py
> +++ b/documentation/set_versions.py
> @@ -170,17 +170,29 @@ series = [k for k in release_series]
>   previousseries = series[series.index(ourseries)+1:] or [""]
>   lastlts = [k for k in previousseries if k in ltsseries] or "dunfell"
>   
> +latestreltag = subprocess.run(["git", "describe", "--abbrev=0", "--tags", "--match", "yocto-*"], capture_output=True, text=True).stdout
> +latestreltag = latestreltag.strip()
> +if latestreltag:
> +    if latestreltag.startswith("yocto-"):

This is guaranteed, because of how git describe --match works, no?

"""
        --match <pattern>
            Only consider tags matching the given glob(7) pattern
"""

So we can avoid the check.

> +        latesttag = latestreltag[6:]

You could use len("yocto-") instead of 6 to be more explicit then.

> +else:
> +    # fallback on the calculated version
> +    print("Did not find a tag with 'git describe', falling back to %s" % ourversion)
> +    latestreltag = "yocto-" + ourversion
> +    latesttag = ourversion
> +
>   print("Version calculated to be %s" % ourversion)
> +print("Latest release tag found is %s" % latestreltag)
>   print("Release series calculated to be %s" % ourseries)
>   
>   replacements = {
>       "DISTRO" : ourversion,
> +    "DISTRO_LATEST_TAG": latesttag,
>       "DISTRO_NAME_NO_CAP" : ourseries,
>       "DISTRO_NAME" : ourseries.capitalize(),
>       "DISTRO_NAME_NO_CAP_MINUS_ONE" : previousseries[0],
>       "DISTRO_NAME_NO_CAP_LTS" : lastlts[0],
>       "YOCTO_DOC_VERSION" : ourversion,
> -    "DISTRO_REL_TAG" : "yocto-" + ourversion,
>       "DOCCONF_VERSION" : docconfver,
>       "BITBAKE_SERIES" : bitbakeversion,
>   }
> @@ -318,3 +330,5 @@ with open('releases.rst', 'w') as f:
>               if tag == release_series[series] or tag.startswith('%s.' % release_series[series]):
>                   f.write('- :yocto_docs:`%s Documentation </%s>`\n' % (tag, tag))
>           f.write('\n')
> +
> +
> 

Not sure we need those two additional new lines?

Cheers,
Quentin

