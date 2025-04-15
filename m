Return-Path: <L.Anderweit@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16045C369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:21:24 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.125])
 by mx.groups.io with SMTP id smtpd.web11.19899.1744723277521214053
 for <docs@lists.yoctoproject.org>;
 Tue, 15 Apr 2025 06:21:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=selector2 header.b=FKpn0TpN;
 spf=pass (domain: phytec.de, ip: 40.107.22.125, mailfrom: l.anderweit@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ipijFbW/Kg2kkbWeq75uZ/jvsyuqGC2oh3Wq7gPU2z5iPDzmF2ki6XtWmo5w4khyBmUlqeNgpaDlIZiE1v0f6Jf8UjUPR0lfJP0zIRSITJN2zReowQNAvHdj0jBIT93SgwQPIrTppCbPyZJb835f0C7WAmXzHw80CNsW8/xJBv5/O6Y/ARrOCJk/DbTTNL0YpDHQttcVkXzp++nQ3isJuyuhvcQqizjktgrfeAVY0ElH0L/0tWsZ4WbDDryB8uvoYrHhVGaqW1FsLRvKkQ6Z8nObC3dVfsJncmsp61RIczkT1qRMuPsMcx0sGmUtUfKv5FkJL5HKMoymns96XC3nvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZzFr2KpvwQDCBdW3gcH1PNUkLRmmd3WTUWpcRXG6yk=;
 b=RVMKr6wCXCns/CeFwSUsYyrAgix4P2qFoaG4RxdA+w8v51C97Men/UgPTuAp89ou+zEtJkKu3XPPW2BYV85DVjUw0gyHq3+9TQ0s72u3fkhEjC1saPAtTSBRU/hvLQW0JHkQhpFmCCte27oOZDAQyTgIXrvsoStqzRsTjTUhv+Id7iuZ+Lm2lACEL0tJkR889EfF/6jZl+cJyKTJU7tbZz/n8XJVOfdyoh9KhJ96TjCOr1CXA9udOpPJfoQwDNaRz7sEW8up2NNekVaMUa7rpwxC/g4Swz0OYReLD1y8DVCtG+kcSJ+c8gWebpzZQE6NmjU4WJYZAaL+y9I2JN8fYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RZzFr2KpvwQDCBdW3gcH1PNUkLRmmd3WTUWpcRXG6yk=;
 b=FKpn0TpN+xxnbyvQ0Boquzp/obDEPDc/ZVCC1wDxwGjky6bNet2rFuctOjafwVmmXebv8c0kCS9esGHn3xrhYjGqVb42Y0nvkDid823IpMs7ZwsKfZhyq170ub3Dd20YW7LtEs7ZjW0i3C1dCh4XCIRotkBtuqbK0ajJeJwxH3+BjWMTB2wsIZa0gCyA3nK06IZMjIhXLAxQXFF3F3B81T8iwqNB+2q1+SSf5t8xA3NDmTpkX8yHegBaTkG40M4Cra1M8bZ/sy+vipQMi2rTaxUbEux0/th1jpM0FnhDCzVUqjA693t1RRqvMBvXkv6ES1R4sEoKA9Gp7R4LvACpEw==
Received: from AM0PR02CA0226.eurprd02.prod.outlook.com (2603:10a6:20b:28f::33)
 by AM9P195MB0934.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:1f1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Tue, 15 Apr
 2025 13:21:14 +0000
Received: from AM1PEPF000252DE.eurprd07.prod.outlook.com
 (2603:10a6:20b:28f:cafe::85) by AM0PR02CA0226.outlook.office365.com
 (2603:10a6:20b:28f::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Tue,
 15 Apr 2025 13:21:14 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AM1PEPF000252DE.mail.protection.outlook.com (10.167.16.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Tue, 15 Apr 2025 13:21:13 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 15 Apr
 2025 15:21:13 +0200
Received: from llp-anderweit.phytec.de (172.25.32.131) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 15 Apr
 2025 15:21:13 +0200
From: Leonard Anderweit <l.anderweit@phytec.de>
Date: Tue, 15 Apr 2025 15:20:54 +0200
Subject: [PATCH] ref-manual: classes: uki: Fix git links
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250415-master-v1-1-00ec2b8cc934@phytec.de>
X-B4-Tracking: v=1; b=H4sIADVd/mcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDE0NT3dzE4pLUIt1k8yTjlDQj47RUw0QloOKCotS0zAqwQdGxtbUA84v
 P0lgAAAA=
To: <docs@lists.yoctoproject.org>
CC: Leonard Anderweit <l.anderweit@phytec.de>
X-Mailer: b4 0.13.0
X-Originating-IP: [172.25.32.131]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252DE:EE_|AM9P195MB0934:EE_
X-MS-Office365-Filtering-Correlation-Id: 08b573c0-b9c0-453a-64a4-08dd7c206549
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NExPc0luMWh2WHpFRVFmNlJ0NEhMTEYwNCs1U21hbnBIZ0dYS2FxU2tvSm5J?=
 =?utf-8?B?QWFDcVM3ZlZrZUVTYmVFUUhSaFMvTno4WDNxeks1SnQxeFEweEJxUEwrUnRH?=
 =?utf-8?B?SE9NUUk5RTZmMkR5ajVVMUs4cUI3TmhsV2FxREEyZGZ5OHdIbkxZU0pBYlBz?=
 =?utf-8?B?cThUOGJwUUUremVOTnRBQnNEV3lxdzV3SjFUNHBmRk1RTDBNdkpOMC9rcnJM?=
 =?utf-8?B?NFExQUljTlpGWkZIai94cFZsY3pwR1hTKzU4TXhPRFh1bmpQQ0Mvc2JRbUpZ?=
 =?utf-8?B?UnE5ZmhGb3lha3NiOHdUMTN6enIwYlhnV2U0STdMRGxUaFNKZm5LeHgxNHQ3?=
 =?utf-8?B?NTUrSjRMbURjbWJNWWM2T01wKzZFcTVKeU16dmlBQlQvMjVVbWI0YThJeWU5?=
 =?utf-8?B?UlpXOXdzWm1DTFFxVUw5TVBxUUVNTi9VTDlRYVNSdTAxM1Y3MTlaL3BDL1hq?=
 =?utf-8?B?UHZyZUlhZkZNUjFZclFvOXJVQ3dzdzB2aHVZS0M5cmJDRlJDZWhoeWhpMFNF?=
 =?utf-8?B?WDY2OEtjVFN1RHpwWSt5cHh5dTBJTFRTVkhiWlUyUHR3MlBIVVV4S2lFeXhi?=
 =?utf-8?B?VXoyVkovcnpMR0g2WVRVMEVwMnhGNzBuTkUzTGNuY3VBc0F4TWNobTZoRnZr?=
 =?utf-8?B?WnplZk1kdExic0VXRHJIOGQvancycldJQWU4QVBMdjhFczdCbk9GV1V3MFVu?=
 =?utf-8?B?RHpqOVB1Ry9FaXExYmRPci9MaFhVeHZ6OG5UMUt2dkI1QXFOZCt0Q2cwUnVN?=
 =?utf-8?B?TkFpeG9yUFY0R2JKVDQrc0l5T3YzWHJCS3BqajVhQjVzMy9oZ253WFh5VEV0?=
 =?utf-8?B?OCthWkYxOUdyWnE4RXZ5dDVVTVZQSG5ReTE3WGZ4aU50cDdwVlJRM2lzQ3VI?=
 =?utf-8?B?LzJBdzQzYkR6Ui9DVGs5N2pNM1U5WWd2WEp4ZjZ3Q3IzNXlSVm9BandMZ29r?=
 =?utf-8?B?OUdVbm95OUh5Wk9uVGYzOXl0VmFxWVp4SzBnUS9qNk1XNWxvWlBWU1E3eitE?=
 =?utf-8?B?aWJOQmhvUXYwcDB5N1k0WENKZ3htM2s2RkV1Zmk3SDlFZThXb2VDVXJDaXhM?=
 =?utf-8?B?WDNjaWZsTXpqcUwzdzlhZ0NYOTNqbzBDdnNhSVl1ZkJsTFdSViticHgrUzFJ?=
 =?utf-8?B?LzQwNEl4QmZjYysxUzJTOXIyMk1zV0d6MTVuMjJaemdlMi9oM2NmVXNGeDdQ?=
 =?utf-8?B?Z3ZlQjVwY1gzdUJmaUVPWFd2UkJsY3RIM29VNHZ4cEpDZ3hNKzdRTmU3ZG9D?=
 =?utf-8?B?Y3UyMDBQOWs0S0MzSEJOaC92MzliLzNRZTRkdlNMSVZoc01TQVUrSUFYT3J2?=
 =?utf-8?B?NHcyZDBQS01PQUt0SmVrZy9udSt6RW41bmlxQjNvY2hVTzhnbXJ6cHJRT2VI?=
 =?utf-8?B?bjhQU2poWThKdzNTa09GaFpQRXp1UnZURWtLUGVsdXI0OWVad0RLdit4R2Rt?=
 =?utf-8?B?SzBISERSZUIvREtBcUJGVkMxZWtEWmJ0UTdYaEdjR1p4MnlBY1JWWHF0dWdK?=
 =?utf-8?B?bXlFZWtFSjhRazdBUnZ2L0t6NEt1cGtMMmdicVJnM0g2b0M4cWVFNUhWWVkw?=
 =?utf-8?B?Uy9jTU9kdjArb1VwSzhXcWp3TWJPZ3FIcWcvWVk2NzZQdEMvMTUrSEUvLzlK?=
 =?utf-8?B?NDA5VXVMak9IU1dQemwxbmRHbzloOUoyVmdzamJtL0ZrTUE3OFdQVHkzNWJ1?=
 =?utf-8?B?bFcxL2ZUOTlHOUt3eWxvVXJZbFgvQmVvRXZhRm9Ea2Rwb0hyYmltZ2NKNVBi?=
 =?utf-8?B?dzF2N0ttNjBVYWtwd0tNSWc1RjYvQWM3bnk1Z0RuZEQ3MWlhbVBsWjZITFky?=
 =?utf-8?B?dllVNEh3eHBNZFZURUVnRVh2T0d0R2lUZm1qVEI4dWZnTW5JSzFIWWJJWkYz?=
 =?utf-8?B?OFZrTmYwcnRWMlhqSUpKZU93bi9Na1JVei8yZm9QeUVJaUZtVUorZ3lTWUlO?=
 =?utf-8?B?QXlPeDIvekpodmpaTGJPUXF4a3hENEZSU1BqeW41OVhtZGJqdTdDSHowSk1p?=
 =?utf-8?B?OHNKNy8zVGRBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 13:21:13.6272
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08b573c0-b9c0-453a-64a4-08dd7c206549
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252DE.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P195MB0934
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 15 Apr 2025 13:21:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6748

Fix links to files in git by adding a leading / to the path.

Signed-off-by: Leonard Anderweit <l.anderweit@phytec.de>
---
 documentation/ref-manual/classes.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 59efcbe19a71..5187033f77ac 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -3452,7 +3452,7 @@ on target hardware. Using ``systemd`` as init is recommended. Image builds
 should create an ESP partition for UEFI firmware and copy ``systemd-boot`` and
 UKI files there. Sample configuration for Wic images is provided in
 :oe_git:`scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in
-<openembedded-core/tree/scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in>`.
+</openembedded-core/tree/scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in>`.
 UKIs are generated using ``systemd`` reference implementation `ukify
 <https://www.freedesktop.org/software/systemd/man/latest/ukify.html>`__.
 This class uses a number of variables but tries to find sensible defaults for
@@ -3462,7 +3462,7 @@ The variables used by this class are:
 
 -  :term:`EFI_ARCH`: architecture name within EFI standard, set in
    :oe_git:`meta/conf/image-uefi.conf
-   <openembedded-core/tree/meta/conf/image-uefi.conf>`
+   </openembedded-core/tree/meta/conf/image-uefi.conf>`
 -  :term:`IMAGE_EFI_BOOT_FILES`: files to install to EFI boot partition
    created by the ``bootimg-efi`` Wic plugin
 -  :term:`INITRAMFS_IMAGE`: initramfs recipe name
@@ -3481,9 +3481,9 @@ The variables used by this class are:
 
 For examples on how to use this class see oeqa selftest
 :oe_git:`meta/lib/oeqa/selftest/cases/uki.py
-<openembedded-core/tree/meta/lib/oeqa/selftest/cases/uki.py>`.
+</openembedded-core/tree/meta/lib/oeqa/selftest/cases/uki.py>`.
 Also an oeqa runtime test :oe_git:`meta/lib/oeqa/runtime/cases/uki.py
-<openembedded-core/tree/meta/lib/oeqa/runtime/cases/uki.py>` is provided which
+</openembedded-core/tree/meta/lib/oeqa/runtime/cases/uki.py>` is provided which
 verifies that the target system booted the same UKI binary as was set at
 buildtime via :term:`UKI_FILENAME`.
 

---
base-commit: 3b50193fa0c9acf4a601aeae6e1c78d0e4a05aef
change-id: 20250415-master-c7b3df23fe1a

Best regards,
-- 
Leonard Anderweit <l.anderweit@phytec.de>


