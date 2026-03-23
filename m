Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9642BEC01BB
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 10:12:11 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.19])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13755.1774260722056454594
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Mar 2026 03:12:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=N+W+9wIP;
 spf=pass (domain: cherry.de, ip: 40.107.159.19, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D643ywvSPr+gXpg6KnGcRWfMXa6htcxN1eHJLU4JYYJbV3rOsx1/3P6tBdREg7ZBBXRCqN3AIJCEQFid4eYLqQzgRdkmGOkatMOiXkO1qOgwDD5CopBuPsMnqYrXIpuZ8n+gYoIR46nw1g8Tq/K9T5lUwtwX0JCkf3VdymFbpY3MRiZw76jnxo3nPxDAkLNliXFX0QLbjS+ESqrC3cwdi9Y++7CZ5HYA/mEKE0XbCC7b2MRyhcvslNNDibw36OEX7gPKAiLlG17UyHVifGbVRVMDA7eOnhjnXyveyUkCoYPz6Xln/f9nUTdEHqG4YGtdd91U3ZyzT0CZ6xwif1eEuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z26eoEpXmRfh4ciAe7seqgxXln+zBUNGyEtGpU9ndEw=;
 b=dxK2jMCCEX+INeeHU0I1fsHhyJ0jaPdvuNg4Ml1WZC7z3D1FinqItlJpuMx5OI2y4wIluAaGmryL8PX8FQ18+/xSjZBXTtYilhf+7M21R/q4K/QwU7QM2ZzWggcM6CD2SvPeLYqgxb2VYR4P+hpbaclFcwiv+33GDcI50CeiZdpv1RyGtAFS/+YgIo7TS0S0HcxBRwZyns4aNO3eAlW55FvTWZdaV4HL8CQDgf2bGnBG+ebI8mWEeihwRgqKqma45pDFVie/jMnqAG1yTfMBvip16FR2+UoF7XyHT7QGx/BRMUJ8EzyvLhcjfiH198/3f7Gc722t8CYaDg+2pJUd9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z26eoEpXmRfh4ciAe7seqgxXln+zBUNGyEtGpU9ndEw=;
 b=N+W+9wIPSu514ddYjpUUHHVQJDmjhwfY00Lc9QfTt2A8JXzZRx1k9Wfta/WPON1P3NVVfEyG616pk2MoOjaFv71kk+Et4YirSSYtkyBaF7zs1YuJ3yOr3IG5P0UH49A5eUs7pL0z7VhbgSu2oLOlWv2bJmCv8XIriGz54TiriUg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GV2PR04MB11798.eurprd04.prod.outlook.com (2603:10a6:150:2cd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Mon, 23 Mar
 2026 10:11:33 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9723.022; Mon, 23 Mar 2026
 10:11:47 +0000
Message-ID: <53f94991-74e8-438e-9bae-94884a44ae3f@cherry.de>
Date: Mon, 23 Mar 2026 11:11:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3 1/8] conf.py: define new
 {oecore,bitbake,meta_yocto}_rev roles
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260323-release-notes-6-0-v3-0-844ec702f95b@bootlin.com>
 <20260323-release-notes-6-0-v3-1-844ec702f95b@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260323-release-notes-6-0-v3-1-844ec702f95b@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: AS9P194CA0008.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::27) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GV2PR04MB11798:EE_
X-MS-Office365-Filtering-Correlation-Id: 05f25c9f-ae1b-467c-2bf9-08de88c497f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|7053199007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	rMwA55eSKU6fpAa5y8X5t/Dry/CDjX9mza1Ga1WLbrVIq5wjC43m4eaoQF+FuoqFiH2vamU8p7mxXJ5L7zRjFPUxMCVG/ysarsM/16O6JHRxS7RKrCt5U2568QaNo7X7zy2/L5cKWQ2/Ys41kMmRBWuAts1ctqjuhlE0nXuhCI7pC81KaOw4mqb7o9U/YI9i/X8oWrHEedt49pxNDdhcRD9x9xPkgrmNcFeAJuoVH9Rm/BU4aWiY1gJMGlm5wGq83L/eEbkVgBYOBZ3Ym85xJfspzTRekK7658aILglDAPj5lSbiAnwM1B4gj/1l2+tv7atLmZ7JBMhJTVAtqAFiqmw/kg8sg8qX4loxGfh+2WhWfbdnWhI2psxYb75ME5AtxIcYEv6bqWbW+P3KUwfl02UufcgAFRxPKYT6m5NkIIcGUjyc0HFJkNcdEPLfe7Eg3gFVgUVYCrxXJ3fMexiwS3IRxZefjNPAIsm3Qwf8g7/9N5nOtprTc/PWZIxQUIszA7NAWtp6ZAV2lFidSOONvoIwAuM7QtqxR7oH8AYjmYwVjyWrMAaJyH6aBTTU5wrlsnw+mr4pSu9dRDDtg2sweo/af5N7nuMyNQ/LFHlLQEHoCN/iQqnk6el6sE8P6cuGUZ+bk9+PKzlsmVQIQB437kxfJ5yxdDeZbraqxhJqACc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c0NqZ0Q2elFpRzRNaEpsRGxlVXorK3J5ZDI0cmlzNlRKdmZUdldDQ3R4T083?=
 =?utf-8?B?ekJYeHRlZ3VLb0U1eG9MTWkwcVZ2V1gxRUZJaEtHdEgyaG8vVmFkR3RZOWMr?=
 =?utf-8?B?bWVqTWhZT2U1U1JOMWo4TXc1ZnhEcHhWVG9hSDd5alRRRTRiMTRmVm1VTHJi?=
 =?utf-8?B?bGRSMjA2ellXK1lGR1BxVS8xZGxYaGhyL3VMUmVKbEJ2N3J6eWhSRUFmUGRX?=
 =?utf-8?B?bUlCVGxqL1VpWE5XajQ0aHFHZE8zU2FmTXVhWlV2TzhxcENxUGx1Y3VkaS9p?=
 =?utf-8?B?Q1ljdTdrb1ZLaGx0cFR4VHRqY3pYR1FadVJuNUhnbklRZzA5V1VQZXkwT290?=
 =?utf-8?B?WENBUDRrUk4zZUNXYUFFOHJqckFodkM5R1BxN0YzcTdiV3hDbDdhWThNWVdY?=
 =?utf-8?B?MVdCUS9FN001eVdiTjBQMm9YdnRQbDlSczVFcUtrNWZDWVNVTTRZQWtCVFAv?=
 =?utf-8?B?MkIwT2JGY2VvVkhUTjhhcTg0RHlUYTgwNTlGQ1VaQmRhNVJ4Um9HdFVYSDdK?=
 =?utf-8?B?VGp6byt1bVZzNzkxeHV2ejNPMjhGWkxOMjVJSmMwcUZBU3pzQTlpd0JwNlB6?=
 =?utf-8?B?THY4cUtGQzdZUHo0R05jREUzRXNhSmVDc3FkQ0pVZFUxVDJJMVdzSStjeXhs?=
 =?utf-8?B?VDdWZXBSY0xlcVhLZ2NLTWo5bEdGVW1POWdUNmE3VXhxU3g1cjNTTWNPSk82?=
 =?utf-8?B?VzkzemJ5N2FXOGFqOCsyZHNqdXk0QVFXRHJ1R3JXUnptZUtMd0EreDFTMGZo?=
 =?utf-8?B?YmxTRTFoakxoNXFVUkhtWXQrSCtqOStmcVN0MVgrdWhTTUpGM3lMQzBIYkxn?=
 =?utf-8?B?VkYzOXQwQnQ3dVp4U1hBakpYU1hJMVdKY3VqdUcrbTROSlFCY3hpdS8rQnpC?=
 =?utf-8?B?a21jdnpHNWFSOE42RjY0bzJPZmF0OXhtcmxINUlGV3lvNDAvVyt6TklzbzVh?=
 =?utf-8?B?VVduWFFiVXF5aHlHUDl6QjlKNDJxc3JQSUgxWC9LWHM4OFJVRktGYUlOeElY?=
 =?utf-8?B?RFl0YTJaWFMrYXJtQkdic0FxUitITjIydE9rQVp2bDY0SFdnUUNwQ2w0MWQ1?=
 =?utf-8?B?Vk5sWFpLdUdmbzhBR29qM1V1RkJQbUl3Z3ZOdXREdUk0a2I4dTNHK0VnZHl1?=
 =?utf-8?B?bzdRVFVIOHJaVkN5ckhJMlEyaGlPMkx0d1NVOGd0dWluNzZOQ3hpcjMrOWFm?=
 =?utf-8?B?aGEraC9XdEhMMWJvNWdJalVvYXlhaGlOWjZQOWlyN0lBY28wZlRRaEdJL0ov?=
 =?utf-8?B?WGZxVFFsNzJ4SnpqNDJyL3VmUVlzbUE1Q1lFQmVzWXVNSmFsVjFORks2QnE1?=
 =?utf-8?B?Sk0vUkhlS0VVKzZ0MFhmTmw3WjRvVko2aFhGMGtVaVExdm41TXZTS3ppT3RF?=
 =?utf-8?B?RDVYTCt3c2pPOHQ3bW1NQzg3NkJKblJ2djJtNTY1M0NnZ0s1cXAwdUpUclIx?=
 =?utf-8?B?MURBV1Q0TWplczI5QjMvbzA3eHV0NjRKQWFTb0VQUnlxVFZMd045VjJXRk1W?=
 =?utf-8?B?Sm1YZmF0akZ3cklEYWUzc0hSSVF6dlZnYzhaTGhOZjZuMkFUdXo0U0RMT2Vx?=
 =?utf-8?B?bkQyeElGajRyejVzSU42d3IzOHJuaUtjbHMrSE1kb2k1SVNvVWh0OCtKR3JM?=
 =?utf-8?B?N1J4U2w3bklQc25IdU01dS9RMEs5bk9hT3VQdlBpMm5QeEtma01EaFVtQ3dI?=
 =?utf-8?B?ZlJKSTl3ajYzQWxWWXoxenFBbUlLa1BFVGw3RTROalljZWR1bFNnT1N4ZE93?=
 =?utf-8?B?OGJpS3BjRm5Bd1psbE4vN1pjV0RPRW1EL0c1b0tZNWlVWGtSS1BMNEpCWEE2?=
 =?utf-8?B?ay9JRVByeUF5WnJBR1VSR0Ztc0ExVmZUZFJ0amJtcVNtOVFGZkdLYWwzdUxB?=
 =?utf-8?B?TXM0dTRHT1ZNR0hPTnV1T0NDcSt4dzYzQUgramphcUJ0OTRiVi9OT0JBTlVG?=
 =?utf-8?B?NE9ZUEFHMVRRcnVXcU9NcWZCVXFBK2pwZUJPeU1UMEZsejFvc2cwd0FGcFFM?=
 =?utf-8?B?NDBQZ21WMUVRM2FIMGRSOGxrUHNhQzBIODdyU1Q5ZkwvQ21IbTh2M251S3Jh?=
 =?utf-8?B?V2RDTnZ2UWU2SVlubDFkcm5JSUlkZEhDWUtBVnQvSVcwNWhHMVJicTl6VStp?=
 =?utf-8?B?WCsrdkJrSFk0OHhMbVFOMzRRTUFVWEJpbkhaazYvTlBicW5YbmpXUFFJdDN4?=
 =?utf-8?B?MEZmLzNyMmpacG5FbUFPZ1k3bXhGd2t1d29jaE8ydGxtS1RGd3M0V0JGSFBz?=
 =?utf-8?B?M3I0bCtjOElzMVZkZW1CWXBiQXlYaTRiQ0pqV24vN0I1ZEYrSGp0dmU3NXdV?=
 =?utf-8?B?UVIvTThuRGNFcDF0VnBqSVEzOU5sVkJmbVd3NnVUaCtWTitoQ1ozZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 05f25c9f-ae1b-467c-2bf9-08de88c497f8
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 10:11:47.8847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g65RAL0ljUMNlQyGufB9gpNmpW8mYqzv35qCxQJ/I9mMlu68AKqp+YAFYyWfaOyoIThePuv0qBdZlha2a68X9QnlHhYSiRbnK7FsSlXJ6rg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11798
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Mar 2026 10:12:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9123

Hi Antonin,

On 3/23/26 9:49 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Use the extlinks extension to create new roles to quickly reference a
> commit from openembedded-core, bitbake, or meta-yocto.
> 
> For example, use as: :oecore_rev:`437e0419608e`.
> 

No, please use the full git sha. The link caption will have the reduced 
sha when generated by Sphinx. This may be something we want to add to 
the standard.md for example?

At least, don't give incorrect instructions in the commit log :)



> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/conf.py | 16 +++++++++++++---
>   1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/documentation/conf.py b/documentation/conf.py
> index 5a69977cf..31fa8346d 100644
> --- a/documentation/conf.py
> +++ b/documentation/conf.py
> @@ -91,9 +91,17 @@ rst_prolog = """
>   .. |author| replace:: %s
>   """ % (project, copyright, author)
>   
> +# base url definitions
> +oe_git_server = "https://git.openembedded.org/"
> +oecore_git = f"{oe_git_server}/openembedded-core"
> +bitbake_git = f"{oe_git_server}/bitbake"
> +yocto_git_server = "https://git.yoctoproject.org/"
> +meta_yocto = f"{yocto_git_server}/meta-yocto"

For consistency, maybe name this meta_yocto_git?

With the change in the commit log,

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

