Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D49D15DAD
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 15:23:39 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.45])
 by mx.groups.io with SMTP id smtpd.web10.49334.1729524209665534264
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Oct 2024 08:23:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@agilent.com header.s=selector1 header.b=UkTy6Usd;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.244.45, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PHK2ErwnbyKbqZaE+NS0SyK7VlYg+f1suXd4HMeymYr2PErn9zYOnmJD7pVXXS4+C2eykkDOPkYo45Ihg5zk0EqvUN3pTZuMIxRtfmCexdOtVjpMzoDObOYIa3Ee7hhdeewitp72QoY13Qod1Rq3uFuo75aNHKqDhTz79sIeXLqVKNc4zzaDeZTqYaQLPwq4wXlshNCIr9g/EB+FZr9O+cAe0y++v38cdBdYn1fvllVchm5jm06EFnciBaqDdzIMTpWBXUnfDOS0pK53ET9DBpnYX/c8Zwfo3Dv501TTldixZmovseeduspOHV4DCjxNkn1aqegA0U3YkB9ussrQQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kn5N9OCtjA4w7Q94vqPEWu3vtdZjxSZiRETZUrxXStg=;
 b=ueyiDM8rYczPimhb9GipRBzCgGxK8z+ZfXcU9NX21gc2tNmqXQ2QhOlmy3hYkrfzDpeKspiRl+yBWO6xBTWgHX3tPO1QuDhHVcTIO7Gj5h/QaHzqQTuusYkEBLhMI+NHu4nvyTga0ndEkEdgk99KUgo7uH+M/YC2xHC1eoFSL66iAkPEWjzgwN+lfe6oqRx9l9hI4fDUf7YYST2RgImaQVqSx+1XXPjIU1KvXbdg+n4vXnH9SPTunjqNsxNmxh3i42wTD/peiXAYZqyJ5rczYatskiU0bOehiLs8w0q9Zi/pmWk4Mgcmmcf7DbjjRx+3KyhFtabnLnl31I5hFXn0lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.41) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kn5N9OCtjA4w7Q94vqPEWu3vtdZjxSZiRETZUrxXStg=;
 b=UkTy6UsdJPiRbYCvE5yMshFhzt3ZSjLqOATw0YmmRcg9DXJEl0Nd7gFGlBPK5RuIVuz91d9rxfHpxCE+ixX+S82jrNQAHgPUSxjMIkqqeaOW1ZY1F6n0fHljsOmzCwGvPTyKHv1S5fVoGWYqG8SiekqlJEWFE3qLzqNmGyFtHQQTfgERqY5l7GE+bKVd6AVCpoaHcAPiXNvWgi3jmXUz5leSnPxpoSOiW/MFNsC+Rrf8aZXSoIyqc7kO+eD/aHsna0N78+Esj6FmroiwIuTG0IA5efiZKfyogAbjUlRGVvrvntPo6QpOMPtrbpyjuJa9KTvNad3rdPIVhhVLJ8N13w==
Received: from MW4PR03CA0359.namprd03.prod.outlook.com (2603:10b6:303:dc::34)
 by DS7PR12MB8371.namprd12.prod.outlook.com (2603:10b6:8:e9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.20; Mon, 21 Oct
 2024 15:23:23 +0000
Received: from SA2PEPF000015CD.namprd03.prod.outlook.com
 (2603:10b6:303:dc:cafe::13) by MW4PR03CA0359.outlook.office365.com
 (2603:10b6:303:dc::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29 via Frontend
 Transport; Mon, 21 Oct 2024 15:23:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.41)
 smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.41 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.41; helo=edgeappmail.agilent.com; pr=C
Received: from edgeappmail.agilent.com (192.25.218.41) by
 SA2PEPF000015CD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.14 via Frontend Transport; Mon, 21 Oct 2024 15:23:22 +0000
Received: from laplante-B650.lfs.agilent.com (192.25.126.4) by
 edgeappmail.agilent.com (192.25.218.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 21 Oct 2024 09:23:18 -0600
From: <chris.laplante@agilent.com>
To: <docs@lists.yoctoproject.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH] dev-manual/debugging: improve gdbserver debugfs docs
Date: Mon, 21 Oct 2024 11:22:54 -0400
Message-ID: <20241021152254.1745411-1-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CD:EE_|DS7PR12MB8371:EE_
X-MS-Office365-Filtering-Correlation-Id: ab6b385b-4813-4167-245d-08dcf1e44cd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?P37fIglgyBWdWh0rRm4ITB5Cc/c1ih3eZP+r8h+pchMYsF72jeKxkE9GEuAD?=
 =?us-ascii?Q?uVpY4mfxKi2e/G1+uDZEYq3GIDJATifzSQJJm+7ech0jE9W+C/4hqkZbmkZi?=
 =?us-ascii?Q?DWuzSiY8lmcUReKlxJBCMfJLgFVXYb4WU4N41l4BRP9CZpGVTTFKMuZSYv4e?=
 =?us-ascii?Q?sRRM2/R4OMGBhwuv1aRmb8OcyBtiZGGg559RB7f2Mk1oZVHqAVd5+6Gjhn3a?=
 =?us-ascii?Q?JIqm5hZI3GGf8Y0EtROmLxUd6ZTKdkJvfSwueE/EtCyNQ/jPB7sDcczg5Xxs?=
 =?us-ascii?Q?Lu5ePff7nR/DExr0LLQx83d0TmHhhV21tc9DzjQu8JRnqk/GOtaJt16/Mzpy?=
 =?us-ascii?Q?/U8xLfaWGSgHYXxDTE4D1ulViZAo0+eCdXYKL/vCCF8od2OA0j6YDmWvYNfh?=
 =?us-ascii?Q?aeNdllBvWKBPBNht+2lr5Zu8ZmCt3tijl3kgc5Uqm5c/ag7nzaNJ2ZCmZYsr?=
 =?us-ascii?Q?TfO/cMqwgHH7SUarMnkaF0TLjHAgmSrwVcnwBvfJ9dVPtMnaDLS2tvJ5Kbjy?=
 =?us-ascii?Q?NjHnCz4LfsD2K9h3o3RP3B59+i44LrJ254+PgXJhnBHq8pefSRT+MaZALHKy?=
 =?us-ascii?Q?O1zy7HFjHSfo/gZ5GWCmKNlpt0RbDd44zQaMiwKdbVUHnX/aFIALd/tY8KJ4?=
 =?us-ascii?Q?Dxd97yWj0KKw1cmWbCmaaEM4yT56JfQCjWgHkRMpFTXOPcpwsGDFoVTLj07J?=
 =?us-ascii?Q?gt5P5wv/dplR0gUjCgrmgOF0IynnutghndOwLbV2aQCT788lfv6uEZo9rfbf?=
 =?us-ascii?Q?nN1kg8HxC6n5LWcbUzCpsVLPcWP93zrKLM4OQUM4gGXsSCTH095gKz7hSClp?=
 =?us-ascii?Q?51BLFqLGqw4GFw7EmrOsi0RUTgcEFr762O1LxLULlBrNw195jjnEcoY8DqQV?=
 =?us-ascii?Q?VbUL5kJwnQN9V8gYr8I/fX38CBzDomP5mJ8xiZ27REFvgvU+utUkbscmxipS?=
 =?us-ascii?Q?5WtVLc2BD4GP3FPCqaGUhyuI2b2+sbS9g9yDVuaY9TkbkwySsuznOYJTFbVZ?=
 =?us-ascii?Q?qGJk5LOdKo4NYOE3kNRsRd68pcaSmzXYFAsmr0U2SUDUTWN1fWG0GV2J1cZP?=
 =?us-ascii?Q?PrBwdg8WYhjD+mY00usN9c8z6y8jokKG5gCno1aDxWg47blD8TXrnVM6PrkF?=
 =?us-ascii?Q?Dve1kt1lsDtRdQYZFDg1VquUj0VAo3uc4aTzs1qhPe/tzr2GJR25Pwc6rfPr?=
 =?us-ascii?Q?ubrGyazgttJpx6mjLcH8/EybiuM+Teoc02GmwaUM+gfEpXPJV7sY60+V8ML9?=
 =?us-ascii?Q?2enztp4U8C4NMkuUxYFfX7DgoI2q2/dOoh3HWtvexPxrK0DTQqs2NmzcG3vC?=
 =?us-ascii?Q?fDXhPIwKZAtA4lV7UL9NGuVBRRBqYE/l0GiG0zDnAs/bQ3BBDhlCp2rkivC/?=
 =?us-ascii?Q?6GO6tGVmD/nbj0HuFmwR4OglDQI9CbGasFxvNFd2njTwdS3BAg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.41;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:exch.smtp.agilent.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 15:23:22.2689
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab6b385b-4813-4167-245d-08dcf1e44cd0
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.41];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF000015CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8371
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 21 Oct 2024 15:23:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5541

From: Chris Laplante <chris.laplante@agilent.com>

1. Make it clear that IMAGE_FSTYPES has to contain tar.bz2
2. Fix the 'cp -a packages-split/bash-dbg/* path/debugfs' step to not
   literally try to copy a file called '*'

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 documentation/dev-manual/debugging.rst | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/documentation/dev-manual/debugging.rst b/documentation/dev-man=
ual/debugging.rst
index 92458a0c37..6b5d2dd820 100644
--- a/documentation/dev-manual/debugging.rst
+++ b/documentation/dev-manual/debugging.rst
@@ -1006,8 +1006,9 @@ debugger.
=20
       IMAGE_GEN_DEBUGFS =3D "1"
       IMAGE_FSTYPES_DEBUGFS =3D "tar.bz2"
+      IMAGE_FSTYPES:append =3D " tar.bz2"
=20
-   These options cause the
+   The first two lines cause the
    OpenEmbedded build system to generate a special companion filesystem
    fragment, which contains the matching source and debug symbols to
    your deployable filesystem. The build system does this by looking at
@@ -1016,8 +1017,9 @@ debugger.
=20
    The companion debug filesystem is not a complete filesystem, but only
    contains the debug fragments. This filesystem must be combined with
-   the full filesystem for debugging. Subsequent steps in this procedure
-   show how to combine the partial filesystem with the full filesystem.
+   the full filesystem for debugging. The third line ensures that the
+   build system generates a tar.bz2-formatted copy of the full filesystem,
+   which will be used in subsequent steps in this procedure.
=20
 #. *Configure the system to include gdbserver in the target filesystem:*
=20
@@ -1142,7 +1144,7 @@ debugger.
       $ bitbake -c devshell bash
       $ cd ..
       $ scp packages-split/bash/bin/bash target:/bin/bash
-      $ cp -a packages-split/bash-dbg/\* path/debugfs
+      $ cp -a packages-split/bash-dbg/* path/debugfs
=20
 Debugging with the GNU Project Debugger (GDB) on the Target
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--=20
2.43.0


