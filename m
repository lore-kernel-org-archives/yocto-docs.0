Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A620C021A4
	for <webhook@archiver.kernel.org>; Fri, 14 Feb 2025 15:50:30 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.24113.1739548222755616933
 for <docs@lists.yoctoproject.org>;
 Fri, 14 Feb 2025 07:50:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 51EFoLAj030680
	for <docs@lists.yoctoproject.org>; Fri, 14 Feb 2025 09:50:21 -0600
Received: from [192.168.2.40] ([192.168.2.40])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 51EFoKQ0017718
	for <docs@lists.yoctoproject.org>; Fri, 14 Feb 2025 09:50:21 -0600
Message-ID: <05e07903-df94-4282-ab62-77ad6e372caa@kernel.crashing.org>
Date: Fri, 14 Feb 2025 09:50:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: docs@lists.yoctoproject.org
Content-Language: en-US
From: Mark Hatle <mark.hatle@kernel.crashing.org>
Subject: qemuboot.conf variables
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gate.crashing.org id 51EFoLAj030680
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 14 Feb 2025 15:50:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6371

When I was looking through the large docs, I didn't see anything inside o=
f it to=20
explain the various variables used in the qemuboot.conf file.

Looking through the code, I found the stuff mostly in the class that crea=
tes the=20
file, but there were also fragments of explanation in prior commit messag=
es and=20
other places.  Below is my attempt to collect all of the qemuboot.conf va=
riables=20
in one place, along with an explanation.  I think this would be useful to=
 add to=20
the regular docs, but I'm not exactly sure where or what format.

There are some other things related to runqemu usage that would be nice t=
o=20
document as well (command line usage, environment variable, command subst=
itution=20
behavior and generated command line rules), but the items below are the o=
nes=20
that I had to search for when I was trying to explain the qemuboot.conf t=
o=20
someone else.


QB_AUDIO_DRV: QEMU audio driver (e.g. "alsa", set it when support audio)

QB_AUDIO_OPT: QEMU audio option (e.g. "-soundhw ac97,es1370"), which is u=
sed=20
when QB_AUDIO_DRV is set.

QB_CLEANUP_CMD: enable running custom shell cleanup commands after QEMU.

QB_CMDLINE_IP_SLIRP: explicitely specify the ip=3D kernel command line ar=
guments=20
for slirp mode

QB_CMDLINE_IP_TAP: explicitely specify the ip=3D kernel command line argu=
ments for=20
tap mode

QB_CPU: QEMU cpu (e.g. "-cpu qemu32")

QB_CPU_KVM: Similar to QB_CPU except used for kvm support (e.g. "-cpu kvm=
64")

QB_DEFAULT_BIOS: specify a BIOS the same way that the KERNEL variable is=20
specified (same as BIOS command line variable)

QB_DEFAULT_FSTYPE: Default FSTYPE to boot (e.g. "ext4")

QB_DEFAULT_KERNEL: Default kernel to boot (e.g. "bzImage")

QB_DRIVE_TYPE: /dev/sd, /dev/hd, /dev/vdb, /dev/vd - config drives that s=
tart=20
with one of these prefixes, requires virtio

QB_DTB: QEMU dtb name

QB_FSINFO: specify "wic:no-kernel-in-fs" or "wic:kernel-in-fs"

QB_GRAPHICS: QEMU video card type (e.g. "-vga std")

QB_KERNEL_CMDLINE: can be set to =E2=80=9Cnone=E2=80=9D to avoid overridi=
ng kernel command line=20
specified in dtb

QB_KERNEL_CMDLINE_APPEND: Options to append to the kernel's -append optio=
n (e.g.=20
"console=3DttyS0 console=3Dtty")

QB_KERNEL_ROOT: Kernel's root (e.g. /dev/vda)

QB_MACHINE: QEMU machine (e.g. "-machine virt")

QB_MEM: Memory (e.g. "-m 512")

QB_NET: can be set to "none" to disable networking

QB_NETWORK_DEVICE: network device settings used by both slirp and tap

QB_NFSROOTFS_EXTRA_OPT: allow extra options to be appended to the NFS roo=
tfs=20
options in kernel boot args, e.g. "wsize=3D4096,rsize=3D4096"

QB_OPT_APPEND: Options to append to QEMU (e.g. "-show-cursor")

QB_NO_PNI: By default, if 'DISTRO_FEATURES' does NOT contains 'pni-names'=
 add=20
'net.ifnames=3D0' to QB_CMDLINE_IP_TAP default.  See QB_CMDLINE_IP_TAP.

QB_RNG: Pass-through for host random number generator, it can speedup boo=
t in=20
system mode, where system is experiencing entropy starvation (requires vi=
rtio)

QB_ROOTFS: can be set to "none" to disable rootfs setup

QB_ROOTFS_EXTRA_OPT: Content of the optional parameter will be appended t=
o the=20
rootfs-device in the qemu configuration, in case QB_ROOTFS_OPT is not spe=
cified.=20
By default this is empty.

QB_ROOTFS_OPT: Used as rootfs (e.g. "-drive=20
id=3Ddisk0,file=3D@ROOTFS@,if=3Dnone,format=3Draw -device=20
virtio-blk-device,drive=3Ddisk0"). runqemu will replace "@ROOTFS@" with t=
he one=20
which is used, such as core-image-minimal-qemuarm64.ext4.

QB_SERIAL_OPT: Serial port (e.g. "-serial mon:stdio")

QB_SETUP_CMD: enable running custom shell setup before QEMU.

QB_SLIRP_OPT: Network option for SLIRP mode (e.g. "-netdev user,id=3Dnet0=
 -device=20
virtio-net-device,netdev=3Dnet0")

QB_SMP: amount of CPU cores inside qemu guest, each mapped to a thread on=
 the=20
host, e.g. "-smp 8"

QB_SYSTEM_NAME: QEMU name (e.g. "qemu-system-i386")

QB_TAP_OPT: Network option for 'tap' mode (e.g. "-netdev=20
tap,id=3Dnet0,ifname=3D@TAP@,script=3Dno,downscript=3Dno -device=20
virtio-net-device,netdev=3Dnet0"). runqemu will replace "@TAP@" with the =
one that=20
is used, such as tap0, tap1 ...

QB_TCPSERIAL_OPT: tcp serial port option (e.g. " -device virtio-serial-de=
vice=20
-chardev socket,id=3Dvirtcon,port=3D@PORT@,host=3D127.0.0.1 -device=20
virtconsole,chardev=3Dvirtcon" runqemu will replace "@PORT@" with the por=
t number=20
which is used.

