Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53642109B471
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 13:53:52 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.69])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20912.1774965226132413432
 for <docs@lists.yoctoproject.org>;
 Tue, 31 Mar 2026 06:53:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=DOMVytbF;
 spf=pass (domain: cherry.de, ip: 40.107.162.69, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UbsxszqI9qYNU4kTBMreezqD61AXWjZ89q9R7k4f9674jTlzQFuV0NcaJasm3ZM3urO3XuD3Tl+VUbt6Rl+EMKGsv/SReRxqFYuS94f7zGz13nd/7iVluPQ6ASdhOVffaLTG1ORFIKelmR+UamG2OwBU3ZNBM+uitIM8t+qhSmsd7B/ZKqsG/vr/EFNrLYO3Kr065CAWRRbxGTlpH7Pi5OnKjJ1azhCEpqSU7B+kCSV3n7w25uiHbo8Vyf4ceQuSbkN7shYr25G5wIPLo6wKp6HR6+iaM/BMq9XLFxchAftqsbKCWiMkzPoAOTd+xanABE0FwiOwr2FpUYR5/+8UaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yacn2G5kVTSk3cgtaeQTk9F7xBAgXgWOIBM3FjLwS9o=;
 b=YCDS5I7GpgKx2pArA+Folt8wAYZJOJT/aLE/NDLniDXouy2AHlEz//2entwM5hjR3hQ1RW/Fag2DeVrUg12qIiuKeZy+2wii697yHZlYgArv+sMgD05PTDEqA3uDkrphqUxIC67qhcst40P/KOxxr8sn/HAYLPMvof1K2mcJdX7xOq7EwttfBhXXimkMPs92BnBJMCnO9gQzp6giOCW/cqjU5XppDtiFFs/j74lvPINOkEqzrbRp310ogRHLr6/fuiDD+iNF6i4id2u0uFWTT/bwnh/eE0HIdW+3vpojXbnmsTrTfTQ7XjVxN/tTElTyNoLfhxOpU5fTeG2Addv41g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yacn2G5kVTSk3cgtaeQTk9F7xBAgXgWOIBM3FjLwS9o=;
 b=DOMVytbFz8EgFDesqAVjg2tckjUtobAZ129oP0N4xSzrOsyogrNFbmjgCaqXHco0E8OLPLyk/HkMDylzaAQYef9D22UbxMoX80c+fueeGyRWsM16eH8hmNS0o3oRcA6znBUFNeSvcSNeVXwr8lVe3Q6uXJkgkvwkovewSUPVHDM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by DB8PR04MB7082.eurprd04.prod.outlook.com (2603:10a6:10:129::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 13:53:41 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%4]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 13:53:41 +0000
Message-ID: <9df0de4f-4a56-4c79-8d0e-fac5b26087fb@cherry.de>
Date: Tue, 31 Mar 2026 15:53:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [RFC PATCH 1/1] ref-manual: add boot architecture
 documentation
To: jon.mason@arm.com, docs@lists.yoctoproject.org
References: <20260331122924.54516-1-jon.mason@arm.com>
 <20260331122924.54516-2-jon.mason@arm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260331122924.54516-2-jon.mason@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR4P281CA0164.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::11) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|DB8PR04MB7082:EE_
X-MS-Office365-Filtering-Correlation-Id: dfab2291-45bc-4c4c-a729-08de8f2cea7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	Z/Ba+WMqNjw5pfEwF8Az7Lqt5sziRDdTlm4K3k6I4RTvqkXh5wuyA3Skv1p7Vm7kHXx1OLhs+kNHneIS5CEl9nGa3Yolc8RUE7xGzaC30HUJSFCG1v2dTaQYgdD4++sPFk21XhnBEK14Vj/0HZByak1Gtd95Uvyo1EayD7+xf9HmOghDmpUeSPSgwTr1RecC2/G/wpcgzpDBNOnF5nC2sAhw3RbJlfQ6AXasPZ69ucBHZ+SLjrxvbLNfcUdh7/u9UVmf1zbCyFnc1xoPZFcCGtGWFokWwEbphoyg3o94TyZ/QW6EutOeOE0HchWtimsaq82CZHTR4Va2WfPFyAbQRsMm94gUFiXGi/b04Cxkwe4nBoU5wWnX/jMxz7TeSWesUGvKhxXDJ5D8Sg6ZYm/LDfi6t9TKKf5YIYUwuCYNOtNiF7mw0PoKsNt7H/v0iQVA46t5DcYe3KgDIJNQ7P2BVu0q6N0voW+HrQQWAGaIjE0NgBxBqM7a6qtRbrsHKsaJGpMZKsbQq8t8i07Kdtl/OOZx+fmwb0s28BQRs8lJPBCdXKynUFKe1URWKgKiQEMPjEhEhZ9rupFlmK20xMrCn01gtdGTZvpsJ6/lhAxMWACo4OVvoMQPRle+lOaRS0zY5t4PR0ernd8rDKeGxs/HSPDX4MRSGI/WTuHRLtbHMdmZ5zy5Kh5tIRa5xzkABmi9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sFujz14iuolEbnXAX73UaFz7Fi5iTV8zLNfTFSM+nsc1/taM4vQNhtqUWm1u?=
 =?us-ascii?Q?s94JAGsyoAE3VUvvZo5uPs2FgH3loJEJKoV/6BiaPR2xMuaAJOJ4IyaiH44y?=
 =?us-ascii?Q?vBB7zCNUY1Y7gDNgwrhHtey8vG4lnAqHY7HGkbisxs2470PDtdWuumCW+mN1?=
 =?us-ascii?Q?13ycq1hWLHwObJEG+KJMOoQCxKZaGY/ekpY56tnbX03tV1VrSmkn7Z7foPFr?=
 =?us-ascii?Q?LRRRmDHvB+cUHKNDFFNdCaC3+2aTARyp82RrbLgia6jYGS7aRtaV7jcDOrxQ?=
 =?us-ascii?Q?OX1bzxw/czHEzI80jyOlrAf3JR8BDkEIIhnBTgfw7+QzAU4n7W6OoDrKsgdc?=
 =?us-ascii?Q?RJUDaRc14LnYAvk0HyZR7iEIDjJXykOL2Kd8ohxKs04/NvhkaiVa2LjLQeBC?=
 =?us-ascii?Q?UrwQTfyE/qhO8LbDtNfEdSThHew8lb+OFV8FtUxrWMlJRX9HEsnXWKBcG6WM?=
 =?us-ascii?Q?W9WwWmFh52wS0AiAD7DmyhpEDwTDhNzDCGvk2moW0poM+bYeST+FXQM8cIjQ?=
 =?us-ascii?Q?Ur4O1bqrUUxfttyPDa7rhSyEreJ8DsRLY/4N4B/QPYqRXWo8GWJwu8lTqJDu?=
 =?us-ascii?Q?4ELNG1T6MCI+2tYafAodMBb7Ri6jiaRwyc2LmQL4GWU8/k//rsvuHHrIdEkG?=
 =?us-ascii?Q?xi5I5KO9jDGaDQ7p4iXWrT2+okLQCxgLcStXaP0zQeDgAuIeXE2kcTyM1u8S?=
 =?us-ascii?Q?yJK399e5Wu2UUJzoHDFhujHbUJBSMyvBSmmWoiGp6+U61lh4QHWXoTbms8kq?=
 =?us-ascii?Q?aZ103L+ii7UQk3NPwdGiRSRXPTN+V1bhG0qTe6noGqDAK6Z51gojtcw3TvKd?=
 =?us-ascii?Q?8ZjK+Rzz3NSt0xA9mS8yILeoucsoyWZQl2TNzmQR6EeEzEq0zPn6rNdEDXo4?=
 =?us-ascii?Q?83SPm8uwPZpYBi+6OG8uKb9AZ+eFLdYS8qv1WvD8hTSjg3/243rOMDo9RdzN?=
 =?us-ascii?Q?klLPPM4ByFfvLSsQqUqK6MjIhKh9x7aFkj76e314BnJEwZVlTkADJtpQu0fa?=
 =?us-ascii?Q?RmW7dSRmhO8DNkkIRirtqF/Gc3rojGIPlP+agz8dd82LZZAoEdWTcKe6kpN5?=
 =?us-ascii?Q?gsCx5SE3z/HDMutpuf5bcNPVbenlg7Rg3ABU3a3PNjpZoukL8KTh3rbHuhXI?=
 =?us-ascii?Q?LiqfHR89gUxIqGLXgEB1agQtv7VG+qUSlFO7uJmlZvJ0RdrSvAg65K3BUr6d?=
 =?us-ascii?Q?86ogqnjYpeGgH192KEXv95oeZ1DmuJHweYag4FXj6tZhhvO3waA9iZDMizM0?=
 =?us-ascii?Q?JZFgxOumIuRiyWC9/aox480IVlb/hV5nZ14atNdPzovG/6DEeASziUA7/zU/?=
 =?us-ascii?Q?qu8sOebQg5w2uz0eQYiqhWGpCJOd31+DB3AWN7d8r+TcdrN9OP6MM/tBAvKU?=
 =?us-ascii?Q?1Z0teuWXuEz+/WKqHpcC0te7Jwpqz0jsLQX6RFEkcZCf49n5/kKTrA5pzKwS?=
 =?us-ascii?Q?yaVjPBllv94YRsM6j4YK1t4KUIsOivHits5ed1u+FT7HPeY/hdqU7d6BfkeD?=
 =?us-ascii?Q?iMDEC7in+HSKh7ZTh953aJGGT8ilssXmGQaU7pqlYZm0/oLWU3QsF7WhGCfH?=
 =?us-ascii?Q?/8m5FFKIZzNpfR8Q5ik2j1JV7Id5CjhdhPLtvDzp82gqZ29d6K7CTcscyRLR?=
 =?us-ascii?Q?na1R+YoC2JtZcGW5vdULXtVvJ7F1SdOlJOaGSCgnSZIuTttuA0PU/Lv6weXe?=
 =?us-ascii?Q?fkBZcM/4tdCs3SAvaXt3GJ+tbEmhVwbSUViah+J14lP3dvmu+jCCKlF39kNo?=
 =?us-ascii?Q?mDutphFHKA=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: dfab2291-45bc-4c4c-a729-08de8f2cea7f
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 13:53:41.0086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: joDDQno/Ef4jFVyNlLmig7awlZIJDTI8FtALGaxMBcrvuc3hgi8akz0D16sSZVDQ39gzm5vePujrfRb0nfeQj40bd9nCN87fXTeSprYljZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7082
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 31 Mar 2026 13:53:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9153

Hi Jon,

On 3/31/26 2:29 PM, Jon Mason via lists.yoctoproject.org wrote:
> [You don't often get email from jon.mason=3Darm.com@lists.yoctoproject.or=
g. Learn why this is important at https://aka.ms/LearnAboutSenderIdentifica=
tion ]
>=20
> Add a new documentation page describing the firmware and bootloader
> architecture used by systems built with the Yocto Project across
> multiple processor architectures.
>=20
> The document explains the typical boot stages (Boot ROM, platform
> firmware, system firmware, and OS loader) and provides example boot
> flows for Arm, Arm64, RISC-V, and x86 systems.
>=20
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>   .../ref-manual/boot-architecture.rst          | 361 ++++++++++++++++++
>   documentation/ref-manual/index.rst            |   1 +
>   2 files changed, 362 insertions(+)
>   create mode 100644 documentation/ref-manual/boot-architecture.rst
>=20
> diff --git a/documentation/ref-manual/boot-architecture.rst b/documentati=
on/ref-manual/boot-architecture.rst
> new file mode 100644
> index 000000000000..e801e0a402d5
> --- /dev/null
> +++ b/documentation/ref-manual/boot-architecture.rst
> @@ -0,0 +1,361 @@
> +Boot Architecture and Firmware Components
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This document describes the firmware and boot architecture used by
> +systems built with the Yocto Project across several processor
> +architectures:
> +
> +* Arm (Arm32)
> +* Arm64 (AArch64)
> +* RISC-V
> +* x86 / x86_64
> +
> +Understanding the firmware chain is important when configuring Yocto
> +Project builds because multiple software components can fulfill the
> +same role in the boot process. These components are often mutually
> +exclusive and are typically selected through BitBake providers or
> +machine configuration.
> +
> +
> +Boot Process Overview
> +---------------------
> +
> +Most systems boot through a sequence of stages that progressively
> +initialize the hardware and load the operating system. Control typically
> +passes from more privileged and trusted stages to less privileged ones.
> +
> +::
> +
> +   Boot ROM
> +      =E2=86=93
> +   Platform Firmware
> +      =E2=86=93
> +   System Firmware
> +      =E2=86=93
> +   OS Loader (optional)
> +      =E2=86=93
> +   Operating System
> +
> +
> +Boot ROM
> +--------
> +
> +Boot ROM is the first code executed when a processor starts. It is
> +typically implemented by the CPU or SoC manufacturer and stored in
> +on-chip read-only memory.
> +
> +Boot ROM performs minimal initialization and loads the next stage of
> +firmware from boot media such as SPI flash, eMMC, or SD storage.
> +
> +Boot ROM code is generally **not modifiable by system developers**.
> +

What do you mean "generally" :) Are there Boot Read-Only Memory which=20
are BootRWM :) ?

Specifying "by system developers" seems to indicate they may be modified=20
by other kind of developers, but isn't BootROM part of the silicon=20
(configurable through OTP/(e)fuses)?

> +
> +Platform Firmware
> +-----------------
> +
> +Platform firmware performs early platform initialization before the
> +main boot firmware executes. Depending on the architecture and
> +implementation, it may configure security boundaries, initialize memory
> +and clocks, provide management-controller functions, or expose
> +privileged runtime services used later by the operating system.
> +
> +Some parts of this layer may remain resident after boot. Platform

Please do not use layer as a term to differentiate the boot stages,=20
layer already has a meaning in Yocto :)

> +firmware is usually platform-specific and typically has fewer
> +interchangeable implementations than later boot stages.
> +
> +Examples include:
> +
> +* Trusted Firmware-A (TF-A)
> +* Trusted Firmware-M (TF-M), where applicable
> +* System Control Processor (SCP) firmware
> +* OpenSBI, which implements the Supervisor Binary Interface (SBI)
> +

This is not correct for at least Rockchip SoCs. I think it's also not=20
correct for Allwinner SoCs. I **think** TI may be doing this but I have=20
never worked with their SoCs. For Rockchip, a TPL/SPL is loaded first,=20
and then it loads a U-Boot FIT with TF-A, OP-TEE OS and U-Boot proper.=20
So if you will, one boots a first part of the System Firmware, which=20
loads the Platform Firmware which in turn loads the second part of the=20
System Firmware.

Note also that people are increasingly wanting to have TF-A/OP-TEE OS as=20
late as possible in the boot process, and I've seen implementations=20
where TF-A is part of the kernel FIT image. This allows to easily update=20
those persistent and security-critical components without requiring a=20
risky bootloader (here called System Firmware) update.

I think this may make things even more confusing since the boot process=20
clearly won't be identical for all Aarch64 SoC vendors (at least for the=20
time being) and won't match the documentation. Do you have a plan on how=20
to handle that?

> +
> +System Firmware
> +---------------
> +
> +System firmware provides the main boot environment. It prepares the
> +hardware needed to load the next stage, discovers bootable devices,
> +and may provide a command shell or a UEFI environment. Many modern
> +implementations can also boot the kernel directly from storage,
> +making a separate OS loader optional.
> +
> +This layer is generally modifiable by system developers and often
> +has alternative implementations.
> +
> +Typical implementations include:
> +
> +* U-Boot
> +* EDK2
> +* coreboot
> +
> +In Yocto Project builds this layer can be selected through a virtual
> +provider using ``PREFERRED_PROVIDER``.
> +
> +The name ``virtual/boot-firmware`` reflects the role of this layer as
> +the primary firmware environment responsible for locating bootable
> +devices and initiating the operating system boot process.
> +
> +Example configuration::
> +
> +   PREFERRED_PROVIDER_virtual/boot-firmware =3D "u-boot"
> +
> +
> +OS Loader
> +---------
> +
> +The OS loader is the final stage that typically resides on disk. It
> +selects and loads a specific operating system kernel and optional
> +initramfs into memory and passes the required configuration to start
> +the system.
> +
> +This layer is modifiable by system developers and usually has multiple
> +implementations.
> +
> +Examples include:
> +
> +* GRUB
> +* Syslinux / EXTLINUX
> +* systemd-boot
> +
> +In Yocto Project builds this layer can also be selected through a
> +virtual provider.
> +
> +The name ``virtual/boot-manager`` reflects the role of this software in
> +selecting and loading an operating system kernel from storage.
> +
> +Example configuration::
> +
> +   PREFERRED_PROVIDER_virtual/boot-manager =3D "grub-efi"
> +
> +Some systems boot the kernel directly from system firmware (for example
> +U-Boot or UEFI). In these cases an additional OS loader is not required.
> +

What do we do when we're expecting to use the extlinux implementation in=20
U-Boot? Or another implementation? How is this going to be handled?=20
Technically, it **is** syslinux/extlinux, just that the extlinux.conf=20
file needs to be in a bootable partition readable by U-Boot proper (the=20
System Firmware).

> +Example::
> +
> +   PREFERRED_PROVIDER_virtual/boot-manager =3D "none"
> +
> +
> +Boot Process by Architecture
> +----------------------------
> +
> +
> +Arm (Arm32)
> +~~~~~~~~~~~

I've seen Aarch32 being used also. The wikipedia page=20
(https://en.wikipedia.org/wiki/ARM_architecture_family) hints at Aarch32=20
being Armv7+ and Arm32 being Armv6-, is this what you wanted to convey?=20
Working at arm I guess it's the kind of information you'd have access=20
to, but then what matters between what marketing says it is and what the=20
public believes it is...

> +
> +Many Arm32 systems boot directly into U-Boot using its SPL stage.
> +
> +::
> +
> +   Boot ROM
> +      =E2=86=93
> +   U-Boot SPL
> +      =E2=86=93
> +   U-Boot
> +      =E2=86=93
> +   Linux Kernel
> +
> +
> +Arm64 (AArch64)
> +~~~~~~~~~~~~~~~
> +
> +Arm64 platforms commonly include Trusted Firmware-A prior to the
> +main boot firmware.
> +

Which SoCs vendors do that? Rockchip doesn't for sure. Allwinner I think=20
as well. TI may. Unsure about the others. Or is this something specific=20
to ACPI-supported Aarch64 platforms?

[...]

> +Security Considerations
> +-----------------------
> +
> +Secure Boot
> +~~~~~~~~~~~
> +
> +Secure Boot ensures that only software verified by a trusted key can
> +execute during the boot process.
> +
> +Each stage verifies the integrity and authenticity of the next stage
> +before transferring control. Verification is typically performed using
> +digital signatures and public-key cryptography.
> +
> +The process begins with a hardware root of trust, often implemented in
> +Boot ROM or secure firmware, which contains the keys used to verify
> +subsequent boot stages.
> +

We **must** say that Yocto cannot implement the Root of Trust, because=20
it necessarily mean doing something on the running target. Except if you=20
have something in mind to write to efuses/OTP from some script... Like a=20
setup image separate from the final image. I don't think we should be=20
aiming to do that, but we for sure need to be clear what is in the scope=20
for Yocto.

My worry is we are documenting a "general"/"ideal" setup that won't=20
apply to some/many devices. Or do you have bigger plans in the=20
Arm/RISC-V ecosystem? I know about Arm SystemReady, though it isn't=20
required for selling Arm-based products.

[...]

> +Yocto Project Integration
> +~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The Yocto Project can be used to build systems that implement Secure
> +Boot and Trusted Boot through several layers and components.
> +
> +Examples include:
> +
> +* Secure Boot support in U-Boot

This needs to be clarified. You mean U-Boot has support to be part of=20
the Secure Boot and verify the next stages it boots, but "Secure Boot"=20
generally means (to me) A to Z, meaning from BootROM to filesystem and=20
U-Boot doesn't control BootROM so it's a bit misleading here.

Cheers,
Quentin

