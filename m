Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77A3BCA0FE4
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 11:40:18 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.110])
 by mx.groups.io with SMTP id smtpd.web11.11309.1725018011823399584
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Aug 2024 04:40:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=isomikeB;
 spf=pass (domain: navimatix.de, ip: 40.107.105.110, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NOl+NvwGs330yO+y2QNl2vuKoDf9cbUTgVOOd5N5B0m2PeJAFSjicx3iHohLEoaFVa48bHutKQ4OL0xvMCpaw7HZIMlafe0rUnFBS4IeN2OkbnK/L+mFF9GjUGL1HHNrNP2IdpcoTwHdR2eMNxRowDDR+qCRp7TKSAsD5Yoy1/lciTDE18U2Sfb6VLZNrBmN1sQn0PEN5azM5GrqDVuGzQooMTGAe4m36UnCK7XZbKa8qhKb3Od7z2WijaHsLvXPQQ8oQcyudvhkjZprzkNPylW+tb0OxbcyIqAlkXkRp80Wh+7giRYjrNCjdgOJ+idcx3RPNNBYbpYtq7GJ1waxVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YA53X5/69kLLAhzWTx5kaRAMWEkNS7vd2cgf/UWc1CY=;
 b=b4w2gCsl77EDLzyphA4vGCNGlX+AzMSCqPlJu8838N7rpoXeGvtyEIpDOGYgZXTMJGLpJXK9L8+10W+H3CSQ85Ev0+UE5E3EKnXsojIcfjXpU+dG3nndgD/TfeGadPGbATq3NJ6s2pwpkrnDntF3Jo9KBWDvmcBKB68DLYgaoZ4SqfaB0xWpkYAcl9qu+v8y/hUePTahNhPbLRQrKJ1OcTlZ5KsCZ98MhXJMz+nt0DWxHmMp/i0fhljCI/SU0rsNo9T+cFKFOrIgWP5pIm13KXybjHdIVS5FZNHhkqnY3vhbREuRo4KRKbkcugeuOS89AraBL49mDhZ+S9Fl15Gbbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YA53X5/69kLLAhzWTx5kaRAMWEkNS7vd2cgf/UWc1CY=;
 b=isomikeBp2rQ8eOs8OJUKx05748mBvCO58v/MXz4xWKukEUoyjDJ/RofqDWCq1RR8TY1XYII1uzOy6G9RRqa6+Py1Gz/2s3eM509dRoOlNKoTfoYEQT36iMOxdRGf3qaGeoaRJT4Awoo8HZ083nTdfXOmFp/9C3QVZj3EEkAWJ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by AS8PR01MB7591.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:2a4::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Fri, 30 Aug
 2024 11:40:08 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%2]) with mapi id 15.20.7897.027; Fri, 30 Aug 2024
 11:40:07 +0000
Date: Fri, 30 Aug 2024 13:40:05 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: docs@lists.yoctoproject.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH 2/2] doc/features: remove duplicate word in distribution
 feature ext2
Message-ID: <73cf255dac1cc3c79efb1b00f4f800c1e6d07435.1725018000.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
References: <9288e40f901792887ac98417ae8c89fcc2f23a0d.1725018000.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <9288e40f901792887ac98417ae8c89fcc2f23a0d.1725018000.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0464.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7f::28) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|AS8PR01MB7591:EE_
X-MS-Office365-Filtering-Correlation-Id: b3e3d502-831c-4489-051f-08dcc8e87f2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6IHEWUl8r1P6dL1EIp39s9jkbfZbbpvDToqyI7h+cGwyq5X6MI2ob7O6O9vd?=
 =?us-ascii?Q?Wac30TGyd/OlQ+DDPZWA+oC6Tgvo6vV4d1aD+i0JlXhoEPyIsLgA1nySKKX3?=
 =?us-ascii?Q?KGnno4eBtl/ysKrhAEzwo2fBBntstLkfV1KSkTzEb5Ho+gL2cWAzqdhnK5jT?=
 =?us-ascii?Q?phOhxGtAIla9Hh89eFoaYGGo8lygp1y5LYSeq6IYYOnI3V5fFGWPRIYdMAeh?=
 =?us-ascii?Q?tmJN+BTzbDZPwwsZ/QMR4xbFJAqap+ryn/R+WPw1RXrndLibrEe91b+ssUyO?=
 =?us-ascii?Q?CEX0m3TjMpngIMo406qaLgSLRMeTErfsXKslgICgynwzUYXUsUoCvXZotGyH?=
 =?us-ascii?Q?KNu/4/pgH0KzpYBx9zv8sLuSQJ53q+wclI88GLMLSdlS/rnpT4QELM07n3G+?=
 =?us-ascii?Q?OBYgiExebB5/WBd1SMXqPnkAS3Y2gBZqe/E0V1VYtDpTLZhoWkb0V3Mle914?=
 =?us-ascii?Q?dgj+YBTvH9P7iN5YGgpOhzjnfGpmXes6Qn/qmr9u3A4NCeQF0bzbDiPWUJ+c?=
 =?us-ascii?Q?XMyWxK7bLTzdtVGk81VbLlozbDD0E9vNsULAoU3Y8zbM3bVQkAiwvdnOzSqi?=
 =?us-ascii?Q?RyFckZryIvB1Q7SgdPI+6Z59xi/hdZQLkriQncfCkTTg4S908FxCK/Fb+Np1?=
 =?us-ascii?Q?SsFcLJQn2e0tVWPcwrT1/JbGi6A50JyBDwjTExFZY2+eeEplYxCQB2uSmczN?=
 =?us-ascii?Q?sZ7OT3dw8mVpvReHMpfq1Lz8depLxtb6PofFVk9Il1aQFIEBVgpIPhyFFDsx?=
 =?us-ascii?Q?NnRFHJ07fkqHRUX86PvZ4zWV+NA6vVyjl1StHOdwrVR5VrKikhT7IYLYzW22?=
 =?us-ascii?Q?rzTfMhlyCcm5QriOivm5GFNxHJ9VlVIi8V4L9qQfdJQ+56UDNtC5ONsD3xfv?=
 =?us-ascii?Q?7WH+Te/9KDM74FJ7KlYbc8cJosyddASqMly4wi3cDltmJ4K1mQRfquyTZtQw?=
 =?us-ascii?Q?R1tISl8/XMxtPB+KeoqnS58kSp7LsT8wLHFEyW3vncgYGmkQrzOL/XeZzPeS?=
 =?us-ascii?Q?vvKw/7zg0F6ZvJTJ5JQ4r7OGCzAxAdbxNN1WO8AyFmDvQVnUoCw4/AiWGafn?=
 =?us-ascii?Q?T44zRzJpTcC41DPOY/N47xfNNvVzKmQdBPPWkuNHMcqxNv5vvEBQUUst6Vys?=
 =?us-ascii?Q?NgxmMXri6ksYpBgg6MV+ly98CbqwprB/12S9gm1dTAlCq9OwZF3a+3BFc3Rz?=
 =?us-ascii?Q?NplqkwZAiPE8gby3N/1LzOai35NL5CTS5OVfYy3QubtQb2hwFHcvRwAyDy6s?=
 =?us-ascii?Q?eHcMHOqiRZVbOJRo/+Mr+nGioNNZ1jITC8l1PpbVMtiOcJZBMG5JnlFjeQ6u?=
 =?us-ascii?Q?0t/Covva3O4SqpCW94AElxvi6pteAN/uxcZpBLp9Ikb1SA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RpSwvWFCnj9LkIPeovWr9XG97j4fukWeCqZW5qIwLE5QqqdRROqTDh0O+Clr?=
 =?us-ascii?Q?ncwvhHNwriW/I0P0OKikY7GzPqsawEtwZoGV+nvBT2ik2P0cDVHQIQkF9EpY?=
 =?us-ascii?Q?0obt0NCi3q58NnHmsTL+abbc44f4gENWgAbi47SUfNn+zG6pxqWvi0k3wYbY?=
 =?us-ascii?Q?9Ca+pV3It8jLqusVtQ41ht5zadzXNq9rLOidVfCSGIunQl6morLa+W+33qQG?=
 =?us-ascii?Q?zAZPI2SU4400LnUax59nWCGG1HuiHWx2n2iyVfl3RS1hehOiq5+FKbl3sV73?=
 =?us-ascii?Q?7xnadgmHUt0Lg9kTGVFRjR1pjclQpOsd/mPaRNd/Bb6yPumO/QNhG9lcFzq+?=
 =?us-ascii?Q?h3DGj7zNYoj5pPeLSHB6SlZOcKdxnLR7xjMMU/BdNl6Dhk6apc8TGE/DRU1T?=
 =?us-ascii?Q?08ZizoYvLC6aVbkjX9R5cuXSDBth9+yzg2vIEoob5j/q5DRW9P/2tdVJwBjs?=
 =?us-ascii?Q?+is7QkQuJhxSmmwpBp1CE9m3h1h5qZTF6ladqH77j/iN7qCpozTpJmPnmkKB?=
 =?us-ascii?Q?8cvGTFve5Yt98e9o1K+QlxPcFMS6S2OcYYkVU5UyB9lXQcCRIdSdNJNSFNxF?=
 =?us-ascii?Q?VqNEkaJ9JCFPdytVg0hTxun569XTD4DEiVUfzv9AJ8Ykxr1yLmliR5SAIZ3v?=
 =?us-ascii?Q?K3wLMIw9KvrgO57Uj+k2VYK006+NNA1meOwTOINmCBb9JEVKJ6L7Q9rgp81r?=
 =?us-ascii?Q?d6nASsHNwpcxYzAaAECTk2bTDaRJH0NuUp+moYutGKCTyIC0kOVgOwcJZKAC?=
 =?us-ascii?Q?mVpq2OCLDqH5sn3hNAJBPLbVovATaG0wuytBOouvdHxaFNQ7QmqBa9lqYZwo?=
 =?us-ascii?Q?XRpdpBgH7+4F8TOaNqx9oHq6oAGBHeZ8HVDMJ54dVlXTTrQR9k6Pd/rFGBPG?=
 =?us-ascii?Q?jlLTLQLQoQpkQChlB9NnhpYkj0CHoorSGPFMiuPfuVHvqhwvWnaq+oIUmssQ?=
 =?us-ascii?Q?DLRy+TNNogDoVtt0/u6JTxxF4/narNsXjdr/XKDsSDkwko/MduKzu0Earapx?=
 =?us-ascii?Q?9DOxDU0t/74WVtmEukShGWIvdF16CuDSMBDwd9oAdV/Bct7qDR30129lPI+g?=
 =?us-ascii?Q?Xw12Xgebp5xQ8ftyN5tSPjpRvhep4kppNWPNwxNAvH1St194zizD8RjxBipe?=
 =?us-ascii?Q?g8JJ1fE8FIHBgFUVS9kSTyYTevwE5AtN5g4EiGFE0nLG7Rexjarpyld5UB3v?=
 =?us-ascii?Q?/lh9bMgdA6YzZZsAnoMekh9z/FI/6sRRjKKzBlEiWzEjdplbrSRADm5pPqNu?=
 =?us-ascii?Q?xwpWvBjE4IZ3WeiIUDxZO+w6cmqwcKd1ugKRTxIOE56TnqnqYE7zYR9XKb7v?=
 =?us-ascii?Q?GJBBUgr9ICeUwT+6SOhvMZEpkV3YNVp73IP+N/5XszRWv3dBvCMDtjKz14xf?=
 =?us-ascii?Q?X+NU47zNxyN/WhP3LhmMVtGO7c9fMKRYfYrh8e+oAneDGX4iUDlfXfoJgIO3?=
 =?us-ascii?Q?4PHbImx9u3gywSb7R6z/lQ+iqlsRt2bF3dgy4MeXVCNmd8fKk1D/ikt6D5oq?=
 =?us-ascii?Q?6FYX0TsDIY7j7H2h7IRjlO818VYui+MxH6dPTgHT82IYbUBeodM1CIASLrxm?=
 =?us-ascii?Q?nW7o2fJIvv9+9ajE5twwJCP47Bl2C+JlY4gcgKWRwwrjC549aiLhSqvIogvE?=
 =?us-ascii?Q?7Q=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b3e3d502-831c-4489-051f-08dcc8e87f2b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 11:40:07.5767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J2BULUDxKTW+NWUgzuGV4Wqwdhg+oXGPwYHSpGqJjDSTrI4C2fw3JkTs4IgKR2iCNXlZgaZfW5Y6nS+R1Ua5cCWH7NfI+IXFzWDv9DWdowU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR01MB7591
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 30 Aug 2024 11:40:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5342

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 documentation/ref-manual/features.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manu=
al/features.rst
index 81f09f59d8..88ffac091a 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -146,7 +146,7 @@ metadata, as extra layers can define their own:
=20
 -  *directfb:* Include DirectFB support.
=20
--  *ext2:* Include tools for supporting for devices with internal
+-  *ext2:* Include tools for supporting devices with internal
    HDD/Microdrive for storing files (instead of Flash only devices).
=20
 -  *gobject-introspection-data:* Include data to support
--=20
2.34.1


