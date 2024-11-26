Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6403D59D92
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 10:12:31 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.47])
 by mx.groups.io with SMTP id smtpd.web10.42430.1732615949391766390
 for <docs@lists.yoctoproject.org>;
 Tue, 26 Nov 2024 02:12:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=aNjZ5WKv;
 spf=pass (domain: cherry.de, ip: 40.107.105.47, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Njhwb2F31JLUKkF1qr9YKZlksooDHw2CeMheEmkcfdc3Q94ies6U5oRliVTWx397EauEpPqaKSqPKnOJsJJaKI7p0hBYYYicfdXYBxUKRQfYwUrNnfYENPbcVGV1p43i7EhrvI2xtu4T+9MED33SUwabOyRNKu/O4NQeXQsZk05AIIll3hUDCgPXqS8SXuVp4noPU7yTJQcSUNJlGKO9j6zeF/6LWvyhl8xF02p3sWx0yxE7ARnjDXuU4VDlkoDDTGOm4pzq8FkrCAmKbdiO/PMrIPW1nBoGQIJe4fNhFU8nwL07u9NzMVuebczlDQMi3UCOSQ9MshV5noB9S3TNYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PhXLe5yM07bnZQo2q1Wdv27GuLRRirdKC5rfsfqtewM=;
 b=MK53Z3FKUZ0jrFDjYKHnptRF64sn/zqZ+X65r8WgyD2YZpt+snC9y2Q+kMDD41dIUyqt3R5FaA51swhAX5o2b/bZfKZZxboAbSAvqTc10DeF53ys5c8bmEi1EU3sC2iHORoffUHKZ1w+J8AKn9Vv0vKuSgd1dDjsVgAj9rZaQ4LjyT/Td7I6ELpG4gM1HrZcxXh4Dsf8idv16owQiKmuoLRIMoAkEBhXX+1wo0HNORLva8keszQKdLneNr3lwuFXovMHpV162oYI7Pgn4ZqBO2hLuSZTdn+a7yyVHipKMH1RCkCxs3w97/GhKxWAilhUFi5Ej7RsuXRnJZLMv2t3fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PhXLe5yM07bnZQo2q1Wdv27GuLRRirdKC5rfsfqtewM=;
 b=aNjZ5WKvqQW7Yh1wzVYBN9iMz/PN0EMaK8fDW0G9ztP6+QHV38SrskqZSgzbX5AiISKxDJNxQohGB1ndYA8qPL9nQmqHFCjg5BgR/shgZMpVOlDCDXy1zcD9FirTXtYypZpxCdz1F6CC4zKuoDqlxGv5N9ca0F3LR3xBw94bxek=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DBAPR04MB7381.eurprd04.prod.outlook.com (2603:10a6:10:1a2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 10:12:21 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 10:12:21 +0000
Message-ID: <010f00b9-36d1-48be-abfd-6f520909c5e9@cherry.de>
Date: Tue, 26 Nov 2024 11:12:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] classes.rst: add documentation for uki.bbclass
To: mikko.rapeli@linaro.org, docs@lists.yoctoproject.org
References: <20241125153415.282847-1-mikko.rapeli@linaro.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241125153415.282847-1-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0033.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::13) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DBAPR04MB7381:EE_
X-MS-Office365-Filtering-Correlation-Id: dc4b4ffd-859b-4fd1-beae-08dd0e02d0fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YUJZbWdmTkhjZVBXdXJKRDJMZnpBY1VQeEVhaVdwRVVaRS8wU0hCVnI2LzJo?=
 =?utf-8?B?SnFWQitpbm56MnhhVFE0SDlKTzdsdWRidWExVjllWEdXa0o0bllhcFRUbHJR?=
 =?utf-8?B?R3lieTQyWk5ZZHNiNUxud2pxSU9vMnFUK1A0bEhFTWJrYmFrWS9iNTErdnNL?=
 =?utf-8?B?VGVOYmtnV1hwcGQreUFFU2JMMUhaZXE1VFR2YzVvU3doeU02VFZMYnZzcks5?=
 =?utf-8?B?ZFkzQVJKOVlKOE5ET282L1M0Q2ZncElXejhOMm92MzF4WlRqQ3c4UzBid1Q5?=
 =?utf-8?B?RGxTM3J4M2R5dk5idFdRWU81MTNoRXNBSkh4MU4yLytpVnplQXZiUXFZZGhD?=
 =?utf-8?B?KzdhUDFlR3RPMmJXSXEyQitDbWIyZnpzVUJMR240L2Uxd0tsTWZDUE1FS09D?=
 =?utf-8?B?OXZVb0ZjaFNKZmpuaTNSVEVrS2lhTTlZSjZMVGZQcnNjNWtOQk9FSFRzNGsv?=
 =?utf-8?B?VThES25odFcxaDRBbWNhN05rVkFRNEpESFRCS25XOHM3ZGEvd09BQnU4WHZh?=
 =?utf-8?B?dXN1QkhqTFVIL2QwbFpHWHRDOTdNczQ1Zk9pbHlKenk2VWRsS1JlSmptc0d5?=
 =?utf-8?B?dGZabDJWU3ZDdVlwWWZreU5sQjc3TUx2UEE2T29WRzNNYnJjdlZhMWREdU9T?=
 =?utf-8?B?RE9xN3FmQnhrbkxXV2Rrb1BpUnZRWlc2Q2kyRnFlTmZaNjBIbUUyTXcwM1o1?=
 =?utf-8?B?TlN5cjNhcXlrdTk3NThiaTFWbStxTWpBT1Z2Wm41QjQrMnR0YnV0QkhSbng2?=
 =?utf-8?B?T1BISGQvWjBIckxjbnA3RnNTeVJEZnFVYi9UOSt5OWplU0Q2eUo4Nzh3MmRN?=
 =?utf-8?B?M1oxc2NzU0JaZXVGZW1CangyanZCUGMybE5HZ3l3ZWhRTThodXRDTGpJWHB0?=
 =?utf-8?B?RUs0aysvVUF2M05XdW41NFA4bGJjUjdaY3BtN2taRUFwVWlsdUcxNW1laEEx?=
 =?utf-8?B?ZmxNVEoreXNjRTc5azZOMCsraElEczROclJrMll4dEVNdjBjS0hLOURuMGhO?=
 =?utf-8?B?Z21oU1Y3THJ4U0JLaWN5MGVUOXVzUTA2SWwvMTRabm9tQVhEb2pJOFNKYm1k?=
 =?utf-8?B?YVM2VTdJMlY4eEovZlJQYVllVGpVbXMvemdwSDFUbmY2OGJYc0htQ1JjSVQw?=
 =?utf-8?B?eTQ3eDBFQnloVEphYkIxK09TZEhWa0N4c0Z4cWF4dTFzOEZaMlV1b2gwRGlv?=
 =?utf-8?B?TEVqMWU1R0NOVEVZYXNnTTdJMnVRQnZHd0laVVV2WEZXMGdxN1N0c2p5YWlL?=
 =?utf-8?B?YTBtNUNvbnlyZno3RS93UnVKS0doaC81ZExwdVdwWkdqTWMwbHdBQUg2Mmd4?=
 =?utf-8?B?ZnY3OVdMMVhoVFlIalVEelFhWkpvczFGdWRQbTZsRlA0d0toL1ZFRHNhNVlV?=
 =?utf-8?B?dDM2YVRCY0I3WFoxaUFYR2ZiYnRQSWppYy8rcXZXeGlYVzJMQlVqQktERW1h?=
 =?utf-8?B?cmlWRmNlcnRwVGRrWnpRSTJreFBKM09pOHo4ZzlEQ2pJOU91d3R3QkxkTnhr?=
 =?utf-8?B?ZGVhZHZJV2hISVNTbE5KRjRkYjZqWVpROC80aEdhTHVna3B4WEhmbnMxY0sr?=
 =?utf-8?B?anpFV3l4VEcwZHpyMUh6TWZRUXg1akg2UEQ5Sy90V0tpZHRVMzZVQmRxWXBs?=
 =?utf-8?B?QkllV0k0QThUQmVEYUhQYWV0TDh3QlBhYWlXclZ0WHV6NEhQdHdMVnRHMERj?=
 =?utf-8?B?S21nNWRHcE9sK3UzdThHSnhPRGxlNllMVVlHbUNSWDVNV0FFbU5ucVNGMFNI?=
 =?utf-8?Q?AoS4uCJWg/+QWt/9aw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UE5SdmlMUjRZV1hHK0VhUzFBQlhrWitiRWVOOURsMmFmQjBuZHQ2N3N0WjlF?=
 =?utf-8?B?YzE5cWdhUy9iUFQwSG56Y3h6M0h1LzY3N3lvcXh1L3M4aGdEclFUdzR6bUh5?=
 =?utf-8?B?WkJZc2JCeDFTMk5ka0o3WFhGRVU4SmZRaXBNVlpxZTU3WGJpNDQwZHdDc05i?=
 =?utf-8?B?R1JHTzhhV29kWGUxNnNkUTlOTEY4ZnVKK0NGRGhqM2t0UjlGQzZrOElxa1FQ?=
 =?utf-8?B?Vzd3U1FqMTJTMmFTNEN6V2tqSEYxQWUzT1ZLQnk2ZG5tUHFhSDR0QWI1QUtu?=
 =?utf-8?B?VEk3WFl6TEk2NEhrMVZLV2pZd2k2MzdvQmJvOFZuOW1kNHFjbVVCTzVORDNy?=
 =?utf-8?B?V2JNcEpXMGh6WlA0NldPMXpMQTVEVExYaHl4S2xOM2RoaUs4djM5NEZvWW9G?=
 =?utf-8?B?VWJ1SWhIM2N3bGQyU2YrNHhXQitDR1hrZ3RySTRFbmlnZ3M2REp0Qk9jaFlM?=
 =?utf-8?B?dS9ab0ZhWjdIcUVXOWNjMzRvSTQ5M0sxUmdUaFZmNUN3aUpBZjV4NkFoYlZG?=
 =?utf-8?B?S3VGd0g0bllxTHhEWTNjSjZJcDhUODJtZ0wzQzhQV0N6THBmMnhqNGZlcFF1?=
 =?utf-8?B?MTZiVmRtNEZ4RXF3d1kyQ1FkeThpSyt4eEpycXpRUG9KdWl0enE0MnhjYlQv?=
 =?utf-8?B?czVxeGNvOURTcDRQMTBFd0NWdnc0VlphUnpKVjhCdWRyTFN2TjR0ZjcrWlV4?=
 =?utf-8?B?bU5YOXhYb3hHUEtoOVd2WnB5QklSTmY0UEtSQXdPRHVyY0t5RkhERlZGVDlT?=
 =?utf-8?B?M2pXMGtZUmZnWlUxajJKcXh4SFRzN1NwWTZOUmtQV2JxRkpnSVZueDY0Y1dW?=
 =?utf-8?B?VHBkMVBEc1ZKNTZKckhBUFpKY1pDVXhBQTdWNVFzWWZPeEtDdEUvNjVlSVRw?=
 =?utf-8?B?azlIMHM5YjRjazhKb2hUV3RpK0wreFRBZDFXTUZaMU5mdm1TUEJGeDBRZ1pP?=
 =?utf-8?B?dUhuSUZ6SnhveGcyUHg0SVRrVjA4QTRSaEJld3R5Rno5M0gzVlNwTDRwRTdN?=
 =?utf-8?B?TkthM2phdkhRdXB3VC9JT2EyNzlqVDRkS2M2NUlSSHF1TUh2eTNzejRqaFRQ?=
 =?utf-8?B?b1l1cElTcUE2YlpjcW5iUHlCZTczKzJ0S3Z3TjdXMGliQ290MmdVWnMwL3g3?=
 =?utf-8?B?M2R2V0d1UEtYS2htRHY1ZXlQL3hLUHprV0JhSlNhZEZjbGx5VWlIcDNLT1Rv?=
 =?utf-8?B?a01kL0VuTjI0cWdUVzRuT3JORjF3MTQ3dzlsNTkzUWl6VWJaN3I5V2JKSUxm?=
 =?utf-8?B?MDhEWEV5a3BSNDBWazI5UFZ3RmRRMng0TWJrNXNuaGpHQlE2RGt6WlpxOVoz?=
 =?utf-8?B?V2d1WVZ0dDB4QnlRWlN0c2RWblVycGd3cFpaUFIrYTczbmRQVlc0djkxeE5V?=
 =?utf-8?B?UDUxcUdMb0RXb0ZNZFB5c0ZNUzVtYnlsTldEcXdmZVJWRDRHK1JQeTA0cURR?=
 =?utf-8?B?cGRHa2dlWkdRRXFnZjlwZnhsaTdXbjExckN5ZVVva1BlcWtpUlZ4SUdpenJu?=
 =?utf-8?B?MllHOVA1MlVrc2wvT0RDN2tRSENZUnlwUjhIcm9PY29ZOFUwVTZKUCt0L1Ns?=
 =?utf-8?B?WmdhQi9jVGdWdXd0TllmcU9zVlBIWkhkdjIzTlFuSU93UHJyU2krdGszMzVR?=
 =?utf-8?B?STVtZDF6VmhrM0MwMXNHQWJ6MU05eGZXeGlHak5IeE9SKzlZM01jaU1ZanlL?=
 =?utf-8?B?MGs4enNhUTdSeGpYN2M1ZGJ5T1lSNTk5aTY3RnBHZjAxenErMnBlQXdwdm03?=
 =?utf-8?B?VWRmY2wwUzdwSnR3RUpBSFNtelNHcVhKWEJmZmtDcmppYjVhdmNmU0RKRXZT?=
 =?utf-8?B?SHNrRWtTYWc0ZVM1eXJBN1VzaDBZSVBBZHpaaDArUzczQXBBeXloOFJLRVlu?=
 =?utf-8?B?QklsV0VnR2U1NUZ6NnlQeGlDQWZ0dWxIRmNVSUd4N0JhTzBycFVnQ1JORmcy?=
 =?utf-8?B?MFE5Rk5kTllYVmNhelcxTnl6SW96Y2h1ck1lemMvY0s0alNWMkxVYlNPVkJQ?=
 =?utf-8?B?aWVNV0JJWFpVZm9ROExEcWJ1R0ZwOGJmRDArVDdOcjZyakxacUVvS1VIUkY0?=
 =?utf-8?B?RHNyVkdGc2IrSkdkNnRXN29tVmV6eFBQa0grUGtRdm5Ka0FTVm53RmJqUWRB?=
 =?utf-8?B?MjZBT0NxN0xmdkIwQmx4NXp3a2hqVWVoOFBKL3loS2ZkUVprUW1qZDlrckR2?=
 =?utf-8?B?elE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: dc4b4ffd-859b-4fd1-beae-08dd0e02d0fb
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 10:12:21.6816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QoImh8RVPoCXkqVFlDJld1L4VqU5LmWio1D3YU/Z3yAik5IN3NFnI4FzwH43LmVVYwm4YOnqExbLFzMMm7zmyCJO3n+lWrHlkXv9G7DvMhU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7381
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 26 Nov 2024 10:12:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5816

Hi Mikko,

On 11/25/24 4:34 PM, Mikko Rapeli via lists.yoctoproject.org wrote:
> Documentation for the new class.
> 
> [YOCTO #15650]
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=15650
> 
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>   documentation/ref-manual/classes.rst | 34 ++++++++++++++++++++++++++++
>   1 file changed, 34 insertions(+)
> 
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index b92f4e4f20..901d455f09 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -3345,6 +3345,40 @@ and the `signature process
>   See also the description of :ref:`ref-classes-kernel-fitimage` class, which this class
>   imitates.
>   
> +.. _ref-classes-uki:
> +
> +``uki``
> +=======
> +
> +The :ref:`ref-classes-uki` class provides support for `Unified Kernel Image (UKI) <https://uapi-group.org/specifications/specs/unified_kernel_image/>`__
> +format. UKIs combine kernel, initramfs, signatures, metadata etc to a single UEFI firmware

s/initramfs/:term:`Initramfs`/

> +compatible binary. The class is intended to be inherited by rootfs image recipes. The build configuration
> +should also use an initramfs, systemd-boot as boot menu provider and have UEFI support on target

s/systemd-boot/:ref:`ref-classes-systemd-boot`/

or

s/systemd-boot/``systemd-boot``/
as we're talking about the binary and not the class.

> +HW. Using systemd as init is recommended. Image builds should create an ESP partition

s/systemd/``systemd``/

> +for UEFI firmware and copy systemd-boot and UKI files there. Sample configuration for Wic
> +images is provided in ``scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in``.

Provide a link to it, c.f.

:oe_git:`scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in 
<openembedded-core/tree/scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in>`

maybe?

> +UKIs are generated using systemd reference implementation `ukify <https://www.freedesktop.org/software/systemd/man/latest/ukify.html>`__.

s/systemd/``systemd``/

> +This class uses a number of variables but tries to find sensible defaults for them.
> +
> +The variables used by this class are:
> +
> +-  :term:`INITRAMFS_IMAGE`: initramfs recipe name
> +-  :term:`INITRD_ARCHIVE`: initramfs image file name
> +-  :term:`UKIFY_CMD`: `ukify <https://www.freedesktop.org/software/systemd/man/latest/ukify.html>`__ command to build UKI image
> +-  :term:`UKI_CONFIG_FILE`: optional config file for `ukify <https://www.freedesktop.org/software/systemd/man/latest/ukify.html>`__
> +-  :term:`UKI_FILENAME`: output file name for UKI image
> +-  :term:`UKI_KERNEL_FILENAME`: kernel image file name
> +-  :term:`UKI_CMDLINE`: kernel command line to use with UKI
> +-  :term:`UKI_SB_KEY`: optional UEFI secureboot private key to sign UKI with
> +-  :term:`UKI_SB_CERT`: optional UEFI secureboot certificate mathing the private key

You cannot use those here as they aren't defined yet. You have a 
circular dependency between this patch defining the class and the other 
one defining the variables, just merge both into one to get rid of it.

> +-  :term:`IMAGE_EFI_BOOT_FILES`: files to install to EFI boot partition created by ``bootimg-efi`` Wic tool
> +-  :term:`EFI_ARCH`: architecture name within EFI standard, set in ``meta/conf/image-uefi.conf``

Provide a link to the file?

> +-  :term:`KERNEL_DEVICETREE`: optional devicetree files to embed into UKI
> +
> +For examples how to use this class see oeqa selftest ``meta/lib/oeqa/selftest/cases/uki.py``.

Provide a link to the uki.py.

s/For examples/For examples on/ ?

Cheers,
Quentin

