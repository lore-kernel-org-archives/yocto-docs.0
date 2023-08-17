Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22147C3DA45
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 15:51:56 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.100])
 by mx.groups.io with SMTP id smtpd.web10.423.1692287514639271539
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Aug 2023 08:51:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=XXsVbZUY;
 spf=pass (domain: ni.com, ip: 40.107.237.100, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j1coXPc/hZ6R4pallwyq4Gr6sQlE0WI+XwF5m8m3Efw71jl7m/MPCKwyYpEUX1RGM6LYZKHAsLjMNc6pj+F2Jx0p3pIwSZQZdXboRzAt8+MxWTrWI3kNd+VXkMDxG/X7DCU2cvHKKiRTds3LiMQsxMjE+RX1l2NyNn+l3EBvB3IaH4ipqydgo3Y/e/wCsvQHd0bu6OWEmo/hO7U39CDWm2agPbP1ujaOz2cPfmT/r0ZJTRLFZFp+kwxk8D4eVmzbNR0TvB6mmyOZQogghMwhsXKmXfnvDTBAtYTVGbGv5FqYdvnuPrVwaSJMPefXfl7ngLnBWkI3Sb70ZGQNR7x1IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=njjBK3Uf/EDr074Z8O9PvNJ7WMWmwWZzyL734adyhMI=;
 b=Ce6kZ1gu1MJz8tSOoa64bkOQDJAfA6DiGu9jIdVX+aLBSTlgNlDUIMLr7zPOqQQiJg5kZyzIQkDAfQKMvvb1GE+KhcehWc6HR4jWa8LuwAeTRmmOxS9ZzE3XefwG8OpX7qiWHs4m/pPrtQN/u+Ac4oRDKWFE1FGJwEYWzPTWWuJOCf6+X6sDx/shKsnxVRidgcwJ+8IZSmkwy3ph/g85Ia5KRykz+qPQaFfGK1WBy/rtcBLoVAugZNDdigstTYM/jKmWTNn+Znyu2kkx0C3jf+y/lWixG61oODfCxfcIa4uO4lMhNOC7MXL3dwlFzCVg1PhD+/ZeCky5w5j86q+3Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=njjBK3Uf/EDr074Z8O9PvNJ7WMWmwWZzyL734adyhMI=;
 b=XXsVbZUYXz0lBfVOd66qtbfaEPlX4kODENQDDqE1Flw6AxTdSydzjCuvfHMCLRaM5cidOruBQQoG/3wpRu6/UmFdUT1EtIEHEtBBAcYjJw6xapZFUQG0ZEXkJYNyRC2G20qPMcgY5NNTdhxM5rGySU8No+t+AyJ7Ir0G7aux35s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from SN6PR04MB4879.namprd04.prod.outlook.com (2603:10b6:805:9b::29)
 by MN2PR04MB6877.namprd04.prod.outlook.com (2603:10b6:208:1ea::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 15:51:53 +0000
Received: from SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11]) by SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11%7]) with mapi id 15.20.6678.029; Thu, 17 Aug 2023
 15:51:53 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: docs@lists.yoctoproject.org
CC: Charlie Johnston <charlie.johnston@ni.com>
Subject: [PATCH 2/5] overview-manual: Add deploy-ready package feeds section.
Date: Thu, 17 Aug 2023 10:50:41 -0500
Message-ID: <20230817155143.2578874-3-charlie.johnston@ni.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817155143.2578874-1-charlie.johnston@ni.com>
References: <20230817155143.2578874-1-charlie.johnston@ni.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SA1P222CA0056.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::8) To SN6PR04MB4879.namprd04.prod.outlook.com
 (2603:10b6:805:9b::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB4879:EE_|MN2PR04MB6877:EE_
X-MS-Office365-Filtering-Correlation-Id: 92d88a6f-e949-49b9-e071-08db9f39e056
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7D0GO1LHvL9KcEJXVS28lJAoIZ279f+0us5QRSDMDxtANUFIv45n+PbJ3RsnU2XFadFdr1vwgMf5E+lZa2zs1IIX0wye6KemWxY2sCT7HkiVLPPJHEP0P8skQ4ND1mbNsYJybkMvwN8FfLu71OB6BRZOKhEhB/XwV1lciX3BIhsG/CLwV81rsVrNytQyyHN5398kN0lKuu2QNBPUXgN/mp4+4YBHFe2DM/pqSQT63SW4gCSddgdxecn8CsuGBbo7JlGjjd+I8XGJZjzUIiLNMltItvtYDYBn0ak8WL8tuHPBZWLv/FDuvoBvS+moNp7+Doh7WPct2ZOgjz3mJAEDAghiUEz9lUoRj95jc2W76MEACcX8+/SG1+fC+5/oanEJTuwGHhsDlyzg3CrWmT35PbLqt8l2Pk9j768WwOd1LLtltLgQq3nc0HNU57DvokCQ5b/YIYwWRHQkS8L2NAgSao9dYYU3hmsyf2nqcEGUUCDN2zsAPo6iulFmuc5Mc0EY7takmuuW6IeB4VqX689DFwo30jGTjuQIh8O5fg7TwgarU+fXZxC2kYw3TBzXum1n
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4879.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(39860400002)(346002)(136003)(366004)(186009)(1800799009)(451199024)(2906002)(66946007)(66476007)(6486002)(6506007)(66556008)(6916009)(316002)(26005)(6666004)(478600001)(5660300002)(44832011)(2616005)(4326008)(6512007)(41300700001)(8936002)(8676002)(1076003)(86362001)(36756003)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NC0tAg9pCLWti4WF7pvluL376ucbIN99lkmA7XFTyaqEtVIUG9Hlo4nt2pso?=
 =?us-ascii?Q?5gM2VOWnkpHJZbU88aSsvBBoHgcAK76IO2QjJwM045N3f/RUFyU6vAmZYq8b?=
 =?us-ascii?Q?2RYU8GG7sfFNCJPQG7Z4woIhZ4F2kp7JTNE1sE22yghH4a59hDOtGB0oekgi?=
 =?us-ascii?Q?/dklclj9STgerzeC5gZiJ1hfh//36YSLEsQdvl2UzIcXJsUqfkjuLmEwXUSv?=
 =?us-ascii?Q?3bv/6p9nIkjTERFDwUFKpv6fp38TyDCRAFjgi/VsnZlcHVqTNXz0lQ5LPtal?=
 =?us-ascii?Q?lD4EKs9sgFWauARappMszkatMcsqRV1LiT8dn7cMQ1AznmF+0r2WK2fCcGV3?=
 =?us-ascii?Q?hT2GdxeEOO1zgEKqsKSQbeH5BnHBSrBA2+816zpN3KnQPFljRK1Gn+oxzl5V?=
 =?us-ascii?Q?N8HoTvI5EZZjW2/dUDD8PXw39aJU7hVbBVjydCvfslziND9Ius7k6HgXavCp?=
 =?us-ascii?Q?aBCFR0l7lTBM9TAKsfpT27HMsVYqHcV8zJl7sXGa4UuUoiTdzWkYj5tvFCh6?=
 =?us-ascii?Q?wUv3PCXL1+/zokmzqMKjPbMT1ER2vM23Abd+X4qRZJS9iYgeEzRyiOGVmbsx?=
 =?us-ascii?Q?1tOR5wB3TnUq9l0t4ikIb2jebHb6TTJIpE3pzPlbyfEkzDyD4MNNCLHU7Blz?=
 =?us-ascii?Q?UB+YbUzn/N0G1XFSfm37kcn/ZK/eUAjsjBrKPqnzg4MOuiOtHuB8mOBnsC9P?=
 =?us-ascii?Q?Rk2/QOX78SM9rDIv5L8paaLehT4cSErMR4CRfApG5yOEtdA4mt7hkIDI0L5p?=
 =?us-ascii?Q?yitJAv0MhTEPnMp7f8yfalMGzO1p4xWf/KQJsbdtZXFli3Jf0oLx3VQ79efV?=
 =?us-ascii?Q?xgpg9X08OKM7m8JCsuPNlsaBiRi1lIaqx+ScNNNovmX1U2JNII2S8LRF+LTy?=
 =?us-ascii?Q?sQ9tlUKeTPmoZxjYNEgkoe9lqU6YSBkCSXTFHTFlcAkTSNrI2yBlkxpjG7+T?=
 =?us-ascii?Q?abhKvoSoYHXaq/EttCV9kT0hTvxfLhd+yXiktLgNijlEqQXs24l7/isEw/tn?=
 =?us-ascii?Q?MUCKETJOS9DLL0xEonxPJH+kl+rcO+HysqguLCVqSE/UIQE3dTfvw3GkaskW?=
 =?us-ascii?Q?BNIt+6FqY848p0Wfb+r0BluI9r6og+/tnQo0quLU06Npv18F8TUni04E/YHf?=
 =?us-ascii?Q?M2YMbl56XelMC8mTkQoa0pIQRc+dpqLZTKuNIQiFzsJNoj9E7RmFwQGID1p7?=
 =?us-ascii?Q?A9tb8mxZzPbIC1k2m5o/Ug50YXWRrgWG440BsfqmgqkNi1H5lOg2nXxC1oNv?=
 =?us-ascii?Q?MA52jGHZupZEjUNj6uwJuF6ZMe6KpYWSrlR1/lJvvNwCxZ33aVZaeHwt2N2c?=
 =?us-ascii?Q?zSb2EAYk6uh8VekRQvI9pYYYKJNB/mbUuAXqVbCKKWKIrzUN8QwtcmHJsJPX?=
 =?us-ascii?Q?Ml4U9okI2shGPGk5felFIeucQOjo0deSdo1oBVaUU0wnnlQ97zFIIW+JB5qZ?=
 =?us-ascii?Q?ByyjMAn6YgIW9xiAeOwU/1SJVZ2DSb+/Rj3nDTkxAltiy6Vih1h6HszQb7ma?=
 =?us-ascii?Q?1h3q5EiZ8TMTX7Bh/6rF124lHLZZOEwIxFOe+xy+C5eh4JzfOyr4BHjQZmgR?=
 =?us-ascii?Q?zj8v3VDN3OpCTm0+iKlov5xxjxScR565fd19OFUphnmjEebTx242s6jVtYAN?=
 =?us-ascii?Q?iw=3D=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d88a6f-e949-49b9-e071-08db9f39e056
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4879.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 15:51:53.0519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M5IqNMOYVLhxr3snKwFHOo3TEPKXhcxjZtpne1G6C6Gq+TmI9K3qDlYq14Qyp7dV1T78mOcYMYHJKF021n3+RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6877
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 17 Aug 2023 15:51:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4158

This change adds a subsection to the Package Feeds section
that discusses deploy-ready package feeds and how they are
separate from the default package feeds area in the build
directories.

Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
---
 documentation/overview-manual/concepts.rst | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/ove=
rview-manual/concepts.rst
index af825a98c..7d99d696b 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -661,6 +661,36 @@ i586 and qemux86. Packages for the i586 architecture a=
re placed in
 ``build/tmp/deploy/ipk/i586``, while packages for the qemux86
 architecture are placed in ``build/tmp/deploy/ipk/qemux86``.
=20
+Deploy-Ready Package Feeds
+~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+In some scenarios it may be desirable to create a feed with a subset of th=
e
+packages in the package feeds area. When using the package feeds area as a
+feed, all built packages are included in the feed. A deploy-ready feed is =
a
+feed that is ready to be used outside of the OpenEmbedded build system and
+may not contain all packages staged in the package feeds area.
+
+Deploy-ready package feeds reside in the :term:`Build Directory` as determ=
ined
+by a combination of variables. Specifically, the following variables are u=
sed
+to determine where to create the feeds:
+
+-  :term:`DEPLOY_DIR`: Defined as ``tmp/deploy`` in the :term:`Build Direc=
tory`.
+
+-  :term:`DEPLOY_DIR_FEED`: Defined as ``feeds/`` in the :term:`DEPLOY_DIR=
`.
+
+-  ``DEPLOY_DIR_FEED_*``: Depending on the package manager used, the packa=
ge
+   type sub-folders. Given RPM, IPK, or DEB packaging and tarball
+   creation, the :term:`DEPLOY_DIR_FEED_RPM`, :term:`DEPLOY_DIR_IPK`, or
+   :term:`DEPLOY_DIR_DEB` variables are used, respectively.
+
+-  :term:`PACKAGE_ARCH`: Defines architecture-specific sub-folders that mi=
ght
+   be included in the feed.
+
+BitBake uses the :ref:`do_packagefeed <ref-tasks-packagefeed>` task to cre=
ate
+deploy-ready feeds and any index files required. See the
+:ref:`ref-classes-packagefeed*` section in the Yocto Project Reference Man=
ual for
+more information on creating a deploy-ready package feed.
+
 BitBake Tool
 ------------
=20
--=20
2.41.0


