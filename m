Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69AB4CCD194
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 11:02:52 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.0])
 by mx.groups.io with SMTP id smtpd.web11.5484.1760612564854971489
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Oct 2025 04:02:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=kmeMRrfY;
 spf=pass (domain: cherry.de, ip: 52.101.72.0, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dAWx7TA/DCK0SWjSIAtEZ+YVX4u3AEa4/etpwvNab+HAXRW4yjeSSvcXSD8chY9+J+AgZPsOKv9aI/T2wENRO1h/Q1cTuwQYPkF36Y/5Nusg1AMeF0emapOkMbeWzFFIl9Ybm0//K718TLMARkqBFsw14d+dDniMEOAid+QXrYe9B15vyKPGYnPCBD9Plu9gKQU3jE/0Ynre7XgPjGofAEGTkn4mjQw5EmAsbdzYvdKJlQD4sv/7NqbkpkGDjIcrafC+dzMeOrdsrhjf1Xu+swTvKzpGnk0ZKwhHbYyjSQ6IB0jsCGEKCOTGUOB2PaEPja93Y4mA6+HmlEN3t8h4pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MyUZVs8Bq4+Q2MMSFheWteGD3ksmD7pO6WixXRceDSE=;
 b=uNcjjlevEvlqC7r7/kGGl93yeJ+Uaa5uwjf7fcIrUhrvd8+ukDN9M1HDL7GXGvDcv9mVSyE6UGd5SS5OWjlBdRz1L1btRMQ8OtBUAOm+gx4OZ2Dt/NJp9te5Itg0vR7qhcOr4AwatvMht5ByjzU17GotPVOy33IjzvAvb/3Ojbu+O9UwGVh4sAUFVY3dp8uZvChixcZA4AsZ0/r5dgR1pe7xJkcSpxIyaopIHQjPUHfu7ejTKgQTJxC8nmsB95o51dMyUCpLG7PVYN13XJoF6gvVi/iLILqnaqLmBEkRDoOXmloHYQ1txjk7vhmCErhsMc5DDhwGKKQMEYs1XWdxSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MyUZVs8Bq4+Q2MMSFheWteGD3ksmD7pO6WixXRceDSE=;
 b=kmeMRrfYUw0x5i6qzcuoDAc35Uu+jovtbyerDecwFx9/0b9TiFz6aOh+iNHI2LREN+MNdUNBZKBhvRx5DcNgnFBUOaZPZG9meLPNIN+BFtq4qoINLDjose2TISCWEKtvSRCJbPgnsYL5wIkBhOLuR28irsY1PMDiTMdXwCqNywE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI2PR04MB11243.eurprd04.prod.outlook.com (2603:10a6:800:29a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 11:02:38 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 11:02:38 +0000
Message-ID: <368a4429-8ba5-4c93-b855-18c80d323a73@cherry.de>
Date: Thu, 16 Oct 2025 13:02:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 17/17] migration-guides/release-notes-5.3: updates
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
 <20251016-release-note-5-3-second-hunk-v1-17-20f21db1f93c@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251016-release-note-5-3-second-hunk-v1-17-20f21db1f93c@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::17) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI2PR04MB11243:EE_
X-MS-Office365-Filtering-Correlation-Id: d38d219d-1575-480e-9312-08de0ca384fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YmhzZGxodElWSlhkemJwWnkyNnMwWFM4cm85WDlLV1llUWNlbE1vbklTdDM3?=
 =?utf-8?B?aEVBakZEU1A5MW82dXFOT292SmI1cDNWcXFIVWR0L2p3UFA3by9QUVhWN2tO?=
 =?utf-8?B?eFAvRzZZK3hSTnVYczNyVmZ2d2JMamRxVkl0UVdHc3gwaElNTzVkbkRxdlZH?=
 =?utf-8?B?UkhNbXRiWXY3T0VrY0J4S3Vrem5adGZ2TUJlaHFKMW5VOFlmWFRzL242OW9U?=
 =?utf-8?B?ZzdzdDRtOHJMSWFiSGZOVWxzS05zYXhOTDNvdVUybm1NcWt4RysyWlQ2KzB3?=
 =?utf-8?B?MkF5bUVPQ2tUOUtuRjFCQll1MGR6dFB2SWNxU1kzUjJ1emhMRHk3WEpEMHVo?=
 =?utf-8?B?bTdQaG9WM0FSSFFYeWFZNVdBYVlnUHBRTVp1U3NoY2hiM2FjelZISE9iNkNr?=
 =?utf-8?B?OWVRNFJiR1lDUkZ1ZnhubGlsRzVVMGYyNmhFWHZxZ0orazdHeXR0QXRISWxC?=
 =?utf-8?B?clB6RkhhZ3VqNUhOU2FudmRPdy9TVUZRSW1Xd2UzNll5Y3hEajQvTDZVQVFz?=
 =?utf-8?B?YU5EZ3RKejZ4eERZNG5vZlBPTi9zaTdpU1cxT1ZibEtIWmZBblNiRlJMbFJX?=
 =?utf-8?B?N3ZsSHBMTUtNV05UbFlzbk9SL25HTVorR0Z4MkdXN3N5SWtUa2dRVHlJcCsx?=
 =?utf-8?B?R2k5YTZzcTI5S1JyRWFIMTZnZHZBb3dmc3MvWEVGK2U0VG5VTzV0cUhRclJN?=
 =?utf-8?B?eFFqV3ZUM2tueVhrQ1NabDB3TnExbkY0aU4rNVhPUjNxU1k1cUo4T0xLbTRx?=
 =?utf-8?B?cnRjbmRKUnZKMnNQSUZ0WmFMT24rbzNZKy8yMlMxNG50c3o2U25RUXQvbk9F?=
 =?utf-8?B?eG8vSGdhekZ3L0srOFpDQjJqWnJDQlVjWDhlZ3FKaTlYU1J1ZG5ZbElsL25m?=
 =?utf-8?B?UVNxdEJJRnNJbE1HMnBMaEhyRHJZdW43a2M4a3dFd1RqMzVCVVlzN0J2L0pl?=
 =?utf-8?B?TlBBRkRyc0pCd2hkTjluRVpuSkI5a1YrMHBpL0FLNTAyTVFtT0ozNm1OcWZJ?=
 =?utf-8?B?K3pkd293WkdBM1NBS0gxQTl5TXF2VERiN21MRS9id2ZDQ1p0c2pKUHlQaWZZ?=
 =?utf-8?B?Q0Y1VmxDTG02bGZsU08waHYwQUhqMGJkMnRuWGlBTC9HaDMvak1ObXkzTFU5?=
 =?utf-8?B?b1B4cEdLMk9Cc2JDcXh3Z1pYSXBVRWFtSnFXQTd2MkhIN2JFNE03UGpiOEJF?=
 =?utf-8?B?Z1Y4aTBvdFljQ09VTXhZSjM0emNialdFMXQ0Z21yMWx0eXFlU25WZDhQVFdi?=
 =?utf-8?B?ci8vK1A0YXBPM3RGeGJnL1h6T1hzQTUva0I3Ync2WnpwNmZESURtYmFvQ2xn?=
 =?utf-8?B?M0RVaUZIOUdmZ282VjRUejNmandLcWFRWjVSWkdoVkU1azNIazJUL3NweVp6?=
 =?utf-8?B?OUlrQXhDR3FyMU5uRHhiZnBZanZYNjhZa1V2QUhBdnpIZXdHbS9VSlZMa2xn?=
 =?utf-8?B?SVovSE9pQVR0bndpaUhFS0RMVERCdlN3Tm9wVHRkbnZlTnRtOE1KS01vZDgx?=
 =?utf-8?B?eWpXajQvOG1ZM0dlTWdON0FGZXljRzZsUXhXaEorTXVzUWxMaXBHNnBBMFNY?=
 =?utf-8?B?eGxnMVhLekFoVStxSnNLV05CU0h1QXlpbUx4REp4YUxSYUllU1JpVStMNy9B?=
 =?utf-8?B?UHFlQkhiakdZZENvYkROTHNvVnRRWmhyVWdQS3dxZ3hkUEtnS1FjRmNyb0NV?=
 =?utf-8?B?dGpPL2pCR3llSHlEajFwQzdJSFJyNWJmSlhIdlA5dGNLeWM5cytGV3VWTnQ4?=
 =?utf-8?B?SUV4SnJUNnYwcVJqMUZWRDRBdVZpL05HdzB1ZXFIOHpRU25nSnpnQ1MxWmdO?=
 =?utf-8?B?dEVySjRtbm9hUDR3T0srR09sTVhDSnl3L28xVUpNZkppa0ZoQTQzY3huUUoz?=
 =?utf-8?B?TGdTOTNsdXg2RXdHKzRMWmUzeTRudlFWaFpiMG1WS3hWbURoTDhCSlJzbXZp?=
 =?utf-8?Q?1TtATVEXmxk0aVKL19wXu4hWwpncWDLw?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eWZaUUN0emRrOXR5MkxFN0NjRExXMUsxVGM3dVVSY01uamN6ZWJVY2UyYUsw?=
 =?utf-8?B?eUYwUElHdE5lWXB0b2lBbkMzZGkySWNWSStnclRXQzFMWm1ZZlJscGdRMlVi?=
 =?utf-8?B?VUtkQzlLMFc0dHllSnpHcE1aZW04TTlXNnRSdEtEYzY3NHJRTG03N1g5bXZO?=
 =?utf-8?B?ek0wUGUzbTR3UGhWbS9HWExGUFR1TkZGMS9RN29hYjJqQzdkZ1NJeElmeFJ4?=
 =?utf-8?B?R3dQb1VtNXBxUG9oNUMzS2JndzRXWURDbE1FYU1PS3NSODhNSmlMalBJcDRH?=
 =?utf-8?B?N0ptRy83WTVjVmEwaXZ0dEdEaFRSTjgrbko5cU8xTDZ5bTVmbUZmNU1odDZQ?=
 =?utf-8?B?MjNpUmJSV0hvVTN1dE1NYTlRbVU0Y3BGcEV3UUUrWkY1TFFzRSszdlBUZGlV?=
 =?utf-8?B?WXhsa3lOV3VTU3QyWGxpblV6WDZTTHdZZ3ZFYXEzNzNsQUVyY0ppSWlmaTFs?=
 =?utf-8?B?dzh2UWQ4eXp1OWNUdFUrWUV6K3M3WHA2K21pQmVLelEyYlVTMU1ucjRhSDZj?=
 =?utf-8?B?ckgvYVp4WWZCdUFnd3I4Z0xqc0k1dW5qakxNRWVlRE9jNno1TFZCNXV0SnUy?=
 =?utf-8?B?b2pQUksxV3hpenpISjJlOTdXaCtGN1dVNWVHbmVHbzJjS2hFSCt5ZWd2V1lj?=
 =?utf-8?B?TE1XNHMveFdsa0tWL1orV2QraHRxb0JHVXNaL2RUOHZjWVpHVC9XNm1IOE1j?=
 =?utf-8?B?akFwVmhCQ21mSXZMZmtZZ3IrYnAwVG0zQ05kbFBmN0lkdVZxNDEvUzBkbjdw?=
 =?utf-8?B?SE5VZXZpdERkbStZajFGNnNKMFhFTXZXYVNBMXdmbTJacklYQ2FMWElBZUsz?=
 =?utf-8?B?MkdIVWpmeWt2V2s4ZDN4QVErZXNuelh4MUpDcWdoejVuMVpwUnlhQlpJS3cw?=
 =?utf-8?B?dEtzTnlQU0Y4MmJyeFp0a0doQ3h5eEIzRHp6S1RjR0dJcWpXRUkzbSsvcUpq?=
 =?utf-8?B?RnFCV0Eyd0ZWZ090RlAyRml0bVNRc3B6aGVaQ2Z5ZlB4QVhMSnpTanNnemt3?=
 =?utf-8?B?c0taa2pXUGd0R1ByNTZ2R0s1eUVBMHpkRS9BMFMyMzdqaHdJdWtnS3FpbXph?=
 =?utf-8?B?OHBVUTB1L05FSUo1VDR5TE1FRFVIeC9ZaldTNERlQzR0YTFMZ2g3dUlIODNL?=
 =?utf-8?B?eUR4TURNaGJCRE00ZWRUMGpxSVgzOW04c0l6OWtGeG45alM4TmdTdStKMTkv?=
 =?utf-8?B?WHBnRVVpZjcvSkMyTHhGaktQZ1U2Z3hVb1FUVFlQdG9lRldEUEVkOW01ZDg5?=
 =?utf-8?B?em81alN1SmMycDNINjhvd0kzVUowU3UxU1JnQS8vNkJndUpvaE9VTHpvaklp?=
 =?utf-8?B?NzcwckdOUWl0QUIrdFdaNUx4UWlUb0w3ay9pcWNYekVuTy9La1JwVzBPcVNM?=
 =?utf-8?B?bmdJVjhhR1prOVRsVHRldE9xaWxPOHF6K29YZU1CaVRsaFNkSWdtL3dqbGZX?=
 =?utf-8?B?cVJ4Ly9oWmtKOVp3RjFyeUVZOFlEWkd5Qy9iR1YzeVAycUN5SVVrU3FaOFR3?=
 =?utf-8?B?bVhXT1pWdWhkOTE5S004Ujd2Y3BsaitnbWFqbEltb000THh4dVJwK29LL0RT?=
 =?utf-8?B?clFnWXdUclVmbU5TSWQ5bzVLcFFjZy81b3gvZmxTNlY4NUViQnE2bGtTbkI2?=
 =?utf-8?B?M1BZNytOOFNkY24rcGxrYlVCUVkveUNRaXNCZnFuL3ZmOGxucC93MVI3eGVv?=
 =?utf-8?B?cWsvU0VmZXJsMEZHNEZvM3VueWpidlNYODg1ZnVMa1R1M3J1aXJBdUxDV0J3?=
 =?utf-8?B?N0NPSnAxaFhNUEVVQzJWSXI2YXRFYWV6YndCVHlyRlRBTTUwZjVXTjdLVTha?=
 =?utf-8?B?RTN2bjh1akdHR3hhSGZWdGdOdE5RaWN1Qkl1SFVnWStlSFRZR1BicEJtOHMr?=
 =?utf-8?B?Y1dGYVVoaXhMNzNtUjFmZHFIenpTaWY5YTAydGViVE9KM0k5MDgvcjBEcFBw?=
 =?utf-8?B?VVJQK1JVbTFSWVJBbTlrUWxRMENVbEN3YjI5c3l5S2FMbWNBK3hZdXFHQnkz?=
 =?utf-8?B?c2FyM0xVR2RFSnNZbnZCWWJsbktxd0J0RGkxaVEzZGxWaUZTVytwUHNBV0s3?=
 =?utf-8?B?ODYyMGpmK001Q2dtRFc4NGozTDFlT280T1ljNEd0VDZvQ2YydHorQmxOKy9M?=
 =?utf-8?B?WDFoMjJGMldibFRCaGtjVnFWOHN1TUtLdlJoMlR4dGhPYWE1ZXlPWHo2dFJo?=
 =?utf-8?B?aEE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d38d219d-1575-480e-9312-08de0ca384fe
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 11:02:38.5095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6EkE2X9NBvyE9aHcSKhJIt2yGe/8sPxtYRhgZnAiqj75IfSKZSSOgGeyD+m8aqDntg/EZQur1aRDYMW3T+P/UuKTRZqFikM0xDLi110ILfY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11243
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 11:02:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7742

Hi Antonin,

Didn't go through the whole patch, but...

On 10/16/25 10:54 AM, Antonin Godard via lists.yoctoproject.org wrote:
[...]
> @@ -147,7 +156,9 @@ Supported distributions
>   Compared to the previous releases, running BitBake is supported on new
>   GNU/Linux distributions:
>   
> --  XXX
> +-  Debian 13 (Trixie)
> +-  Fedora 42
> +-  Ubuntu 25.04
>   
>   On the other hand, some earlier distributions are no longer supported:
>   

Weren't we supposed to remove support for Bullseye?

[...]
>   
> @@ -206,6 +226,8 @@ Removed :term:`PACKAGECONFIG` entries
>   
>   -  ``mesa``: ``kmsro``, ``osmesa``, ``xa``
>   
> +-  ``systemd``: ``dbus``
> +
>   Removed classes
>   ~~~~~~~~~~~~~~~
>   
> @@ -269,4 +291,22 @@ Miscellaneous changes
>   -  ``xserver-xorg``: remove sub-package ``${PN}-xwayland``, as ``xwayland`` is
>      now its own recipe.
>   
> --  The Wic-specific option ``--extra-space`` has been renamed to ``--extra-filesystem-space``.
> \ No newline at end of file
> +-  ``gdk-pixbuf``: drop the ``GDK_PIXBUF_LOADERS`` variable, which was part of
> +   the recipe's :term:`PACKAGECONFIG`. Instead the :term:`PACKAGECONFIG` can be
> +   modified directly to achieve the same result.
> +
> +-  Remove the ``meta/conf/distro/include/distro_alias.inc`` include file,
> +   which associated a recipe name to one or more Distribution package name.
> +   This file is not used and maintained anymore.
> +
> +-  Remove the ``nghttp2-proxy`` package from the ``nghttp2`` recipe as the
> +   ``nghttp2-proxy`` package became empty after an upgrade that makes it a
> +   library recipe only (due to
> +   :term:`EXTRA_OEMAKE` containing ``-DENABLE_APP=OFF`` by default in the
> +   recipe).
> +
> +-  Remove the ``util-linux-fcntl-lock`` package (in the ``util-linux`` recipe) as
> +   util-linux now supports the ``--fcntl`` flag for the ``flock`` command.
> +
> +   Recipes currently using the ``fcntl-lock`` command should replace these by
> +   ``flock --fcntl``.

Would suggest starting the list items with "Removed".

> diff --git a/documentation/migration-guides/release-notes-5.3.rst b/documentation/migration-guides/release-notes-5.3.rst
> index 417087e35..57f50f4e1 100644
> --- a/documentation/migration-guides/release-notes-5.3.rst
> +++ b/documentation/migration-guides/release-notes-5.3.rst
> @@ -11,10 +11,21 @@ Release notes for |yocto-ver| (|yocto-codename|)
>   New Features / Enhancements in |yocto-ver|
>   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   
> --  Linux kernel XXX, gcc 15, glibc XXX, LLVM XXX, and over XXX other
> +-  Linux kernel 6.16, gcc 15, glibc 2.42, LLVM 21.1.1, and over 300 other
>      recipe upgrades.
>   
> --  Minimum Python version required on the host: XXX.
> +-  Minimum Python version required on the host: 3.9.
> +
> +-  Host requirements changes:
> +
> +   -  The minimum disk space requirement is now 140Gbytes (previously 90Gbytes).
> +
> +   -  The minimum RAM requirement is now 32Gbytes (previously 8Gbytes).
> +

It's time I stop building on my laptop then :)
[...]
> @@ -159,6 +223,16 @@ New Features / Enhancements in |yocto-ver|
>         deployed filenames. Users can now override :term:`UBOOT_VERSION` to
>         changes the output filenames.
>   
> +   -  The :term:`FIT_LINUX_BIN` variable which specifies the path to the Linux
> +      Kernel binary in the context of the :ref:`ref-classes-kernel-fit-image`
> +      class. Setting the variable to an empty string allows use cases where the
> +      kernel binary is not included in the FIT image itself.
> +

See feedback on an earlier patch, this is currently incorrect.

Cheers,
Quentin

