Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.11])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.354.1794413189508471323
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Nov 2026 08:06:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=bK+4K6oE;
 spf=pass (domain: est.tech, ip: 40.107.159.11, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OtwoLKwhESGCrDkdqAoW77/TW92bFWVLT0NwluAOBa6/R0wOhEqWLfyAT3zPTJG4Ap50gu5lc/13pWvs224q9RQD2GoKVAwcaI+nORJSlDseFAHO2VimV+g4kuk9ZrmJFIlQox/fdppqaMG/MqGGdHGJD3bW8xo/fD/9hqHp0LACgAnd4wWD4GxLeQtxYoNQnlStGQjoQEc2xN0U9/Yvt+btvBTTBILAkFi3TaBN+PTIR55ub9JdejjpsVySpzqQfv/6ptjxFXIpoMi1WCf8aK8gvK+7pQAtoKY8d04WZLwQ9KxPPr4ugDT9LevSfMo3WohY44jTluS9Ag/We5d/mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96nKCltoA6AOCib3lHMol1Nch6VpwdKqann9SEiGgBQ=;
 b=nJVpe4ZbHeLXlmKYhjzElMP6rNFmYZ0N8DInhc73oyS+G6jWShxqErYTvUN1zG94ZC8rqHZOFdRMmMhegCnWg90QVWEdQ4LJvFY5OK3xEMsY2QjkxNmZbtDxAL3k5530BKO9K5g6DNWR0BQ2/mCbueC7Hhhef9Lyne+0MwswTevw210oPQobSJl5bc817xYfGid+2pc6MQNclFD4M+dMAEnX5nKWeOWpCEv1GjVwHDWOsqtxRRmRgfXeOoVbrYz4adtCwqzgxp2WeX7tFx594VkEHKgrIHUcB65risEgoDdSXxo5ljJC2tFeApSR0tHHDqxF3KTdAR3gOnm2a51svg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96nKCltoA6AOCib3lHMol1Nch6VpwdKqann9SEiGgBQ=;
 b=bK+4K6oEGRrDqTVXAKdG1xoFVKjZCzl0pgZMadL76Y+q5uI3kGfEl1tObTrcgsQmghW32obL4OoAjNpm18FG9ZBLwFneRrjm/tWA6gi+KABLqMg17VwAWf+huACVLIzV24PsyBvLvKuxKjXogRFhIKoyC/el9399/mzfteG8VJWjlE3Q1ju5XA1Y2Mrb6F0ZD/IJXLQLy0FZIfFaiT3gO3yXm7GU0WB0fuXvOdJAnIwhzrPJ1VOuTw7ehYxvyOWviTOovSajmxWxWhP6EtXBESJi5Ow4wu9Z+nl9QM4iWeQM23Rm4XQGn6ajl2rg0aFVx3GUl+TRaABytE4sVD+SrA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by GV1P189MB2059.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:53::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 16:06:25 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%5]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 16:06:25 +0000
From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
To: docs@lists.yoctoproject.org
Subject: [PATCH] dev-manual/packages.rst: document gpg-agent configuration for parallel signing
Date: Wed, 11 Nov 2026 17:06:22 +0100
Message-ID: <20261111160622.115144-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO3P123CA0029.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::19) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
Return-Path: adarsh.jagadish.kamini@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|GV1P189MB2059:EE_
X-MS-Office365-Filtering-Correlation-Id: e0b618c5-e0b3-4ed9-7689-08df400dbc7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|11063799006|56012099006|261021121427099003|261022105027099003|261022075727099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|261009223027099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: FnlBhRsmj5Bh0+ddhaPO9qq7Il38kAuW0ywYLXt4Yj5Kuz0NHwtYormDcwY0ur7DDFmA19BUgn1ClNW+v25kGdiPuNkHyi9QWjZZK4KywKN0jgdwBdv90vlrd3tL9ugNNNhviq1nhVePBlaqu9viVFNmuT9wjq7o16Fy7GJ8EEeXi+vpLaJqcHYMKkVqSie9z36JFDy5KfCQD71ROutygi6B9TXLdNstoW5vhxvTgvfXV0CXQFAOdvlEvUJEUMlqJ8mMnmtiSbhPBW9hptBFDkIWakl3RUQi4J8N51/JkdSsfhSsomhLDmDfybRysQOqnEMvXBUxmCJM0LtW27dYOijyyKuCuFW10ElJjUjKupU+cn+48ZHr55nGjxuGnqK0nb2yq1B+EyevewMfPKFsv8k0XnYyHY7HPL9HU2a8qpdfBTXNRN7GEA0bCoCQUjcQXTO+ldgJWRgDSNqhJp8LNg8oKqXcnb5EBl8hUcL2P95ZnD32FyN/kfjFYoUHfoBMDi+CLDwCxJZs5H/CP58qFLA8I5IPO0Onf7wBrxW/wM6S9DHDsZHwi6xUkMZjp9ehOL7xOhakcCqg9iv/wH3zbNUWzd+jf+4f//k2tnbSN5+Pk7f6H1S+5jKJ9RydlMJ4xlbLQJttFODKdO81eJ6AKkEP85HyLM9H2d2nKnrBmvU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(11063799006)(56012099006)(261021121427099003)(261022105027099003)(261022075727099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZgKDMI087dJdER44XPE4WsCLtBBTX3bogYoqGCcOM9FB59VzqJjovLHnmVzP?=
 =?us-ascii?Q?grx2B7DdHwzoQYtd7bl7Samv6OX62u64FEUiSYMgDwjtP7M0RsMiXWE3iwAx?=
 =?us-ascii?Q?5fJxEwPauVj8GIZMGdgxAaQPpimAqCu8SrqJVuy+VN2O5wdHEkPvg4CySz6n?=
 =?us-ascii?Q?1M3u0FZ1kCsJyr3zD6Z1kSWRFsIcIQjc920J4ekCICHvhEDNwREzRAla7G79?=
 =?us-ascii?Q?UQpiwXLLQV/65sk7G+7CzUxrb9hklwq67iyNAR4tZom2GxuXfXGB3fmxhgNp?=
 =?us-ascii?Q?Hbh1TaONYocaLtH0jUocpGbq0hSOC3P2eqGZi8OqquE2s12de8iAAu4kC57H?=
 =?us-ascii?Q?HuDooTQFuE7Yg8ybIi90PHNp95Zxf3q6mPcTwe3H//2o3xDPUodeQdfiTl1c?=
 =?us-ascii?Q?hFaEarFPndy4ECCUM9ZNXTUnG6dplAR8IgsXN47MX0WmVAUFYvbKFpoOHk/H?=
 =?us-ascii?Q?ZFoSCu19zz51axRYK6ciXyBObsWuRpT7nAoVxd7ByVla+E+OejnjRIJrrhSY?=
 =?us-ascii?Q?JHaWgAFFPViJGoGl0di6+SDTPAL/y5/5frJPCKNnMDPNjj1mwE+3+FG21FMm?=
 =?us-ascii?Q?frfJjpEj378lLiiIr8ChsWhkZF0uaUcJmD7phkKpswaHMOhN0hSlCGI0GNwp?=
 =?us-ascii?Q?3V1lMqESaewQ8peC5CE/mULPWdHvRkp/fyIkLEhFcXU8qVn4lAKuEfVoXtBk?=
 =?us-ascii?Q?N/dqvtIg1xulkmqPiw+ZXrm+UrzEsfmCZ2jPKvwmulmjxOZVfU3uFuzN6Sw1?=
 =?us-ascii?Q?S9QBXeQQ5Fnqm6SKlAyrXob3re0MPpbGYeIoOWgy/hQRHSc8ldSCX4NXzuL0?=
 =?us-ascii?Q?HAvocqeTFkvcBCB7novjOPUFK0uY2w1CF/fe8RHZrWLnu1mmDFp3JrnGxIz9?=
 =?us-ascii?Q?8iWgoHy7C5I1N3yeUC8Om/Mo5je4hVwjdgGYUPtbIo1i6LrTpm41CFO/LonV?=
 =?us-ascii?Q?NJojLhuVRcApJtvTeMO/rWx/WPo3A1zfE1ibqRrY4lILB/6byALFa0GsGhdY?=
 =?us-ascii?Q?YeRhfMZB2llhQNG9xqmUtCHosFp/2HwK00pEUS5P4vTBZaw7hlUyQTZUtDdp?=
 =?us-ascii?Q?VD3EyVgREWvf81Z25WvI1/zosqYn64Pr7ARLscWfUrvM6/Tl0WQ/dp6t3T7Z?=
 =?us-ascii?Q?Woqv4jQVadmg+c4AhUtWAduJhN3kmK7vJGPdyyKzcOwgBBEM+DYnyRh4ExEQ?=
 =?us-ascii?Q?23I0Bg18tb64yXdcnBti3OBru68ayGds0DBI7dKboFEWuhTCyGJh5iRymETQ?=
 =?us-ascii?Q?KKR1DhWfSzkhwPPxBqn8jreSXkvdk47UWqI3/oaA3k+7N/JRGrhdFZX0K8ee?=
 =?us-ascii?Q?iQudF8ByHy1IG3FMOrFGHxybbOUFcYE2TagCurzNZcJheuqS4BFiFyZFwNTz?=
 =?us-ascii?Q?FZxr+N/yuXXt+ps7bHWxh2ZcFz9E5UnTWLGTkMzc6k6z1wtD9WDYWlUmYQlf?=
 =?us-ascii?Q?oA3eIiYorF70K5wN8SWC/+KQ1U6/u+8mfNQTRDucj/fO3ADUVRcPtjwnb8FU?=
 =?us-ascii?Q?Z/3B4uqUyMlixgOrKQBzCcAS1V7AFff1kDgPlsNTPQTsBInHN4D4hWE0ViSu?=
 =?us-ascii?Q?wth3pUksuDQq7+xd5L/RxGTuzER756RjeZ1q/bpNxOCetl73n/s7kAPMAU+h?=
 =?us-ascii?Q?7j/hjdAv7ZXZsk2DWZu8g0L3/WFMP/DIEIJ3daGfvM9xRWvc5Het3Tow4XoZ?=
 =?us-ascii?Q?Q5VKDZ7unClqkkP2AQLcOqweEltdhvcUDM6gFHiklsDg+kx+0VpaEjtd/Egf?=
 =?us-ascii?Q?VSWm/Wm4y5teAvx3AXY0QoCu83p+f7A=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: e0b618c5-e0b3-4ed9-7689-08df400dbc7f
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 16:06:25.2287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fJIKDsWJuFragfI7JlT8Kn36SBN4ppQHUS+ghtnR930OhlTMuNGV9X5UUFE2oZ7VJD0B0872avNabwpfgZFGYKliTGSsJU2wQ9GDKM19vuw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2059
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Wed, 11 Nov 2026 16:06:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10789
Content-Type: text/plain; charset="utf-8"

OE-Core no longer passes auto-expand-secmem through --agent-program.
Document how to enable it in gpg-agent.conf and restart the agent to
avoid secure-memory exhaustion during parallel signing.

[YOCTO #16480]

AI-Generated: Uses Kiro (claude-opus-5.5)
Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 documentation/dev-manual/packages.rst | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-manu=
al/packages.rst
index 380d806be..f05ade8b4 100644
--- a/documentation/dev-manual/packages.rst
+++ b/documentation/dev-manual/packages.rst
@@ -905,6 +905,26 @@ related to signed package feeds are available:
    "ASC", which is the default and specifies ascii armored, and "BIN",
    which specifies binary.
=20
+Configuring the GnuPG Agent
+---------------------------
+
+Parallel signing can exhaust ``gpg-agent``'s secure memory, causing
+"Cannot allocate memory" errors. Add the following to ``gpg-agent.conf``
+in the GnuPG home directory used for signing (``GPG_PATH`` if set, or
+GnuPG's default home directory, normally ``~/.gnupg``)::
+
+   auto-expand-secmem
+
+The OpenEmbedded build system does not set this option. Stop any running
+agent for that directory so the next signing operation starts it with
+the new configuration:
+
+.. code-block:: console
+
+   $ gpgconf --homedir /path/to/gpg/home --kill gpg-agent
+
+Omit ``--homedir /path/to/gpg/home`` to use GnuPG's default home directory=
.
+
 Testing Packages With ptest
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
=20
