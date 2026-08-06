Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 306D4C5AC82
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 12:42:26 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.61])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18853.1786020133943842754
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Aug 2026 05:42:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=PHFJ27om;
 spf=pass (domain: cherry.de, ip: 52.101.66.61, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HVpCCtxz1f6iIXeSkY2mT33y+Zqg5zL8h0VQP5e8bcl7d5/can6nG6A2dpVf7Gu+y0uo9ua081BPb1KsDgu6GT+jKLLIn4Uuoa73PnF7KrhObuaMg0UVfF1Es7jWp0RO3DaXuWjfREktgpsaiZvH+LyVVyZlLgNpcN/vvAHbbvwtzAqHZES46F7RTpqOBrvhQXI2p69tpq0IK+44L3f7YxhtIChFTAkntdkQnlq5c6yNM7EHPuvcrizTbhqRtZ3p+5PBlrS8N93kj6gDDaORSiYyRsIluJ+xRNIE3L9oI/DVTmoe1jxR4B0Po2XIq/+8a54sPsFgxcYYL/0jUag8cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9dHxm/lOCZALLHjeIzIZ37HCTeZFKd4u3Dkt7mNEM4U=;
 b=f4ZHCMKn/OJl3ifNAC4LNrDKmCnWVshEAII5fXWA75X9e+AaF7llp0CysOmzHQNaF28Qw8gjBD/RURKf6Hx9jnhcR4dzQF7TprQ9xlgUjOIz7zWcC1/VAS3v/OeprUJKICdPCYuDp6IQaY+x9aAqnCEmJ+zkAd/f6HqWMvbXvTT2cl1WbSbFgVsxmB8C2IRi9BANvQF0if3ZElQW32BjSy+mLErp2qJ4tiwgAtLu0f+Lf5kxli7uskccplkD7W8GyCw+OQM8yP9/Hnx3zW/xEAGmY+ru2eNSO29nFx0WS11kaefDWXxlf2QaxWNPFinj+IDIAta6ImIvct8LfUTL6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9dHxm/lOCZALLHjeIzIZ37HCTeZFKd4u3Dkt7mNEM4U=;
 b=PHFJ27omiN9+s60krHFI1OWYLmhigAYYAISguQQQwKhX0mCClUsB1EBDqkcEqo6NUmXn3dwYgdusQxgAmd0gqvX1c778ipHYo/N0oknznhBXfCM3T22MzNQm5DPneFOM5DJz4jYjqu4remyXC9hc93vwHb8TOQir5mhC44j0Fdc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB7733.eurprd04.prod.outlook.com (2603:10a6:20b:288::18)
 by FRRPR04MB12571.eurprd04.prod.outlook.com (2603:10a6:d10:1cf::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 12:42:15 +0000
Received: from AS8PR04MB7733.eurprd04.prod.outlook.com
 ([fe80::8f86:fafb:dce7:bcd5]) by AS8PR04MB7733.eurprd04.prod.outlook.com
 ([fe80::8f86:fafb:dce7:bcd5%3]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 12:42:15 +0000
Message-ID: <660eefaa-9011-4057-870f-036bd8cf01e0@cherry.de>
Date: Thu, 6 Aug 2026 11:54:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual: add uboot-extlinux-config class
 documentation
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260804-uboot-extlinux-config-v1-1-f6cb1603c383@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260804-uboot-extlinux-config-v1-1-f6cb1603c383@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: PR1P264CA0063.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2ca::18) To AS8PR04MB7733.eurprd04.prod.outlook.com
 (2603:10a6:20b:288::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB7733:EE_|FRRPR04MB12571:EE_
X-MS-Office365-Filtering-Correlation-Id: 43d67d51-6397-4cb4-6f04-08def3b82508
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|10070799003|376014|366016|13003099007|6133799003|56012099006|11063799006|10067099003|4133799003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	pA1rzXwrpmEVMpug8r8pEZBh3/EJJtT0aoaIQWkVNZRnTrwtISKgwWanubDgCzJ1/Dj3SpZ5kc8GbcMIHa6BWbuogy463WHz8465p/DkUQM1JeIqNi5BdQwR03MOZcfpDOVxDFJuPrq9Xk48fvr5bVhpFSUOuXFcpA8mVcouxX1yxb5FLBnG3Z9iWOSLNQJj7OhTIq/YXVo2xePDxF9ysOyl0o16Eba63R7Os+f98nSbMkm1aqycqI2OaLe5SgMGM/WI2dPZ5uZeQq6aXZ8fvyEjwrpoiJceISDL10skEMDb26HGklDcakjy0JFo94JxSOeWBXySHyrEv/bgzm6wZuJ0K4sXUTN3BSU6J/77d+QOBneAIZ7rR+XQM0PIJDVuvFhtzPNfO3VNGlXTOSW08SktSELmp/yEWsFFFc8u/6+fPCON1f2wS4Xyd0GGtz0/FW9Sd0Llt9WzIqsmIeK+77LGkdX/vq9ACoTnEtxlGlhAK5MzfoQCOurNoAyJwtpCYcGhTmZ1aL4ZddTellUmXxI/IZ3OT0AlH2vShDWuGndyGy47lmnJQJmNdOycMSpafzWZPRYgsUGgBlCMe7Jnyc9e+3vugsD38pi8onNpgGQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB7733.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(10070799003)(376014)(366016)(13003099007)(6133799003)(56012099006)(11063799006)(10067099003)(4133799003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S3hLM0NEb3Jjc1FndzNWTDJTZVFObEs1aFZ2dWhibWlVV3pxNGdSdm96YWRy?=
 =?utf-8?B?SFBqYzVpa3Jwa2JkemNHTEhJQk1HOWhTeHo5VWh0UnNIUnVHMy82L21HOWJN?=
 =?utf-8?B?S3dpSFc2TTJaakQvTHRkSVMrWUxnelBad3l5TVFVQTNTUWtsQnI3d2JlT3Nn?=
 =?utf-8?B?dDVQREVQUmgySU0xWEl2eWlBMnB4anZPeGpaYmY5NkhoNS9CQ0pwQ0xXdE10?=
 =?utf-8?B?dnlWZmpxSXJodlcyTE4rMXYwUzBFNTJUeUV2UWE3bXJ3R0kwdU4wYzZ2RUJw?=
 =?utf-8?B?ZGhIT3V6Vjl6R3ZtTFMyUWV2ajB5QjJGZ2FuSFNTUHZBVDhrb3lVY0V4N0NE?=
 =?utf-8?B?eXJZclFNamIwNDF3YlE5MWZCSk5DdllnVzkvNTRuYW9yUE1FMGF1RzJLWVJl?=
 =?utf-8?B?bEowR2szUm9wTDMxajE4NXdpckJ0WXFubEVKVzMvM2VQYmNhSGwxVnRuTHc5?=
 =?utf-8?B?NnJORG1SeEprbzRJY29sN0dVQUM2ZzFrME1PbCtuNEFNYzg5UFgvbXNZSnVs?=
 =?utf-8?B?OHZVWG1LcjQxM29RQW9jZEM2Mko2SVJsbTEzckh5Zzlxc1VRK0RJMmNGU3R0?=
 =?utf-8?B?ZXlLeitxdzFTY0hxdVgzUDJ2RVJNMEsyT0NyaEN4bk5qNFJ1Q0lEY2dsc0Ey?=
 =?utf-8?B?Y1dOSlRaOVI1TmR6d3hoa0Qxb3ZSZjNvOXhDNnNZcFp2WmEyaVY4ZWxVRDZn?=
 =?utf-8?B?Q2FUTStJL3FxY09VWEFGOEtPZ2FqYTRPZzVvTXVRTUxKT0ZhTjRPZHFyT3k4?=
 =?utf-8?B?d3NjR3RYeSszUzIvZ1M5NGFLNzk0S2lBTThrbmRDbDRza0pIUmVMcE5nL0p6?=
 =?utf-8?B?a2FtNUJqNVg2b0QyV0Y1TDBYRUJ0ZURuZWloZ1RYUjdrTkpFaVN2N1NNeFJa?=
 =?utf-8?B?UTY4ajJFenppRk1ySXcxVzdOQWpHbzZxTGtrSy9vcEZ3NFZXRStKTVJYblFi?=
 =?utf-8?B?TE9UcHVCeFU4R1RBS1IwcUx1V2RLZDloZWEvQkprbXA0SjBST0NjZklaQzZW?=
 =?utf-8?B?NmwzK1NVSnpUSnNhTWp3WlUwNGdYZkNOWlNwc1U5VWlSdHprMVl2cEk0S0Z1?=
 =?utf-8?B?bXBxZ0hqYkwyN0FOZkNqbTNKWnJ6c3VIMkRtQzhVMStNUHJkalVmL2xXTUpP?=
 =?utf-8?B?cDRnQ1U3RnUvMDVBM2oybWtRclh1RmVFOFR3R2F3Ty9OZkJ1d0FJVEJkSTFh?=
 =?utf-8?B?MXA2QmVrVnU3cHc5Y2FZRVJwVUhWNmVmZGhqTm9La3JkZ0hUTng2YlB6RHdE?=
 =?utf-8?B?a1ZLR25EZ3hLTjZsdjhvRU42R2l4cWVKTTJhUTRYQy9yZ2dHQjN4elQzWDE0?=
 =?utf-8?B?SGJ3dXdRZ1FobEwwbjNXa2VmNzJSNHVwK28zdU1rMmJ2bGRwazZHWDFjd3J3?=
 =?utf-8?B?VERDa3dYSDI1Umd2d0JVbmdMcWwxZHE4clcwNGJJYWJNMmcyQlNsODNEbVZJ?=
 =?utf-8?B?K1hOL3VlNStWc2pNODJmYUNadDJXMWszKzBmMm5WTm5vT0o3emRRUHBSYnRX?=
 =?utf-8?B?TmhzVXNXV3hXeUNwY2VxalBJbzhMc0pURWY0UGdPM3dHeGZoOTZNYWoxZHhz?=
 =?utf-8?B?SDVZdC9VN0tWNFZ1M1p0bkw3OFh1ZGp2b1o1ZHJjWlJ0d1N4a2dxbnpuRXda?=
 =?utf-8?B?Z0dkUVU1NndTRFZpTXdudU1jczc0bU1QSHpOY1JaSTQrVVZEcWl3c09zZmNV?=
 =?utf-8?B?RFplcU1vWmtXUGRmZkE0QUQ2cnNLODgvdUlzQlRmL3dyUyt2N1c3bEcwMnJP?=
 =?utf-8?B?eXNFTysydlNFd3J5Zytna3ZqaU1oRG1iUklDeDdoSTZqcll1dThMVENCSlU2?=
 =?utf-8?B?RFU4R0pOZjZkSTNSZ1Zob0Yrd3huRzkwLzRzT3V1eGl2L0JzcXRnVGF6SnpF?=
 =?utf-8?B?OHU2SzlYUm5hSzd3dU8yeWNZR3F4bGNOUjlNMTJHcldZMi9PTzVWdnhqV0pv?=
 =?utf-8?B?U3ZuVWRjUldIWEpYOW9oY1ZadFR1ZVVSTnBnS2lYakRDZVluNkZIUEZkN0dk?=
 =?utf-8?B?VUNMVVRsTVgxYU1hSHo0LzBWS1RSWUZzc2MyS2V2SmR3VWE1MUVXMlZHdzlM?=
 =?utf-8?B?TG9PTlNHZGhqcENFK0x0a2lsSlVaNXY0R0xtNGZFNGt5NkQ5YWxOUnk3VWc1?=
 =?utf-8?B?WjUwT09YcDdya1k1SFp2RG5VaU9aZVdFSy9MdU9qdUtLelNCeE43WjluU1hs?=
 =?utf-8?B?RUZjNkJaci9Fc1VLNnllVjRxQW5EVHkvNFBqOHJoR3ZHL0VXamVlcFcyVmZZ?=
 =?utf-8?B?aHJpdVBRMG1lQmFpVE9WZFcxczc0YTdscEtGSkVMd0lYSkdoWmF3MWYreFRM?=
 =?utf-8?B?SDRaRE5jMTZ4RDBQdDZhSlVnSzV0eU1kNjU5WmJYTG1Yc0xrcWZRSU5od09L?=
 =?utf-8?Q?HcMRH1hIyrKGp4k96mDRA3BHuRpE8bUrzPiO64NS4XdC7?=
X-MS-Exchange-AntiSpam-MessageData-1: nSg9/8t839OtzRuFYl4yc8KuRUQu3fLRMj4=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 43d67d51-6397-4cb4-6f04-08def3b82508
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB7733.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 12:42:15.5126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +qAeoKQJcDOrxV2vZ6hm2y1AJ9Sx04npCC0OXeRt693n6Z51vKUIe4K/Mdf1tH6almn/68yiGEZnDX85eQWyEEQIGsZDGdsnfusKFIqAl58=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRRPR04MB12571
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Aug 2026 12:42:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10242

Hi Antonin,

On 8/4/26 5:24 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Add documentation for the uboot-extlinux-config class and the variables
> it defines, including how to enable it and how to customize the output
> extlinux.conf file.
> 
> [YOCTO #15629]
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/classes.rst   |  55 ++++++++++++++
>   documentation/ref-manual/variables.rst | 135 +++++++++++++++++++++++++++++++++
>   2 files changed, 190 insertions(+)
> 
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 98dff1bac..9fbfc0b2f 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -3470,6 +3470,61 @@ possible.
>   See the :term:`UBOOT_CONFIG` and :term:`UBOOT_MACHINE` variables for additional
>   information.
>   
> +.. _ref-classes-uboot-extlinux-config:
> +
> +``uboot-extlinux-config``
> +=========================
> +
> +The :ref:`ref-classes-uboot-extlinux-config` class provides support for
> +generating an ``extlinux.conf`` file part of the `Boot Loader Specification
> +<https://uapi-group.org/specifications/specs/boot_loader_specification/>`__.
> +

I think this is incorrect. We don't actually implement the Boot Loader 
Specification in U-Boot and I'm not even sure it is related to extlinux 
at all (cannot check right now as I'm traveling).

In U-Boot, please have a look at the "Boot Configuration Files" section 
in doc/develop/distro.rst.

Specifically:

"""
The standard format for boot configuration files is that of 
extlinux.conf, as
handled by U-Boot's "syslinux" (disk) or "pxe boot" (network). This 
format is
not formally standardized and documented in a single location. However, 
other
implementations do document it and we attempt to be as compatible as 
possible.

* The UAPI Group Specifications `Boot Loader Specification`_

* The Syslinux Project documents both `PXELINUX`_ and `SYSLINUX`_ files 
and is
   the originator of the format.

That said, we have some differences to these documents, namely:
[...]
"""

I vaguely recall BSL v2 being discussed on the U-Boot mailing list in 
the past few months.

> +The class can be inherited in a `U-Boot <https://u-boot-project.org/>`__ recipe
> +with::
> +
> +   inherit uboot-extlinux-config
> +
> +However, the class functionality is disabled by default. To enable it, set the
> +:term:`UBOOT_EXTLINUX` variable to "1" from the U-Boot recipe or from a
> +``bbappend`` file::

This is likely more a task for the distro/machine conf file to take care 
of, though what you said is not incorrect :)

> +
> +   UBOOT_EXTLINUX = "1"
> +
> +In addition to :term:`UBOOT_EXTLINUX`, the :term:`UBOOT_EXTLINUX_ROOT` variable
> +must be set to the ``root=`` parameter of the `Linux kernel command-line
> +<https://docs.kernel.org/admin-guide/kernel-parameters.html>`__. For example,
> +the following would set this value to the second partition of MMC block device
> +0::
> +
> +   UBOOT_EXTLINUX_ROOT = "root=/dev/mmcblk0p2"
> +

I think that may be a mistake. It isn't always necessary (e.g. when 
using an initramfs). In any case, it reflects the logic we currently 
have in OE-Core so that's fine.

> +After building the U-Boot recipe, an ``extlinux.conf`` is generated and placed
> +in the deployment directory (:term:`DEPLOY_DIR_IMAGE`):
> +
> +.. code-block:: text
> +
> +   tmp/deploy/images/<MACHINE>/extlinux.conf
> +
> +This file can be customized using the variables beginning with
> +``UBOOT_EXTLINUX_`` in the :doc:`Variables Glossary </ref-manual/variables>`
> +section of the Yocto Project Reference Manual.
> +
> +.. note::
> +
> +   Multiple ``LABELS`` can be specified through the
> +   :term:`UBOOT_EXTLINUX_LABELS` variable (i.e. multiple boot entries).
> +   Override-style assignment should then be used to specify label-specific
> +   properties. See the definition of :term:`UBOOT_EXTLINUX_LABELS` for more
> +   information.
> +> +.. tip::
> +
> +   When using the :ref:`bootloader <ref-manual/kickstart:Command: bootloader>`
> +   command with WIC, you should explicitly configure the ``.wks.in`` file to use
> +   the ``extlinux.conf`` file generated by this class with
> +   ``--configfile="${DEPLOY_DIR_IMAGE}/extlinux.conf"``. Otherwise it generates
> +   a default ``extlinux.conf`` file without taking this class into account.
> +

Uh? We use extlinux.conf in meta-rockchip, as well as this WIC command 
and we don't have this set so not sure this is true?

>   .. _ref-classes-uboot-sign:
>   
>   ``uboot-sign``
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index e75f42afe..ccd864877 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -11570,6 +11570,141 @@ system and gives an overview of their function and contents.
>         The default is ``txt`` which means the script is installed as-is, with
>         no modification.
>   
> +   :term:`UBOOT_EXTLINUX`
> +      When inheriting the :ref:`ref-classes-uboot-extlinux-config` class in a
> +      U-Boot recipe, the :term:`UBOOT_EXTLINUX` variable should be set to "1" to
> +      enable the class functionality (inheriting the class is not enough).
> +
> +   :term:`UBOOT_EXTLINUX_CONSOLE`
> +      When inheriting the :ref:`ref-classes-uboot-extlinux-config` class, the
> +      :term:`UBOOT_EXTLINUX_CONSOLE` variable can be set to control the
> +      ``console=`` parameter of the `Linux kernel command-line
> +      <https://docs.kernel.org/admin-guide/kernel-parameters.html>`__. For
> +      example, use as follows::

You can remove ", use as follows", "For example:" is enough here. Ditto 
for all following occurrences.

> +
> +         UBOOT_EXTLINUX_CONSOLE = "console=ttyS0,115200n8"
> +
> +      This is added to the ``APPEND`` property of the ``extlinux.conf`` file
> +      used for booting.
> +
> +   :term:`UBOOT_EXTLINUX_FDT`
> +      When inheriting the :ref:`ref-classes-uboot-extlinux-config` class, the
> +      :term:`UBOOT_EXTLINUX_FDT` variable can be set to control the ``FDT``
> +      property of the ``extlinux.conf`` file used for booting, which controls
> +      the Linux kernel device tree to use. For example, use as follows::
> +
> +         UBOOT_EXTLINUX_FDT = "../am335x-bone.dtb"
> +
> +      .. note::
> +
> +         This path is relative to the ``extlinux.conf`` file used for booting.

It can also be absolute, with the path being the one as stored in the 
partition from which the extlinux.conf is (that is, NOT necessarily the 
same as when the partition is mounted by the target). We use that in 
meta-rockchip (/boot/...).

This doesn't need to be set when a FIT image is to be used.

> +
> +   :term:`UBOOT_EXTLINUX_FDTDIR`
> +      When inheriting the :ref:`ref-classes-uboot-extlinux-config` class, the
> +      :term:`UBOOT_EXTLINUX_FDTDIR` variable can be set to control the ``FDTDIR``
> +      property of the ``extlinux.conf`` file used for booting, which controls
> +      the directory location for locating and loading the Linux kernel device

s/for locating and loading/the/

> +      tree specified in the ``fdtfile`` U-Boot environment variable. For
> +      example, use as follows::
> +
> +         UBOOT_EXTLINUX_FDTDIR = "../"
> +
> +      .. note::
> +
> +         This path is relative to the ``extlinux.conf`` file used for booting.
> +

Same remark as above, can be an absolute path (we use it in meta-rockchip).

> +   :term:`UBOOT_EXTLINUX_FDTOVERLAYS`
> +      When inheriting the :ref:`ref-classes-uboot-extlinux-config` class, the
> +      :term:`UBOOT_EXTLINUX_FDT` variable can be set to control the ``FDTOVERLAYS``
> +      property of the ``extlinux.conf`` file used for booting, which controls
> +      the Linux kernel device overlays tree to apply on top of the device tree.
> +      For example, use as follows::
> +
> +         UBOOT_EXTLINUX_FDTOVERLAYS = "../am335x-bone-wifi.dtbo"
> +
> +      .. note::
> +
> +         This path is relative to the ``extlinux.conf`` file used for booting.
> +

Ditto.

> +   :term:`UBOOT_EXTLINUX_KERNEL_ARGS`
> +      When inheriting the :ref:`ref-classes-uboot-extlinux-config` class, the
> +      :term:`UBOOT_EXTLINUX_KERNEL_ARGS` variable can be used to pass extra
> +      parameters to add to the `Linux kernel command-line

s/to add/

> +      <https://docs.kernel.org/admin-guide/kernel-parameters.html>`__. For
> +      example, use as follows::
> +
> +         UBOOT_EXTLINUX_KERNEL_ARGS = "rootwait ro"
> +
> +      This is included in the ``APPEND`` property of the ``extlinux.conf`` file
> +      used for booting.
> +
> +   :term:`UBOOT_EXTLINUX_KERNEL_IMAGE`
> +      When inheriting the :ref:`ref-classes-uboot-extlinux-config` class, the
> +      :term:`UBOOT_EXTLINUX_KERNEL_IMAGE` variable can be used to specify the
> +      ``KERNEL`` property of the ``extlinux.conf`` file used for booting, which controls
> +      the Linux kernel image to use. For example, use as follows::
> +
> +         UBOOT_EXTLINUX_KERNEL_IMAGE = "../zImage"
> +
> +      .. note::
> +
> +         This path is relative to the ``extlinux.conf`` file used for booting.
> +

Same remark as earlier, can be absolute.

> +      .. tip::
> +
> +         The :term:`KERNEL_IMAGETYPE` variable can be used to get the name of
> +         the current Linux kernel being built by its associated recipe.
> +
> +   :term:`UBOOT_EXTLINUX_LABELS`
> +      When inheriting the :ref:`ref-classes-uboot-extlinux-config` class, the
> +      :term:`UBOOT_EXTLINUX_LABELS` variable contains a list of labels
> +      (``LABEL`` property of the ``extlinux.conf`` file used for booting) that
> +      can be used for booting. This list should contain at least one entry.
> +

No, it must :) And it defaults to "linux".

> +      When multiple labels are specified in this list, all of the variable
> +      ``UBOOT_EXTLINUX_`` variable should be specified with overrides-style

variable [...] variable? One ought to be enough :) Please use the plural 
as well.

> +      assignments. For example, if the :term:`UBOOT_EXTLINUX_LABELS` variable
> +      contains::
> +
> +         UBOOT_EXTLINUX_LABELS = "compressed uncompressed"
> +
> +      Then the :term:`UBOOT_EXTLINUX_KERNEL_IMAGE` variable can be specified
> +      multiple times as follows::
> +
> +         UBOOT_EXTLINUX_KERNEL_IMAGE:compressed = "../zImage"
> +         UBOOT_EXTLINUX_KERNEL_IMAGE:uncompressed = "../Image"
> +
> +      This will make the value of the ``KERNEL`` property be different in each
> +      of the associated labels.
> +
> +      Note that default values are used when no overrides-style assignments are
> +      found for the current label. For example, taking the above example again,
> +      the following assignment would apply to both ``compressed`` and
> +      ``uncompressed`` labels::

**if and only if** UBOOT_EXTLINUX_FDT:compressed and/or 
UBOOT_EXTLINUX_FDT:uncompressed aren't set.

I'm assuming all operators can be used when this override-style is used? 
E.g. UBOOT_EXTLINUX_FDT:compressed:append = " something"? I do have an 
:append and :remove in meta-cherry-es, but not with an override-style 
syntax.

> +
> +         UBOOT_EXTLINUX_FDT = "../am335x-bone-wifi.dtbo"
> +
> +   :term:`UBOOT_EXTLINUX_MENU_DESCRIPTION`
> +      When inheriting the :ref:`ref-classes-uboot-extlinux-config` class, the
> +      :term:`UBOOT_EXTLINUX_MENU_DESCRIPTION` variable sets a description for
> +      the label. If not specified, the name of the label itself is used as the
> +      description.
> +

It defaults to the current label when parsing the variables. Funnily 
enough, this will set the LABEL property in extlinux.conf so we should 
probably say that here as well.

> +   :term:`UBOOT_EXTLINUX_MENU_TITLE`
> +      When inheriting the :ref:`ref-classes-uboot-extlinux-config` class, the
> +      :term:`UBOOT_EXTLINUX_MENU_TITLE` variable sets the ``MENU TITLE``
> +      property of the ``extlinux.conf`` file used for booting.
> +

Please specify this doesn't actually support the override-style syntax 
as it applies to the whole file.

> +   :term:`UBOOT_EXTLINUX_ROOT`
> +      When inheriting the :ref:`ref-classes-uboot-extlinux-config` class, the
> +      :term:`UBOOT_EXTLINUX_ROOT` variable is mandatory and should contain the

s/should contain/contains/?

> +      ``root=`` parameter of the `Linux kernel command-line
> +      <https://docs.kernel.org/admin-guide/kernel-parameters.html>`__. For
> +      example, the following would set this value to instruct the kernel to use
> +      the second partition of MMC block device 0 as its root partition::
> +
> +         UBOOT_EXTLINUX_ROOT = "root=/dev/mmcblk0p2"
> +

We're also missing:
- UBOOT_EXTLINUX_CONFIG,
- UBOOT_EXTLINUX_TIMEOUT,
- UBOOT_EXTLINUX_DEFAULT_LABEL,
- UBOOT_EXTLINUX_INITRD,

Cheers,
Quentin

