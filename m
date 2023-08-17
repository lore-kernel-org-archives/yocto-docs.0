Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 232EDC41513
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 15:51:56 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.111])
 by mx.groups.io with SMTP id smtpd.web11.430.1692287510224361815
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Aug 2023 08:51:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=hIBsBC4m;
 spf=pass (domain: ni.com, ip: 40.107.237.111, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dwcandy1cN7+Q7EWjeynl96TgfzGXpzykVIdKvKENPo2RVjYBV6h6o7lbnngr/YhQctWcRrR5ELyAE1tZOk0yj2Xuk+bCsO5ljyoiDgR0aWFQ5rQ6JK0wjfNlD7c1h4XQSecSP1NCVLNBwriKclRSyJ3vZcPHwNFAXDt6wn3mRUMcvtpTdHd0KD32A28P9lBKa72gISZCUDaHEPaloFAujp1jNRNXzZAY9D+wS48DcXFBbLQqK9vfAbF0bFwVakia64NXrALOpbHEZWXqp5rYEAhaF6CYYP9gs5CiivQzYSQLxDfw+kdA5JUw6IUxw0poFJXN8/O+PJkDpxl1qQOXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JaEX0TvjsOS3G6XMNUMN1iGsYlwKliS4k0L1HWl14jA=;
 b=aDW/wLO7dimmULEGarFGCDau2rqMRZiANsJme6PuNn7NAQMBU3AR1ZlXtg/XD5XuIcREbyblAm8mAPV6ZXoX5ztZEoQUmth5YMh9/9uNN2wVy5Y4Da2YF26EAZtzG7Z8nZychkye+grPmcjLzOOm0lBXGPG+vnD5pFnaM97fn8g7K7T01PezWb7+mq5hw78vuY0Yd3EJ3CmyyvZVWoJj6kZp8VaxtuTZ8puDY/J2+DEJOnVI39YUQoHVorbOIJJREgLOY0WbUiD4HFq7Yd+Yt6m9/Qfa7ccnL9VyghHEdS3pO/18y7k3/8NFQqpFNhcpKgmqhsxmyrHo04YaKQnkAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JaEX0TvjsOS3G6XMNUMN1iGsYlwKliS4k0L1HWl14jA=;
 b=hIBsBC4mVybb10epC2kNda0S3as/wCVFEZU+jWV+iK4miW+LaZ/TL/BvUzaeEMNA12KPnCl1sw8TO15KQrf86xZztIaEAX1ZJe8OQMILaTpF4/1hQ/LGinq3LY88DoTTNQl5exw5D90RNf19u5QbRkTmyQ0wKzImeybR/0w8uOk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from SN6PR04MB4879.namprd04.prod.outlook.com (2603:10b6:805:9b::29)
 by SJ0PR04MB7693.namprd04.prod.outlook.com (2603:10b6:a03:32b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 15:51:47 +0000
Received: from SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11]) by SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11%7]) with mapi id 15.20.6678.029; Thu, 17 Aug 2023
 15:51:47 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 0/5] Add packagefeed class documentation.
Date: Thu, 17 Aug 2023 10:50:39 -0500
Message-ID: <20230817155143.2578874-1-charlie.johnston@ni.com>
X-Mailer: git-send-email 2.41.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SA9PR13CA0126.namprd13.prod.outlook.com
 (2603:10b6:806:27::11) To SN6PR04MB4879.namprd04.prod.outlook.com
 (2603:10b6:805:9b::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB4879:EE_|SJ0PR04MB7693:EE_
X-MS-Office365-Filtering-Correlation-Id: 7552fcc9-8a9c-475d-9e7b-08db9f39dd3a
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EsBkTEoTrPBRO16C4qcMijzaE7OKDGb/8oq5bUxzS0+smbuWh8EhdnMINferbmpM8WRid3aj7fdYuZAAlR6KiROPPpaDpDrRIYXsPWBNL7CHxF2SvBIakN8dJKM02evDgZ3N/Ya5fdw8/D7BOWBBrR0JGz+uE3mofq1JeyGrSFRBX72qG/hxdKdPLJ/N736Qm5KBym/D2WbGyLC6t4QQHzlU2ZQ33TcV8+3JjavU3QnuLA+ADe419g25Lz5D7DnqHaCkag5ra6NATUxg53lJctt2nd+cgRwh6rYKzQ2wK29smZ755XB1S99dX5Q4uNEDDpsH0+Xb29AT2e9m0zyQCZwRYk3L6k+rgr/Ax/uiAleFh0hc9Zf7P4Qsfpa0ifQfJQLlHR4IVEmWcUFyyuja0hYZrL2T0IvuLgc6M+nZh0e0fH0p6V8cbgvO2p5QrgORPGxkcPdULPUsL3z72Ouc+Lu2mF989sI/PEa36299nLQx3b//VCPZyLCvNniwJMoqc/L+AR3eMPh2nI17am7N3jCB6EPF854Srs0BgMae3CcS6+BhN/EEqHzFuBivM5aq
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4879.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(366004)(39860400002)(346002)(376002)(1800799009)(186009)(451199024)(66946007)(4744005)(83380400001)(2906002)(66556008)(66476007)(6506007)(6486002)(6916009)(316002)(6666004)(478600001)(5660300002)(44832011)(2616005)(1076003)(26005)(41300700001)(6512007)(8676002)(8936002)(36756003)(86362001)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FAXfO5mVPPnL+XQigiEKas/soZIG0RFajRQV9OCwmH3kM02fe43bjiDxdeBk?=
 =?us-ascii?Q?ERqtXGaNApc4i/Rv/0R5v3ASqh2KGnDmO7pAgYx4cfPEfkHyBa6HKrTZvmB+?=
 =?us-ascii?Q?MeOGRNOoKzeTFPx67ljxxTJ991tepL2gOOWfrM2rdU7Izl5X629insKSjh51?=
 =?us-ascii?Q?A49wYmJijAWJsqq8TK3/pv+d8aCrmqTprH2+PHfOyiIkMUGbistB/pzUcr09?=
 =?us-ascii?Q?zj7JTXMG6YqPo8Iv9eFsyNbMxUVN96HrTrVqQ/Kr7JQ/D9uiXALHAhLoVqe9?=
 =?us-ascii?Q?sfwOEmS3QyBBsx0nIKnDc6VYw4JvL4niUvsCCtajdBGWNoCYeZ4HVv7eQQXw?=
 =?us-ascii?Q?/utejcY48bzjsp6h5lW+0OYR0FdtvGMDjl0NZwuYQFz498Xn0Ui7ph4Z3NXo?=
 =?us-ascii?Q?3Q79/rMTPADI0fnz189xDhPLmIxhUBmVWoT3WcBVBwhvUWqCBqlildD5xgvp?=
 =?us-ascii?Q?N9NumnrgRJyyFzLlBbw6WG3jqyCUejJ/wxc2YUoSWrqBiWjSdPHNMPrNkcUR?=
 =?us-ascii?Q?fJ+d+To/JAX87psnd5Lc7Zn0Jv8HISaOjVEXRemPopRRjwDWEkRzYtNrPzR+?=
 =?us-ascii?Q?bTfnThUusiBKW41GyC6XJSfr+BMr/KZOrh0OMADpcvtRMZrx47PQtGx/Snrz?=
 =?us-ascii?Q?MQCXOnR4zYQtfq9ICD9o0W3QB8lq9vgGndWjq9K8/mNmXh8TfN1yVO+zMXP6?=
 =?us-ascii?Q?v4idtHT5185coYbRsBT0/iFtYU/sWEQ5QLKuHradippPMFidF3NLge1SrkqJ?=
 =?us-ascii?Q?M+00YeU4V5K1jiIannK32kJhZZChZ/MGnEkJk9x48qopuNZ648ZJDRtUefzc?=
 =?us-ascii?Q?/XsP7rL5vYllnDEv+XyL2aOqUSFt5ODlnJNKGBtjK/Ojd0TrL5FDSHV/sgl0?=
 =?us-ascii?Q?LXmyClogSqMlqZZLAD2QQQOAeugazAggyNfo6kqb16U0qB8rQBCbA/OauStq?=
 =?us-ascii?Q?Apjdh7Irly7kPXKzLWFzBrxHTr6i6dzVrpzjqfXK4y1yeIkHCAJhQfbFYyNY?=
 =?us-ascii?Q?9RhrbU0auN4Tc7EbSigh/fpYHLVoSUhEx8Ze+/QHHyYXmZibQhBR2eAOGXjP?=
 =?us-ascii?Q?7b15yvtgyDZUEY8NDRZ/IsAoAjLGnIhRJvj3Ox7sOvpYBdv1ezzJiAHOkMht?=
 =?us-ascii?Q?snqo7wssSYBsxj7mlDWimhb4PlzmedXcz6fiVc+9X0Rl8/66g33MUPpUzb8U?=
 =?us-ascii?Q?Ovl+W/2c0iZhZD8qlpo9TOxwlHF/d6ofg9LWKhAHQvmurF6G2h7VTkhDbgJD?=
 =?us-ascii?Q?efIktcrdtuHQsSlp3kV3/tqq2emBvuQjL/aXOQJTGb339goeBRfHos5+6UlT?=
 =?us-ascii?Q?aWzrHZijgDLjEK9ZGfVpq+zqoS8EpVLb3XikXOHoG+pEUBJ6vxucnM2bPtob?=
 =?us-ascii?Q?j92u/Dsn6oODjHK3U6cR7IgZ0qUHew9Tyca3by9qNWgk09yTWkkUGoe6hdtc?=
 =?us-ascii?Q?W1iW5YjEF+mZ6xjCT9Ic6PIhcRJM+fzIzdff1kt5DxoAnWLfosHTVAR8nXi3?=
 =?us-ascii?Q?IW2/MyQibRKZDQRMIvtVJJOS4UFclB8mlWsYpH2aFefG1mTEkHfTFF1TYS13?=
 =?us-ascii?Q?+3aGLD2lNVfpAoJo215QMy44qYWRsmugpx5loL4grdx9SJtg3DVsSXX2KBps?=
 =?us-ascii?Q?jw=3D=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7552fcc9-8a9c-475d-9e7b-08db9f39dd3a
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4879.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 15:51:47.7616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aIrM+YJI30gzQ20ljUUhtzqvggzA31XCmevrBoXgy2XzeXmhGL6JM6tXpZ4weP96Yy5WA2EzFBZaC4qQf2RItQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7693
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 17 Aug 2023 15:51:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4156

Alongside adding the new packagefeed recipe class to oe-core, the documenta=
tion needs updated as well.
This patchset adds documentation for the new class, task, and variables and=
 then updates existing
references to the package-index task and package feeds as applicable.

Patch set was tested via a local build to confirm no warnings or errors and=
 hand-tested in a browsers
to ensure proper formatting.

As mentioned above, this patch set is dependent on the oe-core patchset bei=
ng accepted.

Thanks!
Charlie Johnston



