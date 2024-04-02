Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A46D4C6FD1F
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 09:58:39 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.102])
 by mx.groups.io with SMTP id smtpd.web10.8369.1712051911933121485
 for <docs@lists.yoctoproject.org>;
 Tue, 02 Apr 2024 02:58:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=e3uTHNf4;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.7.102, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lxmyELkBmmMQrTn65EDNXyrPyTWSpK3nmsNOm/H0MpgzjbePCoV4VtPX+ZsiXsxYVqykOnxcIKsRyZ4BICOKnH7+tvvSuPSnPa1G3B2fgzxYzw+VKsKAdpWUSFtZnE0T4LJQbqyc4D7rJSncNtMOOvYDP0hOJgAmqI9jF2wagvYEWtEhtkqeT9F1bKS4l524DMmp8KtrEDT1SmrvyAR8xMmzYcCVsbdeSlm677+c20Otg1AJ6/tCLZh+M6AzJrs8qa+gNfkH6RiPPhKLeE5TOu9RtjsCNSe7/326QxUfXg9LkCcjYC2kVJ6CF2wks+hf6t0aJKk3qwsrhJ+TXCaTug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bMgZP+JMTVpwSANY2uqIcCO083WaDCU8rAshXatTyFw=;
 b=Lgu8+LYwTDRj6DTmipQBDucHpGIQRQkoxBLO62ZToQH6Z72EeR5ZqNUUlBDFSpEN4AeqnzGRSDxTcYR0LsgYkTq536F5LzJuTkyJIZSzpCS6v8XKFA8Cphrtn1Aj28uW5ThgHT89c2SCjraPlA2q5Gjlmf6Bl9jv8hzUHLb8O+bC+GeDef3tJKhXFbDi3hKwkrGBNNkX96fi4SWMqF+b0wPwFE+DFc4EmkwldmkbV18Nuf5zC4AN74msm2VY4uryi4aLESKOlJHJpVjuNiIu68IT/ZuJtvFp4nYtqhp32lBz/NlgcWDCiidxKY+8lahZhgcO0YCa4IQSKwDG/fdGGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bMgZP+JMTVpwSANY2uqIcCO083WaDCU8rAshXatTyFw=;
 b=e3uTHNf4IlhHFkpTUNP3pDSZ3TT9JuDhOalCOkWbhmEcS5Xa4vNzkCcoUqujpUY4Qvbd24XPaNquy+sSgzKIARJYyKLNFYmPCWl6ikFYoItlsx5FinQ2Fgs9QC+ZQPBhZZ0g+q5moqDePgQn9EQTdI1yA0gSDq3pIIIChfKDnSDK3tapegVEhuaMeNx52zoYcFQq2lpJVaXqM87RLy/yua0OaZJUza7Rg2PzE8PPan15RCs6Hmhv/LT9iaj6N5qFX8tzfBvtuTl93fnuSBwAcqrvtQmB0Rxk7gATfI2SZGNn62fHgAgQ7ZV2oa8MDdxQFkDotS+KidRhCahjGygjWg==
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AM9PR04MB8538.eurprd04.prod.outlook.com (2603:10a6:20b:435::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 2 Apr
 2024 09:58:27 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::3e70:7029:faf2:7779]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::3e70:7029:faf2:7779%3]) with mapi id 15.20.7409.042; Tue, 2 Apr 2024
 09:58:27 +0000
Message-ID: <0402377f-24e2-47e6-a28e-70be1e801fe9@theobroma-systems.com>
Date: Tue, 2 Apr 2024 11:58:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 2/4] manuals: remove tab characters
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20240330180829.1749526-1-michael.opdenacker@bootlin.com>
 <20240330180829.1749526-2-michael.opdenacker@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20240330180829.1749526-2-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::13) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AM9PR04MB8538:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	a7heyCsyTXNaAlGmAwGjJaJ+0YbnTjqT2MGlX+EXw+lh5b9CGBUE4OlRKmQoQz4RIvBjZgk6194GFV1CBr1K45Ib0cDO/T7g0j/urnDhTElKuZz0Z1WhyCJY0ywe3j5fXinenzs1WjBI8CJNzcPhiUbHhMpFpWBE3EmPgH+apBbZCMdbrQgotbx5E6h+nD7WdrRcB0ieyP6Ui0SVHkp1sXKYjJnILRXryNG1MuLHJOxNNVok5QtC9cm0MryEzuBzsDZr1bnNh2WjFydIlmFMHcGh0OSPPGLSQxv3Halp8NoleG01paQavuVGDhkXaGMngXuz+hlkcNlLBxNvp51Beu7TDSDxU+1TWP9344a0YtJYPday83sIe1I/WxJ82GoY6NruEzh3OYwaI2lMFuq05Q64HwccaJSbRqlUH/EULsWKW7n0aKqmKZbartxVN16uG0j9QM3g7lqVNYRPOGGVR4qExtVY6gDqcTboDe/W02KN1AJQnIDarDuzGtGbnPjK5iQBU5b3Y25OsbSrqYHR8ZZm9FyGYAYi6gn5Csg6/pkw6BTjm1JFisZhrVvQ8vjCqXXEVuwpgliF/LUIoJM3JVjPjfHXabChoj+d7hwIOfX/Z57TUWFtW5UZW0/w1YmVPQJ/9EXX1oNdaWHEdNov7Xgql+8tK8gfUGBP4l57x3k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?emJCVlk0MTdXUFJCSGhpcS9TTE94LzJ0S1NoUjZ4SWV0eFJETGpwQzErZWp6?=
 =?utf-8?B?MEFIWUwrcjVLUmh5QTBWOElWWThLVUF3UzE2VmNjMWowVDMxU29hUDlCNm9C?=
 =?utf-8?B?ZGl4V2hVcThrMXNoLzNWdm9QMXQxTElmTVc3T2YydGpsdmUxa0JNRXNhRVg3?=
 =?utf-8?B?VnFRNVZrZkdHQ2x5WG1TNUp6YUpRYXJMZzd1OXlLSkZjbS9XUUlpR0tMb3dW?=
 =?utf-8?B?ZWNqRjdMRGpUQ0g0clJscHhLMUNKd0IwdmJHWDQvNG95MUZaU3g0aEVCZjJu?=
 =?utf-8?B?R1V6TkJvemNtYko5TGQ3NW5uczRsVWxRUFpudXZJdURWN2JMN1FSN01iWitx?=
 =?utf-8?B?TW42cTd6MUY2ZmlYSDFWUVNXaUN4YjF3MG1LNVRibG1aUDNZNWdCclpXaFJS?=
 =?utf-8?B?L3dJNkNHbTNiMHRqNWE5dE9PeFZib25kU085b3pncFA5UCs5TnNWUTE0OTdD?=
 =?utf-8?B?WHA0am1IQmtsSzFUdThoSS9RTEJlUFpZaXFVbGF1VUJQNCtEbk51dG54Lzlx?=
 =?utf-8?B?MDI5NU4yRTA5azlFMU5ObFQ0ajhVdkpVdk1USGg5MTV5UjZsSDJINWdvUGV3?=
 =?utf-8?B?R09JN1ZWSGY5RmtqVUZhTXBjVUx1NU9YelloZWo1VDFhd1BJdzZZU2QrcmRZ?=
 =?utf-8?B?ZmF0SXM0UFFyUE9Jb3BnZDVadHV0NVBPYWJEV09NRng2OHU4bmJuY2hGUzJm?=
 =?utf-8?B?YVdSNjVDUmUvT09sQ2xodGpsS1VJTTVoMWNoU0FmaitrSWIrTXBXODdnblha?=
 =?utf-8?B?dnpUalBROGl1YzJUdFFUTXZjZjh1SkQ5TFN6VUNzV1hBRDVSWWJVVEErWUYv?=
 =?utf-8?B?VlBNZDMzSkhmMmRjcndZMForeFkyQXI5ZlBCTSs4SFV4dmxBRkx4NlB2eDBw?=
 =?utf-8?B?SjJVdDNTVm1KSHQ2aVNlenBST3dVNkoxQnNRV3ZCNnhkb081L3JLRVVCS0JM?=
 =?utf-8?B?ZXZsdVN5ZURWU0ZqZ28xdmVGR3lvS2t1eWFZcERaRlg4UjYwcFZvaEpObXFW?=
 =?utf-8?B?anFvbVkwZW9UL0FGZWtseGpvdm1ITmxoSlZYYTNIQkppMFlaTHNrTDUvTnRI?=
 =?utf-8?B?UjlqdGZyNVlNTDJCbUc2TnRTNzQ5YlFuUHlocStyVzNrcWg3MHMrTThEOGJm?=
 =?utf-8?B?cE5WbG1HeFdnUjBXSGNQVVhzaHlRaFBBQnpmd3NINU4vOW5BdjlETjJ0dFBJ?=
 =?utf-8?B?Y25BcW9PbGt3YlN0bXVKY1FKdWlQdUpBdmdHVDJMR3N3UmpwZlgwL1cyZU93?=
 =?utf-8?B?a1Y0eCtFK3V6Y3RnWmpST1lwZVRuN08yb2lkSmpCN0huNzJrWEVnVjcreERm?=
 =?utf-8?B?VXBJWkErdEVQWVhnOGlwN1R2Z0dudnVrVWZUV2RFRmhZMjZrdFFXWTRQc1ly?=
 =?utf-8?B?cndkWS93SHhjOC9VRTkvaFV5SFhwWlhhN0d3elRia2xCRTRkN1hDWVpDczlB?=
 =?utf-8?B?V2hSd0JocTVqa0hTUWc4ZWY3UnNQVDRwNFM1bDRtRElmV2Z2OUF0cTBpK1kw?=
 =?utf-8?B?RUV5UzhRbTVzQXQrZDdJdERTRTZ2emMrSnhlUXV0TkR0MnZpL09pYnkzMDlB?=
 =?utf-8?B?eGJEa1F6b0l4c0NvcGRJSStXMUFtODFPTjBNTXdnNUlweTJybEFqUDhaWGF4?=
 =?utf-8?B?eE9vMEhadDExMnZ3MnRxT2hhdk0wMFZ1cFBtZFgvQSt0M21uSjBMV0w4amVO?=
 =?utf-8?B?bUtJcWdyMXlpMHNLemErT3RadE9RTW1oV2hpekgxWmZOYW8wVTBaZnl5bzYy?=
 =?utf-8?B?UnRJbkhONmpYRGtSakszLzRzblZ5VWtYaHU2MlVPd3ZZRmx3emJ5UTdpWmQy?=
 =?utf-8?B?ckdHN041T3U1bTBuanc3Zkc5WUtiM3A0OU1Yd1NuRXNhcEx1UGZXMk1udWlI?=
 =?utf-8?B?MmVDUXRMMFpNYURFZlVSZ1RzMC9uNTRMS3NQSm4xZmcwaW9JWkhHc3hRT2Q0?=
 =?utf-8?B?N2dCSytMNTBkelBvR2dmc0FFeitnbzAyLzltb3JFb1BwenNKeDNBWnBHV1FU?=
 =?utf-8?B?MVN4VDVCVGZJeUkweVFRUUlwWVpIZlVRckllanV1U2MrbFVCQU9zWm8xd2ti?=
 =?utf-8?B?ZDB5U0d6Q3ZhOFlQbElFZ3RNUkFFc2crNlBCVmtsRW1RZ0xuc3UzNkUrcG1p?=
 =?utf-8?B?Z0NVSFlPem5SU3BvK3VYYjFvZ2duc3NKSjJqWlVZU1JhM3VIczBFMEV2OXJZ?=
 =?utf-8?Q?dMT/9U8zBXhxMHlO7tLckFY=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 110235e3-4bf0-49e1-d076-08dc52fb7167
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 09:58:27.4241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fOfG2vOLJ1GYo2t6t14f/A+6xWGplNRD0TjVDnkDij9lrhH5XHno8ZfjNV4q5k/rougazfUjt1vAW2PTWnWQsmBb72FQwCFrx676ZV44ErcHmCPmEvGq3yg/Ey2ty6eD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8538
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 02 Apr 2024 09:58:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5042

Hi Michael,

On 3/30/24 19:08, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> As reported by "make sphinx-lint"
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>   documentation/dev-manual/layers.rst           |  16 +--
>   documentation/dev-manual/wic.rst              |  52 ++++----
>   documentation/kernel-dev/advanced.rst         |   4 +-
>   documentation/kernel-dev/common.rst           |   4 +-
>   documentation/profile-manual/usage.rst        | 114 +++++++++---------
>   documentation/ref-manual/terms.rst            |  10 +-
>   documentation/sdk-manual/working-projects.rst |   6 +-
>   7 files changed, 103 insertions(+), 103 deletions(-)
> 
> diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
> index f7929e630e..6e4f137e6b 100644
> --- a/documentation/dev-manual/layers.rst
> +++ b/documentation/dev-manual/layers.rst
> @@ -501,12 +501,12 @@ the "meta" layer at ``meta/recipes-bsp/formfactor``::
>      INHIBIT_DEFAULT_DEPS = "1"
>   
>      do_install() {
> -	   # Install file only if it has contents
> +           # Install file only if it has contents
>              install -d ${D}${sysconfdir}/formfactor/
>              install -m 0644 ${S}/config ${D}${sysconfdir}/formfactor/
> -	   if [ -s "${S}/machconfig" ]; then
> -	           install -m 0644 ${S}/machconfig ${D}${sysconfdir}/formfactor/
> -	   fi
> +           if [ -s "${S}/machconfig" ]; then
> +                   install -m 0644 ${S}/machconfig ${D}${sysconfdir}/formfactor/
> +           fi
>      }
>   
>   In the main recipe, note the :term:`SRC_URI`
> @@ -582,10 +582,10 @@ Directory`.  Here is the main ``xserver-xf86-config`` recipe, which is named
>      ALLOW_EMPTY:${PN} = "1"
>   
>      do_install () {
> -	if test -s ${WORKDIR}/xorg.conf; then
> -		install -d ${D}/${sysconfdir}/X11
> -		install -m 0644 ${WORKDIR}/xorg.conf ${D}/${sysconfdir}/X11/
> -	fi
> +        if test -s ${WORKDIR}/xorg.conf; then
> +                install -d ${D}/${sysconfdir}/X11
> +                install -m 0644 ${WORKDIR}/xorg.conf ${D}/${sysconfdir}/X11/
> +        fi
>      }
>   
>   Here is the append file, which is named ``xserver-xf86-config_%.bbappend``
> diff --git a/documentation/dev-manual/wic.rst b/documentation/dev-manual/wic.rst
> index aeecd0dd3e..a3880f3a1c 100644
> --- a/documentation/dev-manual/wic.rst
> +++ b/documentation/dev-manual/wic.rst
> @@ -139,20 +139,20 @@ individual images through the ``list`` command. You can use the ``list``
>   command to return the available Wic images as follows::
>   
>      $ wic list images
> -     genericx86                    		Create an EFI disk image for genericx86*
> -     beaglebone-yocto              		Create SD card image for Beaglebone
> -     qemuriscv                     		Create qcow2 image for RISC-V QEMU machines
> -     mkefidisk                     		Create an EFI disk image
> -     qemuloongarch                 		Create qcow2 image for LoongArch QEMU machines
> -     directdisk-multi-rootfs       		Create multi rootfs image using rootfs plugin
> -     directdisk                    		Create a 'pcbios' direct disk image
> +     genericx86                                 Create an EFI disk image for genericx86*
> +     beaglebone-yocto                           Create SD card image for Beaglebone
> +     qemuriscv                                  Create qcow2 image for RISC-V QEMU machines
> +     mkefidisk                                  Create an EFI disk image
> +     qemuloongarch                              Create qcow2 image for LoongArch QEMU machines
> +     directdisk-multi-rootfs                    Create multi rootfs image using rootfs plugin
> +     directdisk                                 Create a 'pcbios' direct disk image
>        efi-bootdisk
> -     mkhybridiso                   		Create a hybrid ISO image
> -     directdisk-gpt                		Create a 'pcbios' direct disk image
> -     systemd-bootdisk              		Create an EFI disk image with systemd-boot
> -     sdimage-bootpart              		Create SD card image with a boot partition
> -     qemux86-directdisk            		Create a qemu machine 'pcbios' direct disk image
> -     directdisk-bootloader-config  		Create a 'pcbios' direct disk image with custom bootloader config
> +     mkhybridiso                                Create a hybrid ISO image
> +     directdisk-gpt                             Create a 'pcbios' direct disk image
> +     systemd-bootdisk                           Create an EFI disk image with systemd-boot
> +     sdimage-bootpart                           Create SD card image with a boot partition
> +     qemux86-directdisk                         Create a qemu machine 'pcbios' direct disk image
> +     directdisk-bootloader-config               Create a 'pcbios' direct disk image with custom bootloader config
>   
>   Once you know the list of available
>   Wic images, you can use ``help`` with the command to get help on a
> @@ -282,20 +282,20 @@ following two locations::
>   Use the following command to list the available kickstart files::
>   
>      $ wic list images
> -     genericx86                    		Create an EFI disk image for genericx86*
> -     beaglebone-yocto              		Create SD card image for Beaglebone
> -     qemuriscv                     		Create qcow2 image for RISC-V QEMU machines
> -     mkefidisk                     		Create an EFI disk image
> -     qemuloongarch                 		Create qcow2 image for LoongArch QEMU machines
> -     directdisk-multi-rootfs       		Create multi rootfs image using rootfs plugin
> -     directdisk                    		Create a 'pcbios' direct disk image
> +     genericx86                                 Create an EFI disk image for genericx86*
> +     beaglebone-yocto                           Create SD card image for Beaglebone
> +     qemuriscv                                  Create qcow2 image for RISC-V QEMU machines
> +     mkefidisk                                  Create an EFI disk image
> +     qemuloongarch                              Create qcow2 image for LoongArch QEMU machines
> +     directdisk-multi-rootfs                    Create multi rootfs image using rootfs plugin
> +     directdisk                                 Create a 'pcbios' direct disk image
>        efi-bootdisk
> -     mkhybridiso                   		Create a hybrid ISO image
> -     directdisk-gpt                		Create a 'pcbios' direct disk image
> -     systemd-bootdisk              		Create an EFI disk image with systemd-boot
> -     sdimage-bootpart              		Create SD card image with a boot partition
> -     qemux86-directdisk            		Create a qemu machine 'pcbios' direct disk image
> -     directdisk-bootloader-config  		Create a 'pcbios' direct disk image with custom bootloader config
> +     mkhybridiso                                Create a hybrid ISO image
> +     directdisk-gpt                             Create a 'pcbios' direct disk image
> +     systemd-bootdisk                           Create an EFI disk image with systemd-boot
> +     sdimage-bootpart                           Create SD card image with a boot partition
> +     qemux86-directdisk                         Create a qemu machine 'pcbios' direct disk image
> +     directdisk-bootloader-config               Create a 'pcbios' direct disk image with custom bootloader config
>   
>   When you use an existing file, you
>   do not have to use the ``.wks`` extension. Here is an example in Raw
> diff --git a/documentation/kernel-dev/advanced.rst b/documentation/kernel-dev/advanced.rst
> index bcaaaeed14..4c463503f6 100644
> --- a/documentation/kernel-dev/advanced.rst
> +++ b/documentation/kernel-dev/advanced.rst
> @@ -303,8 +303,8 @@ The following listings show the ``build.scc`` file and part of the
>                           .
>                           .
>                           .
> - 	        char *dump_write = NULL, *files_source = NULL;
> - 	        int opt;
> +                char *dump_write = NULL, *files_source = NULL;
> +                int opt;
>         --
>         2.10.1
>   
> diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
> index 0cee503346..5d8d0d45a9 100644
> --- a/documentation/kernel-dev/common.rst
> +++ b/documentation/kernel-dev/common.rst
> @@ -1674,10 +1674,10 @@ looks much like the one provided with the ``hello-mod`` template::
>      SRC := $(shell pwd)
>   
>      all:
> -   	$(MAKE) -C $(KERNEL_SRC) M=$(SRC)
> +        $(MAKE) -C $(KERNEL_SRC) M=$(SRC)
>   
>      modules_install:
> -   	$(MAKE) -C $(KERNEL_SRC) M=$(SRC) modules_install
> +        $(MAKE) -C $(KERNEL_SRC) M=$(SRC) modules_install
>      ...
>   

I think this is actually incorrect.

Makefile indentation is tab and not space, so this won't work. (This is 
not the only piece of Makefile where this new indent shouldn't be used 
though, so please be careful about others).

Cheers,
Quentin

