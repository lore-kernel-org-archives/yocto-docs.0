Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.42])
 by mx.groups.io with SMTP id smtpd.web10.7401.1596033394927975451
 for <docs@lists.yoctoproject.org>;
 Wed, 29 Jul 2020 07:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=om4kht4X;
 spf=pass (domain: arm.com, ip: 40.107.8.42, mailfrom: usama.arif@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2WzS9SGCvDXaM04LpfMuTYR7AH/FHbjzLpuWCvYV4g8=;
 b=om4kht4XWODggHeUDUxyuHqDX+g2ExczFHcZNP4q9NsYRg6QV3nzEtsTFb6HvwwwN7wGxumpgYic+M2hOrBXPJZF64sYuO33PFLJ5wIV2aAsPR5JfeTJNyzBm999MgFpv1+z8PX627upgTWlSiEguqrpAzBjfvjMEclgiLTv7xE=
Received: from DB8PR06CA0019.eurprd06.prod.outlook.com (2603:10a6:10:100::32)
 by DB7PR08MB3914.eurprd08.prod.outlook.com (2603:10a6:10:32::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20; Wed, 29 Jul
 2020 14:36:32 +0000
Received: from DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::1f) by DB8PR06CA0019.outlook.office365.com
 (2603:10a6:10:100::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23 via Frontend
 Transport; Wed, 29 Jul 2020 14:36:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT013.mail.protection.outlook.com (10.152.20.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.10 via Frontend Transport; Wed, 29 Jul 2020 14:36:32 +0000
Received: ("Tessian outbound c83312565ef4:v62"); Wed, 29 Jul 2020 14:36:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b24091a2e93328ce
X-CR-MTA-TID: 64aa7808
Received: from 7f02dccf2729.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id CDA70571-2515-4D36-9FE3-0279E0D5160A.1;
	Wed, 29 Jul 2020 14:36:22 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7f02dccf2729.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 29 Jul 2020 14:36:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mNQOG3P5dXoKS4RXqvhTyZsQsImdrgNLI4pOjrCAoec4ZW9jNjSnJY+90jl0Z18vms7AF/tcNwgiqoZp1zfmnpJJR1dfYw2paBrJK3JkTTMgIev7elSWm8vb3y6FnbFUNbApNFEc/2/C92zx9iN5xrCCQDo54SOajzs736EuTYinrhKkY5uQ47/3Le7PHO+jILdmOqoVR/PUEgkJSTNLVwP3KMwuxeHNwaxfp24m+tKK1XsDyatwU9j3UhU9UHQKNCxTD5oxE9WpWZAPShTYoPKCXaGyadSNiiMLb3uJmGf72b8b/uoHY+xxB6PQIjmo5IysDjkkDyFRHxCPP5vZVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2WzS9SGCvDXaM04LpfMuTYR7AH/FHbjzLpuWCvYV4g8=;
 b=ejHvgGhvLVLedAJGQVM3YnO2HMdLlu93iT/LweANLiEQU3Yq4VAkkKe6lggzrmnHBw8IBlvGzFwOdQj5JJSyGLRXSdDSS4sJkcEL76xksEvY/4EBZK2A1NhxRcYLZiSXuzxMGTofhnpmFTEBKddLB6Zr97BhyXSkL5KkKTHcqn8yksyeowcG6lY3lk0Lz8F4VTlHJXUY3NyDyoHoZ3Zon91iCv9Ttjih630EuovYSUT0LRXaQ91hzZAx92DZbnUK9n/B/O7Wz2HdjAEpAsPnbQtWkyUFfQzPA3o4iPwO049IqpJfOd4PLiNnYSCFf+EsjwIDqm2d2gr7pZt8/cMOgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2WzS9SGCvDXaM04LpfMuTYR7AH/FHbjzLpuWCvYV4g8=;
 b=om4kht4XWODggHeUDUxyuHqDX+g2ExczFHcZNP4q9NsYRg6QV3nzEtsTFb6HvwwwN7wGxumpgYic+M2hOrBXPJZF64sYuO33PFLJ5wIV2aAsPR5JfeTJNyzBm999MgFpv1+z8PX627upgTWlSiEguqrpAzBjfvjMEclgiLTv7xE=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com (2603:10a6:10:114::9)
 by DBBPR08MB4869.eurprd08.prod.outlook.com (2603:10a6:10:de::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21; Wed, 29 Jul
 2020 14:36:21 +0000
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::6939:c156:de89:adc5]) by DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::6939:c156:de89:adc5%7]) with mapi id 15.20.3239.017; Wed, 29 Jul 2020
 14:36:21 +0000
From: "Usama Arif" <usama.arif@arm.com>
To: docs@lists.yoctoproject.org
Cc: nd@arm.com,
	Usama Arif <usama.arif@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] ref-manual: Add documentation for kernel-fitimage
Date: Wed, 29 Jul 2020 15:35:52 +0100
Message-Id: <20200729143552.16065-1-usama.arif@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P265CA0356.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::32) To DB8PR08MB5481.eurprd08.prod.outlook.com
 (2603:10a6:10:114::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from usaari01.cambridge.arm.com (217.140.106.52) by LO2P265CA0356.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:d::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17 via Frontend Transport; Wed, 29 Jul 2020 14:36:20 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.52]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7a4f202f-fef1-4741-6ea1-08d833ccc988
X-MS-TrafficTypeDiagnostic: DBBPR08MB4869:|DB7PR08MB3914:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB39146127FB2A8D542522CB6992700@DB7PR08MB3914.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 gim/452WOq9UVWcxtxfjqW0vDS3bv3KnGeBOf9nJeAJ++TXQCH4j2AlbXpsWGj81YhgOCRASRjKQ4t8zNVAvUwfhE+UKjbStjn96jzeQaQRVoZMwSFsfDXDL+e5wEbcYe5KAR0iZ6mP6jFqoH2BmTchusWo+MNVYXlp5ZCJUZ9piqyRsinQFfOmpqr8FWWJ4hl+vymQsvEnRyX8aBeNiaEWteUjYNrwjhbYbvn+ewnrh4i1eB8syyyhSdUdvk6obRPrWOxskNp6CmmzT/jzrVUvbV+F1fpOVA7TNKtiJTiSW5ttyyJQJH68FTS9bU6/FMXAvhs0Z9eioU1ohAR/cvQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5481.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(346002)(366004)(39850400004)(376002)(6486002)(8936002)(2906002)(54906003)(316002)(186003)(2616005)(956004)(6916009)(16526019)(44832011)(66946007)(66476007)(66556008)(6666004)(26005)(36756003)(478600001)(1076003)(30864003)(8676002)(52116002)(4326008)(83380400001)(86362001)(5660300002)(7696005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 Zl4vGkr05cp0BygzS3jf7GGyyV/AI89GFaVrk26/gebE7vdG+Ru3yYKZ2syzqWgFRmaVJj7EKL8JT7xX5MveBGin1Q2itU9srxSW079WuvbYCV/JZLcfnuA79jH9pOOYAJ2FK9UutfH71QplwNPh8YidAr2GkDSe6yuTJ2fgLl48ZBFqbwS0jtiL2i6oXKah0OfCZ3q7RotnAIGPJm4e7iO7tjczv6EQ+Wf+/LJKPpybnMyEcMPCnngpNoUx+hIZ6Ln7DZmQklF58uTmJlxydL7iM7hvnaylyNtOYta/g/WO8SQCXsiMecVC1qcxPs1gh8BC0Ht8k66IMBY8GtxK9Yqh9Rsa032uIuVsFt19DXsJbH1Hw+5AS1PRuRUJXJXthRUXR8uLTikdMwyEZUWSSHUSqr7iepZXW9P6jUZ6OcXUFIzqC/YDV6kcBkx0KAMkVNPJ8oT5lsMRsI+Pccr9H8XCIRcY+I9IzrRki12w53I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4869
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Usama.Arif@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	038c3bdb-9fcd-41ae-a803-08d833ccc2b7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TJhJTIZPRKZhtUR3oUr09x6JWpxCwqxUbhe5RlcFYTt5Q0UqMvniQcbQOuSydxEuHQuFTg8MV67efQeE5w+lyRBkLRjCF23n5ZaIBb1KGV0LqpVgEkdHjyHSwX/XLDOdAdn+51rrvg+tJbVJoXs152vPAFJpt6sB3vvPDnQHDuCdBn3oe8kyu8z8z8DwpgcwT9BUGBBxp1G3M+42lEKyEg9J/FA1xrGq6aexInicjj+qP/AVfP8ATwC9aLf6MqoJxDG/qDPU3F0N3KGFaW2BzNCVVGBLi6+/v/lD/Xvz9VU+GqaDvfmzacqx/aXGfYasKTkp9FCm+t1hrJfx0Moqw7jj0oLuwFgsRoB3zpN767fm9ZBo7DtU1etH6vcnG5Rv/7DMXwcp15blX9EU7CmlPA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(376002)(39850400004)(346002)(136003)(46966005)(7696005)(1076003)(6486002)(86362001)(8676002)(336012)(6916009)(107886003)(478600001)(82740400003)(8936002)(956004)(47076004)(2906002)(30864003)(2616005)(4326008)(16526019)(36756003)(186003)(54906003)(6666004)(81166007)(83380400001)(70206006)(44832011)(316002)(5660300002)(70586007)(82310400002)(26005)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2020 14:36:32.0341
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a4f202f-fef1-4741-6ea1-08d833ccc988
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3914
Content-Type: text/plain

This documents kernel-fitimage.bbclass as well as
the variables that are required to use the class
to create a FIT image.

Signed-off-by: Usama Arif <usama.arif@arm.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/ref-manual/ref-classes.xml   |  76 ++++++++++-
 documentation/ref-manual/ref-variables.xml | 142 +++++++++++++++++++++
 2 files changed, 217 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/ref-classes.xml b/documentation/ref-manual/ref-classes.xml
index ab12373ae0..1dcd5fdd03 100644
--- a/documentation/ref-manual/ref-classes.xml
+++ b/documentation/ref-manual/ref-classes.xml
@@ -1880,8 +1880,82 @@ This check was removed for YP 2.3 release
 
     <para>
         The <filename>kernel-fitimage</filename> class provides support to
-        pack zImages.
+        pack a kernel Image, device trees and a RAM disk into a single
+        FIT image. In theory, a FIT image can support any number of kernels,
+        RAM disks and device-trees.
+        However, <filename>kernel-fitimage</filename> currently only supports
+        limited usescases: just one kernel image, an optional RAM disk, and
+        any number of device tree.
     </para>
+
+    <para>
+        To create a FIT image, it is required that
+        <filename><link linkend='var-KERNEL_CLASSES'>KERNEL_CLASSES</link></filename>
+        is set to "kernel-fitimage" and
+        <filename><link linkend='var-KERNEL_IMAGETYPE'>KERNEL_IMAGETYPE</link></filename>
+        is set to "fitImage".
+    </para>
+
+    <para>
+        The options for the device tree compiler passed to mkimage -D feature
+        when creating the FIT image are specified using the
+        <filename><link linkend='var-UBOOT_MKIMAGE_DTCOPTS'>UBOOT_MKIMAGE_DTCOPTS</link></filename>
+        variable.
+    </para>
+
+    <para>
+        Only a single kernel can be added to the FIT image created by
+        <filename>kernel-fitimage</filename> and the kernel image in FIT is
+        mandatory.
+        The address where the kernel image is to be loaded by U-boot is
+        specified by
+        <filename><link linkend='var-UBOOT_LOADADDRESS'>UBOOT_LOADADDRESS</link></filename>
+        and the entrypoint by
+        <filename><link linkend='var-UBOOT_ENTRYPOINT'>UBOOT_ENTRYPOINT</link></filename>.
+    </para>
+
+    <para>
+        Multiple device trees can be added to the FIT image created by
+        <filename>kernel-fitimage</filename> and the device tree is optional.
+        The address where the device tree is to be loaded by U-boot is
+        specified by
+        <filename><link linkend='var-UBOOT_DTBO_LOADADDRESS'>UBOOT_DTBO_LOADADDRESS</link></filename>
+        for device tree overlays and by
+        <filename><link linkend='var-UBOOT_DTB_LOADADDRESS'>UBOOT_DTB_LOADADDRESS</link></filename>
+        for device tree binaries.
+    </para>
+
+    <para>
+        Only a single RAM disk can be added to the FIT image created by
+        <filename>kernel-fitimage</filename> and the RAM disk in FIT is
+        optional.
+        The address where the RAM disk image is to be loaded by U-boot
+        is specified by
+        <filename><link linkend='var-UBOOT_RD_LOADADDRESS'>UBOOT_RD_LOADADDRESS</link></filename>
+        and the entrypoint by
+        <filename><link linkend='var-UBOOT_RD_ENTRYPOINT'>UBOOT_RD_ENTRYPOINT</link></filename>.
+        The ramdisk is added to FIT image when
+        <filename><link linkend='var-INITRAMFS_IMAGE'>INITRAMFS_IMAGE</link></filename>
+        is specified.
+    </para>
+
+    <para>
+        The FIT image generated by <filename>kernel-fitimage</filename> class
+        is signed when the variables
+        <filename><link linkend='var-UBOOT_SIGN_ENABLE'>UBOOT_SIGN_ENABLE</link></filename>,
+        <filename><link linkend='var-UBOOT_MKIMAGE_DTCOPTS'>UBOOT_MKIMAGE_DTCOPTS</link></filename>,
+        <filename><link linkend='var-UBOOT_SIGN_KEYDIR'>UBOOT_SIGN_KEYDIR</link></filename>
+        and
+        <filename><link linkend='var-UBOOT_SIGN_KEYNAME'>UBOOT_SIGN_KEYNAME</link></filename>
+        are set appropriately.
+        The default values used for
+        <filename><link linkend='var-FIT_HASH_ALG'>FIT_HASH_ALG</link></filename>
+        and
+        <filename><link linkend='var-FIT_SIGN_ALG'>FIT_SIGN_ALG</link></filename>
+        in <filename>kernel-fitimage</filename> are "sha256" and "rsa2048"
+        respectively.
+    </para>
+
 </section>
 
 <section id='ref-classes-kernel-grub'>
diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index 8cc7ef8fc9..a5064807e5 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -4991,6 +4991,30 @@
             </glossdef>
         </glossentry>
 
+        <glossentry id='var-FIT_HASH_ALG'><glossterm>FIT_HASH_ALG</glossterm>
+            <info>
+               FIT_HASH_ALG[doc] = "Specifies the hash algorithm used in creating the FIT Image."
+            </info>
+            <glossdef>
+                <para role="glossdeffirst">
+                    Specifies the hash algorithm used in creating the FIT Image.
+                    For e.g. sha256.
+                </para>
+            </glossdef>
+        </glossentry>
+
+        <glossentry id='var-FIT_SIGN_ALG'><glossterm>FIT_SIGN_ALG</glossterm>
+            <info>
+               FIT_SIGN_ALG[doc] = "Specifies the signature algorithm used in creating the FIT Image."
+            </info>
+            <glossdef>
+                <para role="glossdeffirst">
+                    Specifies the signature algorithm used in creating the FIT Image.
+                    For e.g. rsa2048.
+                </para>
+            </glossdef>
+        </glossentry>
+
         <glossentry id='var-FONT_EXTRA_RDEPENDS'><glossterm>FONT_EXTRA_RDEPENDS</glossterm>
             <info>
                 FONT_EXTRA_RDEPENDS[doc] = "When a recipe inherits the fontcache class, this variable specifies runtime dependencies for font packages. This variable defaults to 'fontconfig-utils'."
@@ -15960,6 +15984,38 @@
             </glossdef>
         </glossentry>
 
+        <glossentry id='var-UBOOT_DTB_LOADADDRESS'><glossterm>UBOOT_DTB_LOADADDRESS</glossterm>
+            <info>
+               UBOOT_DTB_LOADADDRESS[doc] = "Specifies the load address for the dtb."
+            </info>
+            <glossdef>
+                <para role="glossdeffirst">
+                    Specifies the load address for the dtb image used by U-boot.
+                    During FIT image creation, the
+                    <filename>UBOOT_DTB_LOADADDRESS</filename> variable is used
+                    in <filename>kernel-fitimage</filename> class to specify the
+                    load address to be used in creating the dtb sections of
+                    Image Tree Source for the FIT image.
+                </para>
+            </glossdef>
+        </glossentry>
+
+        <glossentry id='var-UBOOT_DTBO_LOADADDRESS'><glossterm>UBOOT_DTBO_LOADADDRESS</glossterm>
+            <info>
+               UBOOT_DTBO_LOADADDRESS[doc] = "Specifies the load address for the dtbo."
+            </info>
+            <glossdef>
+                <para role="glossdeffirst">
+                    Specifies the load address for the dtbo image used by U-boot.
+                    During FIT image creation, the
+                    <filename>UBOOT_DTBO_LOADADDRESS</filename> variable is used
+                    in <filename>kernel-fitimage</filename> class to specify the
+                    load address to be used in creating the dtbo sections of
+                    Image Tree Source for the FIT image.
+                </para>
+            </glossdef>
+        </glossentry>
+
         <glossentry id='var-UBOOT_ENTRYPOINT'><glossterm>UBOOT_ENTRYPOINT</glossterm>
             <info>
                UBOOT_ENTRYPOINT[doc] = "Specifies the entry point for the U-Boot image."
@@ -16045,6 +16101,51 @@
             </glossdef>
         </glossentry>
 
+        <glossentry id='var-UBOOT_MKIMAGE_DTCOPTS'><glossterm>UBOOT_MKIMAGE_DTCOPTS</glossterm>
+            <info>
+               UBOOT_MKIMAGE_DTCOPTS[doc] = "Options for the device tree compiler passed to mkimage '-D' feature."
+            </info>
+            <glossdef>
+                <para role="glossdeffirst">
+                    Options for the device tree compiler passed to mkimage '-D'
+                    feature while creating FIT image in
+                    <filename>kernel-fitimage</filename> class.
+                </para>
+            </glossdef>
+        </glossentry>
+
+        <glossentry id='var-UBOOT_RD_LOADADDRESS'><glossterm>UBOOT_RD_LOADADDRESS</glossterm>
+            <info>
+               UBOOT_RD_LOADADDRESS[doc] = "Specifies the load address for the ramdisk image."
+            </info>
+            <glossdef>
+                <para role="glossdeffirst">
+                    Specifies the load address for the RAM disk image.
+                    During FIT image creation, the
+                    <filename>UBOOT_RD_LOADADDRESS</filename> variable is used
+                    in <filename>kernel-fitimage</filename> class to specify the
+                    load address to be used in creating the Image Tree Source for
+                    the FIT image.
+                </para>
+            </glossdef>
+        </glossentry>
+
+        <glossentry id='var-UBOOT_RD_ENTRYPOINT'><glossterm>UBOOT_RD_ENTRYPOINT</glossterm>
+            <info>
+               UBOOT_RD_ENTRYPOINT[doc] = "Specifies the entrypoint for the ramdisk image."
+            </info>
+            <glossdef>
+                <para role="glossdeffirst">
+                    Specifies the entrypoint for the RAM disk image.
+                    During FIT image creation, the
+                    <filename>UBOOT_RD_ENTRYPOINT</filename> variable is used
+                    in <filename>kernel-fitimage</filename> class to specify the
+                    entrypoint to be used in creating the Image Tree Source for
+                    the FIT image.
+                </para>
+            </glossdef>
+        </glossentry>
+
         <glossentry id='var-UBOOT_SUFFIX'><glossterm>UBOOT_SUFFIX</glossterm>
             <info>
                UBOOT_SUFFIX[doc] = "Points to the generated U-Boot extension."
@@ -16063,6 +16164,47 @@
             </glossdef>
         </glossentry>
 
+        <glossentry id='var-UBOOT_SIGN_ENABLE'><glossterm>UBOOT_SIGN_ENABLE</glossterm>
+            <info>
+               UBOOT_SIGN_KEYDIR[doc] = "Enable signing of FIT image."
+            </info>
+            <glossdef>
+                <para role="glossdeffirst">
+                    Enable signing of FIT image. The default value is "0".
+                </para>
+            </glossdef>
+        </glossentry>
+
+        <glossentry id='var-UBOOT_SIGN_KEYDIR'><glossterm>UBOOT_SIGN_KEYDIR</glossterm>
+            <info>
+               UBOOT_SIGN_KEYDIR[doc] = "Location of the directory containing the RSA key and certificate used for signing FIT image."
+            </info>
+            <glossdef>
+                <para role="glossdeffirst">
+                    Location of the directory containing the RSA key and
+                    certificate used for signing FIT image.
+                </para>
+            </glossdef>
+        </glossentry>
+
+        <glossentry id='var-UBOOT_SIGN_KEYNAME'><glossterm>UBOOT_SIGN_KEYNAME</glossterm>
+            <info>
+               UBOOT_SIGN_KEYNAME[doc] = "The name of keys used for signing U-boot FIT image"
+            </info>
+            <glossdef>
+                <para role="glossdeffirst">
+                    The name of keys used for signing U-boot FIT image stored in
+                    <filename><link linkend='var-UBOOT_SIGN_KEYDIR'>UBOOT_SIGN_KEYDIR</link></filename>
+                    directory. For e.g. dev.key key and dev.crt certificate
+                    stored in
+                    <filename><link linkend='var-UBOOT_SIGN_KEYDIR'>UBOOT_SIGN_KEYDIR</link></filename>
+                    directory will have
+                    <filename><link linkend='var-UBOOT_SIGN_KEYNAME'>UBOOT_SIGN_KEYNAME</link></filename>
+                    set to "dev".
+                </para>
+            </glossdef>
+        </glossentry>
+
         <glossentry id='var-UBOOT_TARGET'><glossterm>UBOOT_TARGET</glossterm>
             <info>
                UBOOT_TARGET[doc] = "Specifies the target used for building U-Boot."
-- 
2.17.1

