Return-Path: <JBezem.extern@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ED88C48BF6
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 16:16:41 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.82])
 by mx.groups.io with SMTP id smtpd.web11.24390.1708964196576099745
 for <docs@lists.yoctoproject.org>;
 Mon, 26 Feb 2024 08:16:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arri.de header.s=selector1 header.b=D8dDbjP0;
 spf=pass (domain: arri.de, ip: 40.107.22.82, mailfrom: jbezem.extern@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FPWJGF4JLTo7AAB4/HebIcdYhvsDNIkvgCiwklcnJoIo9Hb+TAjsPmujk2Lyqag7VAjIYbYWkrV6UbNcQvNVLMzgGPu5bGra3UJ5XJSr7bjvkvIS6znXbu6XM+8CnfeOAXtS2Rr5XpL7Eso6ud639sMtKxgmsIYCWtToqWi3ZgATH9yAUze43tc/AzVEQ8+laUAWDxPd1ugkhOT3BMMr94rEid3QjmLKcUmWRlAIM91/n6pS7H+JyzJrHmLjbhTqKqL0jWLVbLeBUDciadnnlCfSIzbA67PAmU04yChYU5e9sx84G/nha96prPbTLQB3lv1MQmYOzYvnitdSbr1n2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ht2dFbHhMJIv5fvZ+f7H/e3ut1UCkqyPnAOhwA9oExw=;
 b=OPmDmqu3qgOgqBY4UezGNQB0CZcGKETCz7Z5FOUL1aAQOkXrsXnI8eWuRn4Llop6zQ4n+HCHGy0Wbz7qBvPwEbjbWiRWSCFkev13d4pWF+cKJabpautaK/T/B5pCpgNo0EYCf8cpqVULJTLMNnZnDxOWvry+Y+R193N3kljogs36H6bNIYFDtdYNKV/VvgFT2cg8qQp79HBiwzCAKqkIdF6MLr8Zi3n+Sd0lIBFYHGJFKPeTIkQbrd2hkLCnPdhlaK40/ECFzOzPKKTcnjIO3BpLjYvIqx13UunoE+9iKRlgfRPagn65nJg9sHILVxbnWLMIVJeZ94/VB1ZKx7mDbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ht2dFbHhMJIv5fvZ+f7H/e3ut1UCkqyPnAOhwA9oExw=;
 b=D8dDbjP0qh+XRCzGiGPcjIGSOUzVbzd+M9iRf/E1RdrVLeSDsT7wRlyYLGoWzBstmI5VoqvAlhc+p39L5cKJBqfeYF7BqzlOQEcGhG103kbN1BLDuEuiWJMVN3Pe8RQFC5ZV4jn61h9Rq/P94aGxa1EFvNFAYvUpdo2iyCpyrKM=
Received: from DB3PR08CA0006.eurprd08.prod.outlook.com (2603:10a6:8::19) by
 AS1PR07MB8541.eurprd07.prod.outlook.com (2603:10a6:20b:480::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7316.34; Mon, 26 Feb 2024 16:16:28 +0000
Received: from DB1PEPF0003922E.eurprd03.prod.outlook.com
 (2603:10a6:8:0:cafe::d9) by DB3PR08CA0006.outlook.office365.com
 (2603:10a6:8::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 16:16:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 DB1PEPF0003922E.mail.protection.outlook.com (10.167.8.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 16:16:28 +0000
Received: from aa470699af70.arri.de (10.10.30.27) by mta.arri.de (10.10.18.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.28; Mon, 26 Feb
 2024 17:16:28 +0100
From: Johan Bezem <jbezem.extern@arri.de>
To: <docs@lists.yoctoproject.org>
CC: "Bezem, Johan" <jbezem.extern@arri.de>
Subject: [PATCH] variables.rst: SDKPATHINSTALL correct installation default path
Date: Mon, 26 Feb 2024 17:15:06 +0100
Message-ID: <20240226161506.48020-1-jbezem.extern@arri.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.10.30.27]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF0003922E:EE_|AS1PR07MB8541:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f2993ff-eb37-42e5-31b6-08dc36e64998
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	St3kGEBf89X39JFijohNGOwkQT42+0ViJHiwM2ts6TGnNnvBVfJ4cW3YzmFiRZ0umJJXiscGsXknSbSgGIR0QzZ9onmvoVoU2tvqJQe5Ls8LZ+9VX4eyDx5hKZiJYQBft+LatVyqJRmJ1FDXKCvHZmqkfrouVQODCFLLDKmX/HHeYI3wViFtljv2vEY0tz7Xmr7owV0he1pMmYyUVD4BvAz+hmzUL/4dxv35l8RWpeLMpQv8OBhcZwUF+wuuThWzI9Nml/ff+U2RLVjnNzin+ifkLG5tFz6AOfep/G6X+BSFRT2SBJJcVSxSMZovOs5Pi0nWOLAALJBnPA4igQfohi3AttCxU04ZLBmo6yTTEEPmTJfqmXxHnV2SxYs9C0+4MijWIKbK46o4/hZTUcc+STZtlnYW4oIc9dIAkWvk9+5I9pSXjcQkkvX63V/BAVg+NCF8Zp7u5OjOoUtS652/UjIGn7yAlGMrF+rg7xQpWIZkHT3ytX+at+sWMcdx92aiGGXsbCXPDkc7o4RWnqLfAwXt4K1gWCRa1r4aWdc9uUlzSIoOk7hGguYKqy8epxCVjk0t7hCsggPAuMm15RmKQoxgcwEpFwA48bjgjhiDTaR9YkJ2izmL43kgp05mmWk2ahDWJw+Vdk60v+4PDrRqBA7rl/0578LQmyKc9sZ8fNvfje02yx6WNvrNUaPASYY4U4fNW9acHsgLTKPOKRGknb8yUVxSGjOeNrRtqsii93V9JlzkfGS++h/zwKpcV3xF
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 16:16:28.4231
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f2993ff-eb37-42e5-31b6-08dc36e64998
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF0003922E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR07MB8541
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 26 Feb 2024 16:16:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4875

From: "Bezem, Johan" <jbezem.extern@arri.de>

The SDKPATH variable seems mistakenly identified as the
default path where the SDK will be installed by the generated
installation script, unless option '-d' or a manual input
overrides this default.

The intended variable is SDKPATHINSTALL. SDKPATH indicates
where the SDK is being composed and built.

The definitions have been added/updated.

Signed-off-by: Johan Bezem <jbezem.extern@arri.de>
---
 documentation/overview-manual/concepts.rst | 2 +-
 documentation/ref-manual/variables.rst     | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/ove=
rview-manual/concepts.rst
index d177ca33b..62f2327a7 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1375,7 +1375,7 @@ This next list, shows the variables associated with a=
 standard SDK:
    Lists packages that make up the target part of the SDK (i.e. the part
    built for the target hardware).
=20
--  :term:`SDKPATH`: Defines the
+-  :term:`SDKPATHINSTALL`: Defines the
    default SDK installation path offered by the installation script.
=20
 -  :term:`SDK_HOST_MANIFEST`:
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-man=
ual/variables.rst
index a0187a6d4..fc348f103 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7598,6 +7598,10 @@ system and gives an overview of their function and c=
ontents.
          configuration will not take effect.
=20
    :term:`SDKPATH`
+      Defines the path used to collect the SDK components and build the
+      installer.
+
+   :term:`SDKPATHINSTALL`
       Defines the path offered to the user for installation of the SDK tha=
t
       is generated by the OpenEmbedded build system. The path appears as
       the default location for installing the SDK when you run the SDK's
@@ -7607,7 +7611,7 @@ system and gives an overview of their function and co=
ntents.
    :term:`SDKTARGETSYSROOT`
       The full path to the sysroot used for cross-compilation within an SD=
K
       as it will be when installed into the default
-      :term:`SDKPATH`.
+      :term:`SDKPATHINSTALL`.
=20
    :term:`SECTION`
       The section in which packages should be categorized. Package
--=20
2.30.2


