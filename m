Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35525CA0FED
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 13:59:54 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.70])
 by mx.groups.io with SMTP id smtpd.web11.14157.1757426389723059960
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Sep 2025 06:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=L2uHgOGE;
 spf=pass (domain: cherry.de, ip: 52.101.65.70, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UbtNdffIh0eYQu95y0TFxTtouVL3rLHDQUveYyqDnNQarVjwKpDFILKAzAAtkXgeLMCXskQ9s7qIJ+pHok1rJrnOQyr54FWPL6WVue7NkiZUE2vb4zzzpIDixVS6EvL49h0I6Li2nfXxnWUSnKhiR5CtNhPqqi4cyWJpprcigBoNHZXFiFnQRlUui1xqOIzS4gx9wQdmiJblpZAD8ScNkRVGYy8JMNk44kcK1r8tppVGabjubGQcCawwAO2KTrbkhNx+YiEFWgc2AIWpw6DwmIHWxIyfJcTkOCspExSl9e0Vi+0IPg67ks9aEKjK6F9VF+BQurpBa6/tOcKxqpiPfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qeijOiqavBArUw2ImGUZJ/IUUGf5ouNIqVRAkna/bqo=;
 b=LlylnR6R3Es3VaDMIa07pAGK3KLs7SCVWpAdqKcKWRAulLBAiePNkV7H8Wq074qZdYZYRUX6/dI9Hfej51BKp20Q9nn9At/vCO9uuhpN3bKb+HPXLQ1P1uiHSIpv8ekNCxZtMESO1nTVTFBlw7Yny5xt4GRk9hG/5b9XkhNQd+ZicvW+23kcvdnyYMmcIsB1scZDQmV/p/9Ja8b1BXS1lcoEV46F5zoL6CjxQFaxtGdfQcnosEd1c6vjCZ06rOld4/evvyc5h9YY52TdhjJn9u9GXSdz/TzdGojypCF+VyVsaSFCCr7gZPRvrnwKz9aJvlOQqFcLHsFrpnjiObeGZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qeijOiqavBArUw2ImGUZJ/IUUGf5ouNIqVRAkna/bqo=;
 b=L2uHgOGE6zM808r+nUhjRLXbiMzeiOXegWuX23PXQLIPHVvoFnfZNsTNCS7/vzO7Sdl5qWnzL7EzvcsD/4xTKhIQXPBN5yt3+OFv6XDhQgaV3T82lB4ls3H3AhpmEa/2t8J0MuIzbtZRxW9UHwOWPYKjYQ7QxIFnGB4pc1imJN4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DBBPR04MB7978.eurprd04.prod.outlook.com (2603:10a6:10:1e9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.15; Tue, 9 Sep
 2025 13:59:41 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9115.010; Tue, 9 Sep 2025
 13:59:40 +0000
Message-ID: <890a75e3-89f3-4d74-b0f2-415f739ea227@cherry.de>
Date: Tue, 9 Sep 2025 15:59:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] migration-guides/migration-5.3.rst: add note on
 systemd pni-names change
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Koen Kooi <koen.kooi@oss.qualcomm.com>, Ross Burton <Ross.Burton@arm.com>
References: <20250909-systemd-pni-names-v1-1-efb2fef7aaf8@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250909-systemd-pni-names-v1-1-efb2fef7aaf8@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR0P281CA0108.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::8) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DBBPR04MB7978:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fd596a2-f943-4009-0750-08ddefa91ee6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RzA5ZnZlbTdDbkpJT3YyVW5aWkRVRWlDdFRacnRFWktCb0lSZ0ZwL1dmT3FR?=
 =?utf-8?B?WlhIWVhXaU1PZER4QXBncHJ2U1FTU3F1ZTIyTjVFalVwbTYwVDRRcDd5bXZ3?=
 =?utf-8?B?RVJMcllTdThPTTZLN2R2N29wRG1rcERGR0o3N0EvbVlzQ1h2STVBbEFOYWxM?=
 =?utf-8?B?dnJoNXJSUlgxeVhCVStmd3NQbXlVbjl6Skp5bmZyZit6dVNFMVBnSG14Skpm?=
 =?utf-8?B?RVh1T08vMUtWZWJjQ3dtSkxrbEVZRVJZUVZxcG9BdTJxQ3FFMnV4dG84eEhm?=
 =?utf-8?B?RkpPcU5HbFZsQk5rL1A3VDFZcWI2bWhyYjNpc2w2ZW4zVDlLVFBhWjdrWkFs?=
 =?utf-8?B?RjJPaXFOc3dwc1k3VTB1S3ZmL1NMSEoyV3I4cU9HVE02d1RVVlJkaFozbFRT?=
 =?utf-8?B?UUFDYnM2eTVDZFhlQldEWmEvYzJhUVE3cGtUN2lGeEUwV25QaUE2Z0NpMncx?=
 =?utf-8?B?Q0VmTW5pRVZhYUNxUXVOeld1bmJaY0M1L1FHeS96b1RXRlZUYzZvNUpYczds?=
 =?utf-8?B?dmVUazhEYkkxbkFRQzJ5dmlHd1FKRGFiL3VrM1QwSU5JZXUwUG43cmpncHlT?=
 =?utf-8?B?d3JpYTU3SXpkRXBXcTdTL2dydTU0RWNvVDFlV2Rsb0lJKytwTXdHbnNwTDU0?=
 =?utf-8?B?WDZqU3NMT0YzVzVOUWNKVlg2bHJMUkx3c3JiMG5xUGJ5dnVjRTJlbW1tWkdl?=
 =?utf-8?B?bExIMnJqN3lxWmhUL2xheGF6dlRCQSsvZ25mZVhId3k0ZTFES2hrUmpMTWRY?=
 =?utf-8?B?cEpxOEpMeStmOWhPWi8vNVFYNjBlcFZYVTF0aG11eklrQjVnUkJOMWsrOExx?=
 =?utf-8?B?a085VWNQRHJPK0VwREFiaktOOC8xR0Q0ZldGRkdEMVMzUkNEQ2tGMlduZmpv?=
 =?utf-8?B?MmtMRG9iWFB5bkt5dnpQbTA0ZFRsWTBSM1lmRmk3MzVkbnNqMHRRVGtKaTk4?=
 =?utf-8?B?c0RQdWtaZThjWlIvNUJzRlJ3Rm13c2ZZSFFzNDVyUTEzbDZ5aXQ2U1hlMS8y?=
 =?utf-8?B?ZWwwekFrTTdwQzRjUk1WQWFIUnpyWjc2ZG4rTHhjU2FIYkptNHBKM0dwYzAw?=
 =?utf-8?B?OTdJNCtvZWlEV3JWakpDZkxRWGNKaVRWNmZHVlRJV0ZNRjZlVURBUUZDb3Vt?=
 =?utf-8?B?NXV1Vnk3N21lMWJycTV5Z3FTbFloS0UrSjh1Y29ZUlNIR2FGVlRXa3RVNW5Y?=
 =?utf-8?B?dk5FdXh3d1ZMRWE0eTRWS2RUbWlDZWNoRGdNSTlmcWJSYWM1VHJNR2RLaHRx?=
 =?utf-8?B?bW5CNFgxTDZqZFBvMVdHcVFLWm9MRzVpYkVrN3JKMjdwUnpvSmRpT0piWWRh?=
 =?utf-8?B?M0QrU3d2MFFNb1J1VUFKU2VyWmJWZ0FLY25NaDkzZ2t3SXFmd2lLaFdRZjMy?=
 =?utf-8?B?Y3pQT0p6NFB5NW5DZi82cVpVWkpmUEc0MitQZi9DWHRoYWF0UWtkK3BGUDZX?=
 =?utf-8?B?OXNKRlN4ZlQrTXIybzVBMlpXVnhvbStIUWw2M0kvQ2RmSHVqUGc3aDBlMkpo?=
 =?utf-8?B?Z1k1UGVkN3ZKVytGeGloTWpqeXdleUpHSWIxOG52VUpVcjRNMEV2c0NQR2VR?=
 =?utf-8?B?M25EV0lNeERjTHpRbm8zak5SUGhENFU3ODFPRTdSL1cxVUs0TlJ2NklrUVAx?=
 =?utf-8?B?WTZHUDBkdU1FL2hpM1YxMk9Sc0F6d3htRFVvOW03Q3ZLcWxzdTgxcjNFYlA0?=
 =?utf-8?B?U2syYTQzZ1FMdXMwT2tiY1lYeG54c21hUzMxcU1tZTByWDZpMjcyNVVxRGxZ?=
 =?utf-8?B?ZmtvOCtwMWxKRTk3NTc0a3YxL0F0dmlnbzJnZVBJdVlVZXpxdHd1ZTNqZHRp?=
 =?utf-8?Q?HDhv3JtDT7qck9wdkTP+06mmmd/XgBAzmzNec=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M1BOSUthZWtRcDQxdVdTSktZRm5FSzV1elBEMTE2eXhGQmJLdWNHb284MVhj?=
 =?utf-8?B?NlN1WW5lMGtqM1JXbm9WMmJHVGxtZDVGdkU3b3d4eW1PazJwME92OGs0TTM5?=
 =?utf-8?B?aHRuY1c2KyswbkJSZGlnR3BEZlNJa0VlUGZRQmY2ZDZYR05XM0FZL2JPOGZ5?=
 =?utf-8?B?bmlaRkpvZGJ3T1hGY05ZZlE5SkYxNFpsYmF0eWpWWVRFZEFRdTJzaCs4aUEv?=
 =?utf-8?B?MU5JV3hvYldjUjlETytFQmtta0dVMTFQN0hvVzNJQ1FMaHhIMWZldVBjb2VC?=
 =?utf-8?B?eDFGU0lmdUU0aWdpbExCVjRzMWdudnBnRWVCenpJUzlEanJzRW84MnkrM1RZ?=
 =?utf-8?B?U1BRMHFhVmh6OUVXL2tVUFlkNFFZWlFmSll6M3YzdURjYWhhdmNmRXRMYis1?=
 =?utf-8?B?N3BHbEFlbWI3aTJPZGJwclBIT0g1MjhaaFNHS3FMa1pZZnZBYytiZTRtWFlJ?=
 =?utf-8?B?b0REUEJnbEw5NUxLbTZWbWNlNTRjbUZaTGYwWGtuaWVuaFh0Y05PZ1huVFBq?=
 =?utf-8?B?MDZhWnRsV1VhVUJPMmMxVVZCQldsMjZWcUFpaXQrTHFRZ3NKREk4K1l4b0pp?=
 =?utf-8?B?b0t1cHlwREwva0pnNjNuS0Jobzl3YnZ3YU43RG5ybkxza3JXRXB1TTliYVl3?=
 =?utf-8?B?NFFHQTlaTEg3OFFZamZGSU9sTnZYZ01xMFlUT0t5bFN2d0pwN21OdGRZNmd5?=
 =?utf-8?B?Ly93Tk1wdHN1a3A2VXM2MHlJSTlvSFMzT2U1dmk2MHRBTFVRZksvWFFGRyt3?=
 =?utf-8?B?RkovRDQyenVpVlh0R0Y3SlVLdDErY0lVMWdsd0wzaDhKVU5PUHo5UjJ0aXk0?=
 =?utf-8?B?ajVIblJiYXRXdFlqdTRqdThkbEJ1ZjROUDBwKzVzQlNUeHMwWGxQVFJzd04w?=
 =?utf-8?B?eXkwNkNaTXJCZFR2aWVxdWlLNE92SU1pb0Fwa0o2WkJTVFBkUVdjTnZ0U3F4?=
 =?utf-8?B?WFhFL3lmYkxuNy9ydWlaWjh4ajhmWjV3TzdVQ0x3T2RqT3U2Ni9oODNkUko4?=
 =?utf-8?B?VXpLc3E5aHR6R1hNTHJldHRLQ1ZpOXBLWkgzcWM3LzdBaU1qQndEdVZiQWhZ?=
 =?utf-8?B?d0dBUGhQSHgrRTlaOWxicVRMelBZOVBxM29RNWtuN3U0ekZSWVBmUUU2eHpM?=
 =?utf-8?B?MGtVbTZJcDJNQStYbm9vdDh0aEF3WDI5WUVyU3lLd0JQb0IxRHB3QTF6YUVU?=
 =?utf-8?B?dldhbWZVN1dNNHdRZFIvS1NGNTUvNkVOUVVFYkhYNmpPVjJGejd1Z3NuUUVs?=
 =?utf-8?B?YXp5aHBBZGF6YnpFYlZHS0daVVBuVkpIRlFGOTFUckRIb0ozMUhrTkRMMk9j?=
 =?utf-8?B?eUJGdENPbk5KSGJRUDJKdC9DbndlRzR3RUpVVlBMcDdCSFlSMWNpRVNlNHc0?=
 =?utf-8?B?WTB1cFZIN1psblZpb1hOWHJPU2ZndThMM3dpZWNJU1lVYnhvQ3VVT1lwRURw?=
 =?utf-8?B?cFRGRytONEhmSzVkaENGVXM4V3lQLzFVdEFSQ0FVUXBEWDZUZnB3WTNXdDJ4?=
 =?utf-8?B?UkNuZUhZemd0WE45TFhIRER1NmxUN3VRblNMV0VCa1F3dVpySXJvVjRjcEZF?=
 =?utf-8?B?UDJxVHpLeHVteXArd0p0YWFVV0pRaEVicU5MU1BiajlmbzBXR2pSaksrS1dY?=
 =?utf-8?B?OGtLa1hSWG9EeUpBR3FIUklRY0ViQzdVdTMxazF3V3FxWFpZdDFuM0lQWHBO?=
 =?utf-8?B?VG5LQU1QeWpXZlllOU9nOW5FejBldTkyNFZTNUZmSVhBWCt3UjV0SWQ1TDFN?=
 =?utf-8?B?R3hFMGR6NjR6UjhnTkRuQUYzejcwVjJiRHFBRE13Zlp1RTBmNkFZYjFvTHY5?=
 =?utf-8?B?cTJTOU54MmN3V3psdFdWbWpVVUNiZGNNWm1nakMzd3M4cGxGZTBuZ1BDaDZE?=
 =?utf-8?B?OFRhM3VsemxTMFlPN1pIU0pnOU9IZWsxTUY0OEhUT20zdWw5VHV5SHZGbHk2?=
 =?utf-8?B?d1B1cEwzZXp1aFU2OWpFUmlpKzV1Z2l4RlJYc3hUd0hoN3hQcGl3S3pGWVNZ?=
 =?utf-8?B?VTNYbjZIalVMMDM0SEpKUlJLYk5VRGN1M0JZS1lxcFZYeGZwWURUZTc0SkJx?=
 =?utf-8?B?eUpDUTRLWjhrOExxbU16WXRWd2VUejlXV3k4UnJac2NwRmVVaTRwZ0h1WCtK?=
 =?utf-8?B?TkJxYnFOaTA5UXRZbUlnUzdITXlCdG9UcEZjOGd3YU84SkpHbVYvK1dRNWpy?=
 =?utf-8?B?MEE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fd596a2-f943-4009-0750-08ddefa91ee6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 13:59:40.5283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TQO/jrbJ14LVZRMXAS4bqvxYxyYt9+q5jxR+parO3uh12/A7ejzoLDDDK5EBdSvorR2lX8fC8TCk4Bzk36LrSSLscViH3aMehsmUc/bqR2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7978
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 Sep 2025 13:59:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7491

Hi Antonin,

On 9/9/25 3:29 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Add a migration note on the pni-names default policy change after commit
> <> in OE-Core.
> 

General question, the systemd manpage specifies the policy as mac and 
not MAC, should we follow that as well?

> Cc: Koen Kooi <koen.kooi@oss.qualcomm.com>
> Cc: Ross Burton <Ross.Burton@arm.com>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/migration-guides/migration-5.3.rst | 25 ++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/documentation/migration-guides/migration-5.3.rst b/documentation/migration-guides/migration-5.3.rst
> index 2d2f8d91a..8aa7b537f 100644
> --- a/documentation/migration-guides/migration-5.3.rst
> +++ b/documentation/migration-guides/migration-5.3.rst
> @@ -118,6 +118,31 @@ class. Instead, one should create a new recipe to build this FIT image, as
>   described in the :ref:`Removed Classes <migration-guides/migration-5.3:Removed
>   Classes>` section of the Migration notes for |yocto-ver| (|yocto-codename|).
>   
> +systemd Predictable Interface Names no longer MAC policy by default
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The :oe_git:`systemd recipe </openembedded-core/tree/meta/recipes-core/systemd>`
> +used to forcibly set the MAC policy by default when the ``pni-names``
> +:term:`distro feature <DISTRO_FEATURES>` was enabled. See

s/was/is/ ?

> +https://www.freedesktop.org/software/systemd/man/latest/systemd.link.html#AlternativeNamesPolicy=.
> +
> +This is no longer the case. Instead, when the ``pni-names`` :term:`distro

SHould we justify here why it is no longer the case?

> +feature <DISTRO_FEATURES>` is enabled, the default policy from systemd is
> +selected (from https://github.com/systemd/systemd/blob/main/network/99-default.link).
> +
> +To set the MAC policy to systemd, add the following to a systemd ``.bbappend``

s/to systemd/in systemd/ ?

> +file in your custom layer::
> +
> +   do_install:append() {
> +          if ${@bb.utils.contains('PACKAGECONFIG', 'pni-names', 'true', 'false', d)}; then
> +                  if ! grep -q '^NamePolicy=.*mac' ${D}${nonarch_libdir}/systemd/network/99-default.link; then
> +                          sed -i '/^NamePolicy=/s/$/ mac/' ${D}${nonarch_libdir}/systemd/network/99-default.link
> +                  fi
> +                  if ! grep -q 'AlternativeNamesPolicy=.*mac' ${D}${nonarch_libdir}/systemd/network/99-default.link; then
> +                          sed -i '/AlternativeNamesPolicy=/s/$/ mac/' ${D}${nonarch_libdir}/systemd/network/99-default.link
> +                  fi

My brain's sh parser says this is invalid because we're missing a 
closing fi for the outermost if block.

I'm also a bit worried about this code snippet as it'll just not be 
tested or maintained once this gets merged.

Cheers,
Quentin

