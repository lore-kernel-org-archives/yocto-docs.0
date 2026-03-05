Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E430F3094A
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 11:43:13 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.34])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42272.1772710984422624372
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 03:43:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=GjlsZqk9;
 spf=pass (domain: cherry.de, ip: 52.101.70.34, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x4ow62WZ4xa9M019m3kcOayCw9N/ieH4FHIiublCLdSrlJibpsV6tCSMiyqJhityV1vhji4f9l6aUmGX4YbTR85V2wav1RVMHC6OBmEbPFLYxzNEVyDRKxFjqRuw5c3OXDYR2YszdzXeNg3arJvVK8WoP7C96mhg0HBAMpsZmm6Xy1EebrNKsnRlQ6cpqKj/C3OaodoKNWqCD9VHPxjkxG7DWYyxAn1rKXzhKRs+VwOWSbZ2xWm67+tHCA/lTuSdpWcvnvnpBQ7YmRh0ITvnC8EP/XCBuozBKdvE7ou6gOCjYsb8jLyZwkzDwj8FOfQSfPZStmDqgLlfEkww7UkAyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YPCvxKILNzbyh5HeRnGc9wEsNGCbftoePL6s8E5VlqM=;
 b=neo3qiaca1iBi5u0l2cnHVGFp3lhM36WAzsOgqnLbEtf8/HYg+wKSRuyxBNMtncHn2DPst1jB0UnGqgdg4shhQE+YHN6ZDXhYg19HchP/vG0jzptJQf+/d2P6JEgEYY128GGHZV/KYn7AXYsX42KmPh+2HfsNOsQT1DLEejaO/IdBhL4tDisIns1giaRX7QG/g9mvO+M1EuefjclyR5hbCWkc1khCA3EblXuFSHBY+Bg7IxFx/6jnYaDp2ekSZKqCqqev8AV0iXX5/R+23MiKNjDcKRygLC/x+fmcUWIcqvp2Xb2AwlDefFHgzfpjyEKyaLfWpoNup6o0KPrCi8Gbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YPCvxKILNzbyh5HeRnGc9wEsNGCbftoePL6s8E5VlqM=;
 b=GjlsZqk9zL9jtNBxwDq82Z5EB9Yw62ADHYo1k/P3LW+Dfr6ElkGM1Bf+26wGgYIDt4zhkRsUnEjvai3fpO2gqbOkojqn55jMY1s+amZTA+ilzGYe9peuYXVy/pooDlt2vuYl55zQ0/ErjmVQ1gESWLg+6+P62NTPGdBcCgvjvww=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PA1PR04MB11035.eurprd04.prod.outlook.com (2603:10a6:102:493::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 11:42:59 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 11:42:59 +0000
Message-ID: <d76013e1-535b-4cf8-a83c-11a1cf093bd2@cherry.de>
Date: Thu, 5 Mar 2026 12:42:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 6/8] migration-guides: update 6.0 (Wrynose) release
 notes
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260302-release-notes-6-0-v1-0-9662dee58591@bootlin.com>
 <20260302-release-notes-6-0-v1-6-9662dee58591@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260302-release-notes-6-0-v1-6-9662dee58591@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BE1P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:79::12) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PA1PR04MB11035:EE_
X-MS-Office365-Filtering-Correlation-Id: ac55ee4c-433d-4dea-2c69-08de7aac59d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|7053199007|7142099003;
X-Microsoft-Antispam-Message-Info: 
	G/jPwtj+gnD9AA8I5AJYKrZQEe06FHvNxkHAsczTj8tzoVj6afkF4pPhTK0hBQhDeHdOxXpavsdK+4T3iKpLILNfxfh/KbtcGPRHAs/IFNyMPDpDh9k1yUePWvgAB6mHiPV3i1Qqu6l8GjeFveH/xXheobyHhfmSss2TFnvtogxZiqQOpEoIEAaLV4UfNh3PUHgoMBiQL1dSUZVE2Ta7Dtq7yDbWf1pE6y3xfciayKjm+ulR3mDXI5yOGKJOCLTwxSMtfJWtQRrlCCy6pgE3b5n7jeU+ZNTzs+X3SGEVqWdcAFJWZiqUZE3Znp++KaTUxhwJqUceBriFoURMuZntaU+qOrPXrvIeYHsYOD5SAXhwM99kL6cPqmfE4f+XsE4XWz1SCm3QOF/3oUMBiRymJOK7QqFw7Abiut/sSWR1/cgzkSL+ETCQw5LkmnoLQ7BjO368vqvwxF9H5g7M9OX++d6Df0Fc5CcBkvIiT8QRvKfEDf51xhfUzqza8mzbvDePWfrL2+NdKbVbIbGesypQgcJoVsAdboNSde80fJuu0/SHkDwiDQKoFpPbf3qRScT5lN9v/l3rFXOgE50sMtXEN1UDeQ/ZiKZaajWBFeaQAi6JxT6sLZcFEbjLEp5rx+nInDrZpkM5y3YN+m/Yp3XsBnquWpYD8w84bdew/rzgOIc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(7053199007)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T0MzellZYS9OVldIbkhqTmVVSXV3blVUN2FPU1JtblJKeHRhWUpMK1kzdzh1?=
 =?utf-8?B?ZjBvaE5rQUlYZjdySTJoampIeWNmY29Cb3VqdVNuWGk5ZEh2WW93eWVGL2hk?=
 =?utf-8?B?SEZIOEVsblQyY3JKM2lGWngvRUhOK2FtVkV1RVdCSE5PSWFtc0xaZzBXNCtP?=
 =?utf-8?B?a28xK1Q4aG1HYk9nVjRscUNySzZTNlFVWUFtbk83dlo0SHhEZFRBSDEvWEdq?=
 =?utf-8?B?UjlVQ0V3SVFaM2dZVmYxRmJjb2lHSXRJZnJ3NmhrTzNxc013T3pHOEw2Rko2?=
 =?utf-8?B?Nk83ZzNiL1FmQXpkTHV2eGJUTWV0MHRiYWZLeXJIUHhSYVBRR1VDK3BqSkJN?=
 =?utf-8?B?NUZ5d0dKK3hSVEFDQ2ZSZUZoT1AyRlZ2Q3IrTTJrUjdlZllQN0xiaXRNazZX?=
 =?utf-8?B?a1ZHc04vaFJLdWRIL0plbENya0NiNVhiNW1qMllTNFZQY0RCWTJoazZJaVQ2?=
 =?utf-8?B?am40THFVSUdDMlNsZWUyaWZOWFpkYWJYcmd5cHZidHpIVTkvUk1nZ2FRYmhY?=
 =?utf-8?B?TVlZZE9OSlJoSUZjWHpHSzFIME1QRm90UEVJMUJQUTZ6c1NNVlBVTGFoU2Mv?=
 =?utf-8?B?cGlXaklTZkJyM3RkNVAvSVBLTE1QQUEvWHFXTG44WFRESFhCRUhKR1lXOG9W?=
 =?utf-8?B?S3g5YzQvb3FpSFo4S20vQXdaMFMzN25adnNMdUMyTXY0cm9ZZ3N4NkpBSUdP?=
 =?utf-8?B?SWF1YnRHNlZLY2FNUzRUdWJER2FMNHN1d1JhdjZCY3dZTTVZdW9GcnB0M1Rm?=
 =?utf-8?B?djdPTVdzS1R6NVBScyt2NmMwV0ZWN3Ywd29JVmYrbmxDZzlKeWpsTFlIQndO?=
 =?utf-8?B?ZGVPOHAxZFZkNGV2c0c4bmYySzVsb2t4dW9oak00OGlRYU1seG9UbzRhSzN1?=
 =?utf-8?B?VUovcnVsd2xCMnhSK01mZTkybVpGczRBL2JHWnR2MTUwYnlXNkJQYWc5NTJW?=
 =?utf-8?B?WjRmSXZWbU1tcHFyOUtQQm5COFZxbzc5Uk1MZTZhMWhTSVFGVDZ4ZllJblpl?=
 =?utf-8?B?TWt6THUvWGZkakZSSktpRmo1c3NrSWRRRklzNURsaU1YY0Ryd0xtUi85dThB?=
 =?utf-8?B?eDZ6QWo0ZlBtWEh1RkptcFNmN09IeHl3cnNqOEFsNnpmcWVtTWo4TWlaK0F3?=
 =?utf-8?B?TXMwc0dIYVNaZmhBNnRlRWVQWmR2SlpnUGZRWW42NW5jMUl3cC9CRE4vUVRv?=
 =?utf-8?B?Nk5UWU1OaUNKSWRPN2VxNGo5WG9Pclo0aEU5OXBYREhmNmVMeG5LcjBJVnhM?=
 =?utf-8?B?UUlTS0JaRG52eDhKLzduaGRab2xFZjNNRFRuLzlnRkdsQVpvdk5zN08vVlg1?=
 =?utf-8?B?L2NONHdubEhvb1JzcHJLeWdGVmZQSzB5bTNCN3RTQ2V0a3pTTHVXdU1aYzhM?=
 =?utf-8?B?dGpTS0g2RmZFc0ZRYUQ5YnkzLy9EbGpMZm9KMkJhZ3JLcng0OGY2eXRwek9B?=
 =?utf-8?B?TUJjZWMvOHRkTlF6NmtpUVFFQ1haYjI3S2ZxdmZSNnUxQ0Z6djQxMHFlbGxH?=
 =?utf-8?B?RmNLMGtjNERweFZ0dllpalNYQVFOdE9QMjVJTklSSS82ZVYvUm13d0RkUjNF?=
 =?utf-8?B?WktPWUgvaGZ4WGU4Umh1bTRGeGxvMjNzMzc1ZEtaeUJBY05UNS9CbGVrVzQx?=
 =?utf-8?B?M1dHZ2x6OCtBNDNHdXpOQ2VRc05ib2dCVFZvVVNLbU5zVVJOQjUveFF4WURD?=
 =?utf-8?B?dk9HVFM3Y1QyUTBsMkVaOFBRZTJzUzVVdHhKUGlQTnFJQkN0Zmtrb0RLR0pr?=
 =?utf-8?B?c3lnRys2Q3VuSlNCeTBDa3kzaG9QVmoyQjdmRDdsNnNwblN3b3lRd1YvTit0?=
 =?utf-8?B?SE9sTnZJUEZaMGxXN2p2eVFCRnpSQ1U5N1hVZ2trOHhGREhDZXpPY3V3NHFr?=
 =?utf-8?B?NFZmRUlJOW1acXlOT2RqcThyUEV5bWdEZkZ2dmNvVnVkVk53ZXpzZG5Zcnd1?=
 =?utf-8?B?aExhL0swdDZEeGRpR2NoUjNpamJHcFVCTVE3OGVPY0h4YmgxNFpKOUxBbk5o?=
 =?utf-8?B?SVF4SHZ4ZTNiK0RSdC9CdXplK1RtNDVTeXM1QWZ6dWgzanZQR2p4b3l3bklx?=
 =?utf-8?B?cmJTckFBVDVLNHFLbHcxZlMzS3Vhd2dKMldHQWhiMEFOVGpRZlo0UWp3THR5?=
 =?utf-8?B?M3cxbCtqbnFGbGZrN3ZUcldhZ0hzUlZjeVJnU3QwMXdXYW1aR3V4ekxFRm1Q?=
 =?utf-8?B?bWQ5bGV1NUxEL1lXRXo0dVczWGZPUWczalJ5K3M3Wml0eWEvTEYvMmJCbFk2?=
 =?utf-8?B?bG5QdlBzTkJyRUdYNHNyQlB4Q0k0TndZc2tJOWF4amFyK2VuRlR0UnQvT0Fr?=
 =?utf-8?B?b1ZDdmFjMWxobHMzM0xrclpQOUJRUHg3bGgrK1BxcFpwQ0E5blFwQXN3Sjlm?=
 =?utf-8?Q?l0jTpIMq8j2TV0XGm+arNBgq46o6WA9XfAqrX?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ac55ee4c-433d-4dea-2c69-08de7aac59d0
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 11:42:59.4126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aTXsB1U0yw02QsU306dq3X414bPExm+R4ebZjINHxCd3flobRSU+wTLihV4osg1cdKCMKSYVLx1zb48iWRQ14/98DitPUCZgPcpcSjLEe54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11035
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Mar 2026 11:43:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9065

Hi Antonin,

On 3/2/26 10:37 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Update documentation/migration-guides/migration-6.0.rst and
> documentation/migration-guides/release-notes-6.0.rst to include
> important changes between:
> 
> - bitbake: 8b02d65a6439 and bc8be83aef0a
> - openembedded-core: 545e43a7a45b and be8cdcf13a65
> - meta-yocto: 632d10b28141 and 2486ce288906
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/migration-guides/migration-6.0.rst   | 193 +++++++++-
>   .../migration-guides/release-notes-6.0.rst         | 414 ++++++++++++++++++++-
>   2 files changed, 588 insertions(+), 19 deletions(-)
> 
> diff --git a/documentation/migration-guides/migration-6.0.rst b/documentation/migration-guides/migration-6.0.rst
> index b18206b21..bdd43096e 100644
> --- a/documentation/migration-guides/migration-6.0.rst
> +++ b/documentation/migration-guides/migration-6.0.rst
> @@ -10,9 +10,23 @@ Migration notes for |yocto-ver| (|yocto-codename|)
>   
>   This section provides migration information for moving to the Yocto
>   Project |yocto-ver| Release (codename "|yocto-codename|") from the prior release.
> -For a list of new feature and enhancements, see the
> +For a list of new features and enhancements, see the
>   :doc:`/migration-guides/release-notes-6.0` section.
>   
> +The |yocto-ver| (|yocto-codename|) release is the new LTS release after 5.0
> +(scarthgap). If you are migrating from the 5.0 version, be sure to read the
> +previous migration guides:
> +
> +-  :doc:`/migration-guides/migration-5.1`
> +-  :doc:`/migration-guides/migration-5.2`
> +-  :doc:`/migration-guides/migration-5.3`
> +
> +See also the list of new features and enhancements of the previous releases:
> +
> +-  :doc:`/migration-guides/release-notes-5.1`
> +-  :doc:`/migration-guides/release-notes-5.2`
> +-  :doc:`/migration-guides/release-notes-5.3`
> +
>   Supported kernel versions
>   -------------------------
>   
> @@ -34,12 +48,169 @@ On the other hand, some earlier distributions are no longer supported:
>   
>   See :ref:`all supported distributions <system-requirements-supported-distros>`.
>   
> +BitBake fetcher removals
> +------------------------
> +
> +The following :term:`BitBake` :ref:`fetchers <bitbake:bb-fetchers>` have been
> +disabled or removed:
> +
> +-  The ``npm`` and ``npmsw`` (:wikipedia:`NPM <Npm>`) fetchers were disabled due
> +   to security concerns (:bitbake_rev:`355cd226e072`) and lack of maintenance.
> +
> +   All associated tests have been disabled.
> +
> +-  Support for the :wikipedia:`Bazaar <GNU_Bazaar>` fetcher was dropped
> +   (:bitbake_rev:`8e057d54f09c`).
> +
> +-  Support for the `OSC <https://github.com/openSUSE/osc>`__ fetcher was dropped
> +   (:bitbake_rev:`99497c131778`).
> +
> +-  Support for the `CVS` fetcher (:bitbake_rev:`5427500e4f23`).
> +

Missing verb. I'm assuming we want "was dropped" here.

Also, I'm hoping we won't have sha collision on the first 12 hex digits. 
Wondering if we should't put the whole sha instead of only the first 12 
hex digits?

> +Default :term:`INIT_MANAGER` definition changed to ``systemd``
> +--------------------------------------------------------------
> +
> +The default definition of :term:`INIT_MANAGER` in the :oe_git:`defaultsetup.conf
> +<openembedded-core/tree/meta/conf/distro/defaultsetup.conf>` file was changed
> +from ``none`` to ``systemd``.
> +
> +This means that users of the default distro setup (appearing as the ``nodistro``
> +:term:`DISTRO`) will be using :wikipedia:`Systemd <Systemd>` as the default init
> +manager.
> +
> +This does not change the default init manager of the :term:`Poky` distribution,
> +which remains :wikipedia:`SysVinit <UNIX_System_V>`.
> +
> +Reverting to :wikipedia:`SysVinit <UNIX_System_V>` can be done by specifying the
> +:term:`INIT_MANAGER` in your own :term:`DISTRO` configuration file::
> +
> +   INIT_MANAGER = "sysvinit"
> +
> +See commit :oecore_rev:`0b4061c5d502` for more information.
> +
> +Changes to the list of :term:`DISTRO_FEATURES` enabled by default
> +-----------------------------------------------------------------
> +
> +The following :term:`DISTRO_FEATURES` are now enabled by default in
> +:oe_git:`meta/conf/bitbake.conf
> +</openembedded-core/tree/meta/conf/bitbake.conf>`:
> +
> +-  ``multiarch``: Enable building applications with multiple architecture
> +   support.
> +
> +-  ``opengl``: Include the Open Graphics Library, which is a
> +   cross-language multi-platform application programming interface used
> +   for rendering two and three-dimensional graphics.
> +
> +-  ``ptest``: Enables building the package tests where supported by

Inconsistent with all other entries in this list. s/Enables/Enable/ I guess?

> +   individual recipes. To add the built :ref:`ref-classes-ptest` packages to the
> +   image, add ``ptest-pkgs`` to :term:`IMAGE_FEATURES` in your image recipe.
> +
> +-  ``vulkan``: Include support for the :wikipedia:`Vulkan API <Vulkan>`.
> +
> +-  ``wayland``: Include the Wayland display server protocol and the
> +   library that supports it.
> +
> +See commit :oecore_rev:`2e1e7c86064c` for more information.
> +
> +:ref:`ref-classes-native` and :ref:`ref-classes-cross` classes :term:`DEBUG_BUILD` change
> +-----------------------------------------------------------------------------------------
> +
> +Previously, setting :term:`DEBUG_BUILD` to "1" globally would prevent the
> +:term:`OpenEmbedded Build System` from stripping target,
> +:ref:`ref-classes-native` and :ref:`ref-classes-cross` binaries. This was
> +changed so that only **target** binaries are stripped when this variable is set.
> +
> +This change can be reverted by setting the two following lines in a
> +:term:`configuration file`::
> +
> +   INHIBIT_SYSROOT_STRIP:class-cross = "${@oe.utils.vartrue('DEBUG_BUILD', '1', '', d)}"
> +   INHIBIT_SYSROOT_STRIP:class-native = "${@oe.utils.vartrue('DEBUG_BUILD', '1', '', d)}"
> +
> +See commit :oecore_rev:`3c29afed1dc0` for more information.
> +
> +.. _ref-migration-6-0-u-boot-config-flow-changes:
> +
> +U-boot configuration flow changes (:ref:`ref-classes-uboot-config`)
> +-------------------------------------------------------------------
> +
> +The way of configuration U-boot evolved in the way of declaring multiple U-boot
> +configuration statements from::
> +

s/U-boot/U-Boot/

for the sentence and the section. c.f. https://docs.u-boot.org/en/latest/

Also this reads weird to me, can suggest:

"""
Declaring multiple U-Boot configurations used to be entirely defined by 
one :term:`UBOOT_CONFIG` variable flag per configuration, e.g.::
"""

> +   UBOOT_CONFIG ??= "foo bar"
> +   UBOOT_CONFIG[foo] = "config,images,binary"
> +   UBOOT_CONFIG[bar] = "config2,images2,binary2"
> +
> +To use variable flags instead::

"""
This has now been split into more variable flags, e.g.::
"""

> +
> +   UBOOT_CONFIG ??= "foo bar"
> +   UBOOT_CONFIG[foo] = "config"
> +   UBOOT_CONFIG[bar] = "config2"
> +
> +   UBOOT_CONFIG_IMAGE_FSTYPES[bar] = "fstype"
> +
> +   UBOOT_CONFIG_BINARY[foo] = "binary"
> +
> +   UBOOT_CONFIG_MAKE_OPTS[foo] = "FOO=1"
> +   UBOOT_CONFIG_MAKE_OPTS[bar] = "BAR=1"
> +
> +   UBOOT_CONFIG_FRAGMENTS[foo] = "foo.fragment"
> +
> +See the documentation of the :ref:`ref-classes-uboot-config` for full details.
> +
> +While the previous legacy approach is still supported, it will be deprecated in
> +for the next release. Users are advised to migrate to the new approach.

It will be *removed* for the next release. It is now deprecated for 
Wrynose (you even get a warning if I read the code correctly).

> +
> +.. note::
> +
> +   Single configuration builds have not changed and are still declared using the
> +   following statements::
> +
> +      UBOOT_MACHINE = "config"
> +      UBOOT_BINARY = "u-boot.bin"
> +

Maybe move this after the "See commit" sentence below, otherwise it's a 
bit awkward, "does the commit apply to the note too" may the reader think.

> +See commit :oecore_rev:`cd9e7304481b2` for more information.
> +
> +:ref:`ref-classes-pkgconfig`-related variables are no longer automatically exported
> +-----------------------------------------------------------------------------------
> +
> +All the :ref:`ref-classes-pkgconfig`-related variables, such as
> +:term:`PKG_CONFIG_PATH`, are no longer exported in
> +:oe_git:`meta/conf/bitbake.conf <bitbake/tree/meta/conf/bitbake.conf>` with the
> +:ref:`export <bitbake:bitbake-user-manual/bitbake-user-manual-metadata:Exporting
> +Variables to the Environment>` directive.
> +
> +These ``export`` statements have been move to the :ref:`ref-classes-pkgconfig`

s/move/moved/

> +class, meaning recipes using these variables that are not inheriting the

s/are not inheriting/not yet inheriting/ ?

> +:ref:`ref-classes-pkgconfig` class should now inherit it with::
> +
> +   inherit pkgconfig
> +
> +See commit :oecore_rev:`68d2d38483ef` for more information.
> +
>   Rust language changes
>   ---------------------
>   
>   systemd changes
>   ---------------
>   
> +Support for the Sysvinit compatibility in systemd was dropped

s/the Sysvinit/SysVinit/ (or something else, just be consistent in this 
doc; note that we have different capitalization throughout the docs, so 
being consistent across the docs would be nice :) )

> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Support for the :wikipedia:`SysVinit <UNIX_System_V>` compatibility in
> +:wikipedia:`Systemd <Systemd>` was dropped.
> +

s/Systemd/systemd/

> +This is due to `recent announcements
> +<https://github.com/systemd/systemd/releases/tag/v260-rc1>`__ in `Systemd` which

s/Systemd/systemd/

> +is planning to drop support for the `SysVinit` compatibility.
> +
> +This means that the ``systemd`` and ``sysvinit`` :term:`distro features
> +<DISTRO_FEATURES>` cannot be used together anymore.
> +
> +Users are advised to switch to one init manager or the other entirely.
> +
> +See commit :oecore_rev:`d9ec9e20eebc` for more information.
> +
>   Recipe changes
>   --------------
>   
> @@ -53,13 +224,28 @@ Removed recipes
>   
>   The following recipes have been removed in this release:
>   
> +-  ``jquery``: The last user of this recipe were the reproducible tests, but

s/user/users/

> +   have been reworked to use the `jQuery` CDN in instead with

s/in instead/instead/ ?

> +   :oecore_rev:`d3ee5497b1ce` (See :oecore_rev:`aae793a17e7d`)
> +
> +-  ``systemd-compat-units``: Dropped as a consequence of removing
> +   :wikipedia:`Sysvinit <UNIX_System_V>` support in :wikipedia:`Systemd
> +   <Systemd>`
> +

s/Sysvinit/SysVinit/

s/Systemd/systemd/

> +Removed :term:`PACKAGECONFIG` options
> +-------------------------------------
> +
> +-  ``mesa``: ``freedreno-fdperf`` (:oecore_rev:`293edd0d3d07`)
> +-  ``libcxx``: ``no-atomics`` (:oecore_rev:`ccc585f94c51`)
> +-  ``systemd``: ``sysvinit`` (:oecore_rev:`e00d5d6eac65`)
> +
>   Removed classes
>   ---------------
>   
>   The following classes have been removed in this release:
>   
>   -  ``oelint``: remove as most of the checks done by this class are done in other
> -   areas of code now, making this class obsolete.
> +   areas of code now, making this class obsolete
>   

NACK.

>   Removed features
>   ----------------
> @@ -68,3 +254,6 @@ The following features have been removed in this release:
>   
>   Miscellaneous changes
>   ---------------------
> +
> +-  :ref:`ref-classes-meson`: drop ``meson_do_qa_configure`` as it was
> +   non-functional (:oecore_rev:`0514b451b5d9`)
> diff --git a/documentation/migration-guides/release-notes-6.0.rst b/documentation/migration-guides/release-notes-6.0.rst
> index af72d1e93..0370903d7 100644
> --- a/documentation/migration-guides/release-notes-6.0.rst
> +++ b/documentation/migration-guides/release-notes-6.0.rst
> @@ -13,86 +13,466 @@ This document lists new features and enhancements for the Yocto Project
>   changes and migration guides, see the :doc:`/migration-guides/migration-6.0`
>   section.
>   
> +The |yocto-ver| (|yocto-codename|) release is the new LTS release after 5.0
> +(scarthgap). If you are migrating from the 5.0 version, be sure to read the
> +previous migration guides:
> +
> +-  :doc:`/migration-guides/migration-5.1`
> +-  :doc:`/migration-guides/migration-5.2`
> +-  :doc:`/migration-guides/migration-5.3`
> +
> +See also the list of new features and enhancements of the previous releases:
> +
> +-  :doc:`/migration-guides/release-notes-5.1`
> +-  :doc:`/migration-guides/release-notes-5.2`
> +-  :doc:`/migration-guides/release-notes-5.3`
> +
>   New Features / Enhancements in |yocto-ver|
>   ------------------------------------------
>   
>   -  Linux kernel XXX, gcc XXX, glibc XXX, LLVM XXX, and over XXX other
> -   recipe upgrades.
> +   recipe upgrades
>   > --  Minimum Python version required on the host: XXX.
> +-  Minimum Python version required on the host: XXX
>   

Why the sudden change of mind with dot-ending?

Also clearly missing the versions :)

>   -  New variables:
>   
> -   - The :term:`OPENSSH_HOST_KEY_DIR_READONLY_CONFIG` variable can be used to
> -     specify the directory where OpenSSH host keys are stored when the device
> -     uses a read-only filesystem. The default value is ``/var/run/ssh``.
> +   -  The :term:`OPENSSH_HOST_KEY_DIR` variable can be used to specify the
> +      directory where OpenSSH host keys are stored. The default value is
> +      ``/etc/ssh`` (:oecore_rev:`addd80ddfd89`)
> +
> +   -  The :term:`OPENSSH_HOST_KEY_DIR_READONLY_CONFIG` variable can be used to
> +      specify the directory where OpenSSH host keys are stored when the device
> +      uses a read-only filesystem. The default value is ``/var/run/ssh``
> +      (:oecore_rev:`addd80ddfd89`)
> +
> +   -  The :term:`SPDX_INCLUDE_KERNEL_CONFIG` can be set to "1" export the Linux

+to?

> +      kernel configuration (``CONFIG_*`` parameters) into the SPDX document when
> +      using the :ref:`ref-classes-create-spdx` class (:oecore_rev:`228a968e7c47`)
> +
> +   -  The :term:`SPDX_INCLUDE_PACKAGECONFIG`: variable can be set to "1" to

Spurious colon.

> +      export a recipe's :term:`PACKAGECONFIG` features (enabled/disabled) into
> +      the SPDX document when using the :ref:`ref-classes-create-spdx` class
> +      (:oecore_rev:`228a968e7c47`)
>   
> -   - The :term:`OPENSSH_HOST_KEY_DIR` variable can be used to specify the
> -     directory where OpenSSH host keys are stored. The default value is
> -     ``/etc/ssh``.
> +   -  The :term:`SPDX_PACKAGE_URL` allows specifying a space-separated list of
> +      Package URLs (purls) for the software Package when using the
> +      :ref:`ref-classes-create-spdx` class (:oecore_rev:`874b2d301d3c`)
>   
> -   - :term:`SPDX_INCLUDE_KERNEL_CONFIG`: export the Linux kernel
> -     configuration (``CONFIG_*`` parameters) into the SPDX document.
> +   -  The :term:`SPDX_CONCLUDED_LICENSE` allows specifying the
> +      ``hasConcludedLicense`` object of individual SBOM packages when using the
> +      :ref:`ref-classes-create-spdx` class (:oecore_rev:`bb21c6a429a2`)
>   
> -   - :term:`SPDX_INCLUDE_PACKAGECONFIG`: export a recipe's
> -     :term:`PACKAGECONFIG` features (enabled/disabled) into the SPDX document.
> +   -  The :term:`FIT_MKIMAGE_EXTRA_OPTS` variable allows passing extra options
> +      to the ``mkimage`` command when creating a FIT image
> +      (:oecore_rev:`d925d67061ef`)
> +

U-Boot generates FIT images too (I believe Barebox as well), but this 
only applies to the kernel FIT image as far as I could tell?

> +   -  The :term:`FIT_CONF_MAPPINGS` variable allows mapping extra configurations
> +      to existing ones or rename an existing configuration in FIT images
> +      (:oecore_rev:`e30f809a50c2`)
> +

Ditto.

> +   -  The :term:`UBOOT_CONFIG_FRAGMENTS` and :term:`UBOOT_FRAGMENTS` allow
> +      supplying additional configuration fragments to the existing U-boot

s/U-boot/U-Boot/

> +      configuration. See the definition of the variables for more information,
> +      and the documentation of the :ref:`ref-classes-uboot-config` class
> +      (:oecore_rev:`9e96d3dedee4`)
> +
> +   -  The :term:`IMAGE_EXTRA_PARTITION_FILES` allows specifying extra files from
> +      the deploy directory (:term:`DEPLOY_DIR_IMAGE`) to install in a WIC
> +      partition created with the ``extra_partition`` plugin
> +      (:oecore_rev:`e1526079d205`)
>   
>   -  Kernel-related changes:
>   
>   -  New core recipes:
>   
> +   -  ``libconfig``: Import recipe from :oe_git:`/meta-openembedded/`, needed by
> +      one of the Mesa recipes (:oecore_rev:`1a0196a794f8`)
> +
> +   -  ``python3-sphinxcontrib-svg2pdfconverter``: Used for the generation of the
> +      Yocto Project documentation (:oecore_rev:`f3f001967744`)
> +
> +   -  ``python3-pyzstd``: Import from :oe_git:`meta-python
> +      </meta-openembedded/tree/meta-python>`, needed by the ``ukify`` tool of
> +      systemd v258 (:oecore_rev:`88a27133c184`)
> +
> +   -  ``python3-uv-build``: This recipe add the ``uv`` Python build backend,

s/add/adds/

> +      required by ``python3-cryptography`` (:oecore_rev:`0880cd2b79ee`)
> +
> +   -  ``blueprint-compiler``: Add the recipe as it became a dependency of the
> +      ``epiphany`` recipe after its upgrade to 49.2 (:oecore_rev:`4212392ca7eb`)
> +
>   -  New core classes:
>   
> +-  Global configuration changes:
> +
> +   -  ``base-passwd``: Add a ``clock`` group as `systemd` version v258 introduces
> +      this group to `enable applications like linuxptp to open clocks without
> +      root privileges <https://github.com/systemd/systemd/commit/af96ccfc24bc4803078a46b4ef2cdeb5decdfbcd>`__
> +      (:oecore_rev:`aad849301be1`)
> +
> +   -  ``lto.inc``: Add a `Clang` specific :term:`LTO` configuration (:oecore_rev:`253da2e6fc0a`)
> +
> +   -  ``bitbake.conf``:
> +
> +      -  remove :term:`DEBUG_PREFIX_MAP` from :term:`TARGET_LDFLAGS`
> +         (:oecore_rev:`1797741aad02`)
> +
> +      -  The default definition of :term:`TARGET_LDFLAGS` used to
> +         contain the value of :term:`DEBUG_PREFIX_MAP`, to fix binary
> +         reproducibility issues. This was no longer needed after the originating
> +         `GCC bug <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101473>`__ was
> +         fixed (:oecore_rev:`1797741aad02`)
> +
> +      -  Switch :term:`BB_SIGNATURE_HANDLER` to ``OEEquivHash`` and
> +         :term:`BB_HASHSERVE` to ``auto`` by default
> +         (:oecore_rev:`5596ea156d3f`, :oecore_rev:`4a388406acf0`)
> +
> +   -  The :ref:`ref-classes-uninative` class is now enabled by default. This
> +      allows reuse of native sstate built on one distro on another
> +      (:oecore_rev:`722897f96d30`)
> +
> +   -  The :oe_git:`no-static-libs.inc
> +      <openembedded-core/tree/meta/conf/distro/include/no-static-libs.inc>`
> +      file, disabling most static libraries in various recipes, is now included
> +      by default in the default distro setup (appearing as the ``nodistro``
> +      :term:`DISTRO`) (:oecore_rev:`03fc931bfe9e`)
> +
> +   -  The :oe_git:`security_flags.inc
> +      <openembedded-core/tree/meta/conf/distro/include/security_flags.inc>`
> +      file, adding various security related flags to the default compiler and
> +      linker, is now included by default in the default distro setup (appearing
> +      as ``nodistro`` :term:`DISTRO`) (:oecore_rev:`4c2d64c10a5b`)
> +
> +   -  The :oe_git:`yocto-space-optimize.inc
> +      <openembedded-core/tree/meta/conf/distro/include/yocto-space-optimize.inc>`
> +      file, adding various space optimization tweaks, is now included by default
> +      in the default distro setup (appearing as ``nodistro`` :term:`DISTRO`)
> +      (:oecore_rev:`175fcf9fad69`)
> +
>   -  Architecture-specific changes:
>   
>   -  QEMU / ``runqemu`` changes:
>   
> +   -  ``qemuboot```: Make the tap interface nameserver configurable through
> +      :term:`QB_TAP_NAMESERVER` (:oecore_rev:`0e8c2582d46d`)
> +
> +   -  ``qemu``: Disable the ``libkeyutils`` feature (:oecore_rev:`30cc9f519243`)
> +
> +   -  ``runqemu-extract-sdk``: Support the ``tar.zst`` format
> +      (:oecore_rev:`650bb45251b5`)
> +
> +   -  ``qemurunner``: Improve ``qmp`` module detection
> +      (:oecore_rev:`a7386d071d42`)
> +
> +   -  ``runqemu``: Support ``.tar.zst``, ``.tar,xz``, ``.tar`` rootfs archive
> +      types (:oecore_rev:`3a6172fbb6d3`)
> +
>   -  Documentation changes:
>   
>   -  Go changes:
>   
> +   -  :ref:`ref-classes-go`: Disable workspaces when building
> +      (``GOWORK="off"``) (:oecore_rev:`c52c5e886269`)
> +
> +   -  ``meta-go-toolchain``: Disable support for the ``riscv32`` and ``ppc32``
> +      architectures, as this was not supported (:oecore_rev:`f55407185c63`)
> +
>   -  Rust changes:
>   
> +   -  Enable dynamic linking with llvm. This allows dynamically linking to
> +      ``libLLVM.so`` instead of linking statically (:oecore_rev:`74ba238ff1ba`)
> +
>   -  Wic Image Creator changes:
>   
> +   -  ``wic/engine``: Fix copying directories into wic image with ``ext*``
> +      partitions (:oecore_rev:`1ed38aff5f81`)
> +
>   -  SDK-related changes:
>   
>   -  Testing-related changes:
>   
> +   - :ref:`ref-classes-ptest` support was added for the following recipes:
> +
> +      -  ``libarchive`` (:oecore_rev:`6e0bf90e31c9`)
> +      -  ``libassuan`` (:oecore_rev:`1010abf3e32e`)
> +      -  ``libcheck`` (:oecore_rev:`1bb06e23c1c8`)
> +      -  ``libconfig`` (:oecore_rev:`f3e9d1326bf3`)
> +      -  ``libksba`` (:oecore_rev:`f50a2005dda8`)
> +      -  ``libmd`` (:oecore_rev:`4c0a41389bda`)
> +      -  ``libsolv`` (:oecore_rev:`f5432d1c45f9`)
> +      -  ``libyaml`` (:oecore_rev:`ed2a3459829b`)
> +      -  ``utfcpp`` (:oecore_rev:`49314caa7eb8`)
> +
> +   -  ``selftests``: Use SHA256 keys for RPM tests (:oecore_rev:`692919be1947`)
> +
> +   -  ``oeqa``: Open JSON files to parse in a context manager
> +      (:oecore_rev:`e96baf588dfa`)
> +
> +   -  ``resulttool``: Add :ref:`ref-classes-ptest` support to the JUnit output
> +      format (:oecore_rev:`2abe2d701c98`)
> +
> +   -  :ref:`ref-tasks-testimage`: Print last lines of kernel log on test fail
> +      (:oecore_rev:`fea3c445a9cc`)
> +
> +   -  ``reproducible``: Use the `jQuery` CDN instead of ``jquery-native``
> +      (:oecore_rev:`d3ee5497b1ce`)
> +
> +   -  ``selftest``: Test installation of recipes with complex packaging
> +      (:oecore_rev:`6f3aab6bfa75`)
> +
>   -  Utility script changes:
>   
> +   -  ``bitbake-config-build``: It is now possible to disable all fragments
> +      starting with a prefix by issuing ``bitbake-config-build disable-fragment
> +      <prefix>/`` (:oecore_rev:`573695d2ff3e`)
> +
> +   -  ``recipetool``: Support PEP639-variant of license key in Python
> +      ``pyproject.toml`` files (:oecore_rev:`9d1a7bb5d8aa`)
> +
> +   -  :ref:`ref-classes-buildhistory`:
> +
> +      -  Also show renamed directories (:oecore_rev:`9bf22112ea46`)
> +      -  Fix handling of :term:`RDEPENDS` style strings (:oecore_rev:`b013d62d1092`)
> +
> +   -  ``create-pull-request``: Keep commit hash to be pulled in cover email
> +      (:oecore_rev:`c78f5ae4a5ba`)
> +
> +   -  ``yocto-check-layer``: Add messages in ``test_readme`` assertions
> +      (:oecore_rev:`9fe883ce4c62`)
> +
>   -  BitBake changes:
>   
> +   -  ``bitbake-layers``:
> +
> +      -  Add a ``--show-variants`` option to the ``show-recipes`` subcommand to
> +         display :term:`BBCLASSEXTEND` variants (:bitbake_rev:`353d5e948c99`)
> +
> +      -  Fix the branch detection method of ``layerindex-fetch`` (:bitbake_rev:`af9dd012e7f4`)
> +
> +   -  ``bitbake-setup``:
> +
> +      -  Implement symlinking local sources into builds with the
> +         ``--use-local-source`` option of the ``init`` subcommand
> +         (:bitbake_rev:`ed5a3a0fc820`)
> +
> +      -  Convert ``print()`` calls to use a :term:`BitBake` logger
> +         (:bitbake_rev:`6e511d035a3d`)
> +
> +      -  Correct several scenarios in layer updates (:bitbake_rev:`aa15cc7bd102`)
> +
> +      -  Source in the ``git-remote`` section can now be specified more simply
> +         with the ``uri`` property, instead of the ``remotes`` property
> +         (:bitbake_rev:`7941a5dc4dba`). For example:
> +
> +         .. code-block:: json
> +
> +            "bitbake": {
> +                "git-remote": {
> +                    "uri": "https://git.openembedded.org/bitbake",
> +                    "branch": "master",
> +                    "rev": "master"
> +                }
> +            }
> +
> +      -  Use the internal registry if run from a Git checkout, from a remote
> +         :term:`BitBake` repository otherwise (:bitbake_rev:`675e9076a252`)
> +
> +      -  Fragments passed in the ``oe-fragments-one-of`` property can now
> +         contains descriptions (:bitbake_rev:`29f2cee655be`)

s/contains/contain/

> +
> +      -  Improve the readability of choices during the
> +         :ref:`bitbake:ref-bbsetup-command-init` command
> +         (:bitbake_rev:`d9700632bd6b`)
> +
> +      -  Enable coloring of the diff outputs when using the
> +         :ref:`bitbake:ref-bbsetup-command-status` or
> +         :ref:`bitbake:ref-bbsetup-command-update` commands
> +
> +   -  ``cooker``: Use :term:`bitbake:BB_HASHSERVE_DB_DIR` as hash server
> +      database location. If unset, the existing behavior is preserved
> +      (:bitbake_rev:`b339d05ad2b6`)
> +
> +   -  ``bitbake-getvar``: Show close matches when no providers are found
> +      (:bitbake_rev:`1f8fa7c25e71`)
> +
>   -  Packaging changes:
>   
> --  LLVM related changes:
> +-  Clang/LLVM related changes:
> +
> +   -  ``compiler-rt``:
> +
> +      -  Remove the need to depend on ``libgcc`` (:oecore_rev:`f504b6bb8366`)
> +      -  Always build C runtime (``crt``) files (:oecore_rev:`56fe42abe21e`)
> +
> +   -  ``libcxx``: Remove GNU runtime from dependencies (:oecore_rev:`8034509d3065`)
> +
> +   -  ``libcxx/compiler-rt``: Add support for ``llvm-libgcc``, a drop-in
> +      replacement for ``libgcc`` and ``crt`` files (:oecore_rev:`ed02230e3bba`)
>   
>   -  SPDX-related changes:
>   
> +   -  ``spdx30_tasks``: Fix :term:`SPDX_CUSTOM_ANNOTATION_VARS` implementation
> +      (:oecore_rev:`52ab3b640c6b`)
> +
> +   -  :ref:`ref-classes-kernel`: Add a task to export the kernel configuration
> +      to SPDX. This  (:oecore_rev:`228a968e7c47`)
> +

This?

> +   -  Add support for exporting the :term:`PACKAGECONFIG` to SPDX
> +      (:oecore_rev:`7ec61ac40345`)
> +
> +   -  Add suport for package URLs (PURLs) through :term:`SPDX_PACKAGE_URL`
> +      (:oecore_rev:`874b2d301d3c`)
> +
> +   -  ``create-spdx-2.2``: Add CVEs in :term:`CVE_CHECK_IGNORE`
> +      to the list of fixed CVEs in the output SBOM (:oecore_rev:`f8525224cb82`)
> +
>   -  ``devtool`` changes:
>   
> +   -  ``ide-sdk``: Find ``bitbake-setup``'s ``init-build-env``
> +      first, and ``oe-init-build-env`` if not found (:oecore_rev:`6ab7e9e8e52f`)
> +
> +   -  ``ide-sdk``: Add `gdbserver` attach mode support (:oecore_rev:`119171087681`)
> +
> +   -  ``ide-sdk``: Support GDB pretty-printing for C++ STL types (:oecore_rev:`a69e2baba81b`)
> +
>   -  Patchtest-related changes:
>   
> --  :ref:`ref-classes-insane` class related changes:
> +   -  Code refactoring and improvements (:oecore_rev:`86d0b2254ae9`,
> +      :oecore_rev:`317ef42b9b23`, :oecore_rev:`6cdb5cbbee62`,
> +      :oecore_rev:`ae787b32d501`, :oecore_rev:`a85025234809`)
> +
> +   -  Reject ``Upstream-Status`` after scissors (:oecore_rev:`2156ef9e6def`)
> +
> +-  :ref:`ref-classes-insane` / :ref:`ref-classes-sanity` classes related changes:
>   
>   -  Security changes:
>   
> --  :ref:`ref-classes-cve-check` changes:
> +   -  A new document was added to the Yocto Project documentation:
> +      :doc:`/security-reference/index`. It is intended to document a way of
> +      reporting vulnerabilities to the Yocto Project security team.
> +

s/a way of reporting/how to report/ ?

> +-  :ref:`ref-classes-cve-check`-related changes:
> +
> +   -  ``cve-update-nvd2-native``: Use maximum CVSS score when extracting it from
> +      multiple sources (:oecore_rev:`4f6192f3165d`)
>   
>   -  New :term:`PACKAGECONFIG` options for individual recipes:
>   
> +   -  ``curl``: ``schannel``
> +   -  ``libinput``: ``lua``, ``libwacom``, ``mtdev``
> +   -  ``mesa``: ``expat``, ``zlib``
> +   -  ``opkg``: ``acl``, ``xattr``
> +   -  ``gstreamer1.0-plugins-good``: ``qt6``
> +   -  ``python3-cryptography``: ``legacy-openssl``
> +   -  ``openssl``: ``legacy``

Maybe sort the recipe list?

> +
>   -  Systemd related changes:
>   
> --  :ref:`ref-classes-sanity` class changes:
> +   -  Package ``ukify`` separately, with the ``systemd-ukify`` package name
> +      (:oecore_rev:`e92427496210`)
> +
> +   -  ``systemd-compat-units``: Generate masks at build time
> +      (:oecore_rev:`4dc01e016210`)
>   

Isn't that recipe removed? Not sure it's worth documenting this part.

>   -  U-boot related changes:
>   
>      -  :ref:`ref-classes-uboot-config`: Add support for generating the U-Boot
>         initial environment in binary format using
> -      :term:`UBOOT_INITIAL_ENV_BINARY`.
> +      :term:`UBOOT_INITIAL_ENV_BINARY` (:oecore_rev:`cf11b14a4cfc`)
> +
> +   -  A new way of specifying multiple U-boot configurations has been added

s/U-boot/U-Boot/

> +      (:oecore_rev:`cd9e7304481b`). See
> +      :ref:`ref-migration-6-0-u-boot-config-flow-changes`
>   
>   -  Miscellaneous changes:
>   
> +   -  ``curl``: Ensure ``CURL_CA_BUNDLE`` from host environment is respected
> +      (:oecore_rev:`545e43a7a45b`)
> +
> +   -  ``weston``: Add PipeWire as runtime dependency when ``pipewire`` is part
> +      of :term:`PACKAGECONFIG` (:oecore_rev:`9f5286725ad4`)
> +
> +   -  :ref:`ref-classes-uki`: Use basename of device trees available via
> +      :term:`KERNEL_DEVICETREE` (:oecore_rev:`27a7fbb767c0`)
> +
> +   -  ``rpcbind``: Set the owner of ``/run/rpcbind`` to ``rpc``
> +      (:oecore_rev:`80e428924715`)
> +
> +   -  :ref:`ref-classes-archiver`: Remove :term:`WORKDIR` from the patch
> +      directory (:oecore_rev:`c99d22827c95`)
> +
> +   -  ``gtk4``: Convert to use the :ref:`ref-classes-gnomebase` class
> +      (:oecore_rev:`fcd5e7c4468f`)
> +
> +   -  ``udev-extraconf``: Split ``automount`` and ``autonet`` into seperate
> +      packages (``udev-extraconf-automount`` and ``udev-extraconf-autonet``)
> +      (:oecore_rev:`08662d71cd35`)
> +
> +   -  ``e2fsprogs``: Add a for files larger than 2GB (:oecore_rev:`683a1e773899`)

Add a?

> +
> +   -  ``mesa``: Add support for the ``virtio`` ``gfxstream``, ``hasvk`` Vulkan drivers

Missing coma betwen first two drivers.

> +      (:oecore_rev:`8e7ffdceded3`, :oecore_rev:`3b56f14b2019`)
> +
> +   -  ``mesa``: Drop :wikipedia:`VDPAU <VDPAU>` remnants in the recipe after
> +      upstream support was removed (:oecore_rev:`3b05f58586bc`)
> +
> +   -  :ref:`ref-classes-cross`: Propagate dependencies to ``outhash``,
> +      improving :ref:`hash equivalence <overview-manual/concepts:Hash
> +      Equivalence>` (:oecore_rev:`267b651e875d`)
> +
> +   -  ``run-postinsts``: Propagate exit status to the ``run-postinsts.service``
> +      systemd service (:oecore_rev:`7f74d88bb628`)
> +
> +   -  ``freetype``: Use :ref:`ref-classes-meson` instead of
> +      :ref:`ref-classes-autotools` (:oecore_rev:`7395e4f99e90`)
> +
> +   -  ``wpa-supplicant``:
> +
> +      -  Build with :wikipedia:`OWE <Opportunistic_Wireless_Encryption>` support
> +         by default (:oecore_rev:`d16c66b4efad`)

Missing newline.

> +      -  Build with :wikipedia:`802.11be <Wi-Fi_7>` support by default
> +         (:oecore_rev:`d16c66b4efad`)
> +
> +   -  ``overlayfs``: Remove helper unit (:oecore_rev:`623c20ff1e98`)
> +
> +   -  :ref:`ref-classes-patch`: Show full path when a patch fails to apply
> +      (:oecore_rev:`602e28b48134`)
> +
> +   -  ``kea``: Replace ``keactrl`` with `kea` daemons (``kea-dhcp*``) in
> +      initscripts (:oecore_rev:`7f9d9297a84f`), and remove ``keactrl`` from the
> +      recipe (:oecore_rev:`08c3877f4df8`)
> +
> +   -  ``initramfs-framework``: Add handover of PID 1's arguments to modules
> +      (:oecore_rev:`a0ab3d1c4f9e`)
> +
> +   -  ``perl``: Provide ``pod2man`` (in the recipe's :term:`PROVIDES`
> +      definition). This is used by many other recipes to produce :wikipedia:`man
> +      pages <Man_page>`, allowing existing to explicitly depend on

existing?

> +      ``pod2man-native`` to produce man pages (:oecore_rev:`1d1e55d200fb`)
> +
> +   -  ``build-sysroots``: Add sysroot tasks to default build and remove warning
> +      (:oecore_rev:`e73f15095522`)
> +
> +   -  Licenses and manifest are now deployed to the SDK when setting

s/manifest/manifests/ ?

s/to/in/ ?

Cheers,
Quentin

