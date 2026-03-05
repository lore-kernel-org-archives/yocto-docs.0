Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84718EEF304
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 13:28:03 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43903.1772717275157220758
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 05:27:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=OPs5ubsP;
 spf=pass (domain: cherry.de, ip: 40.107.159.30, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X2o2TDzcYorowZ2HySzOh/3F/rIlsT+s8eudkdc1TdR5CILAt+R/qpDZld4+m0bMQPeKd36QRSjXSJG137V/kBUPOOiPqL+7ZrEHsPiP/uKCv4wIAq0W4OfPXrMTuh2suMCE7fAM7QGH4cJrKTIpBAJuGdhwHKmBHovX7VCPNVVIPoMr0p1wGnA9CIIWuB2OeI7s2w719ShEoK5DT0EsAQW5l9aszf+LffTtHgVUQDcf5GwX/kYk40PRcgtdC2caUnB5AcTSGBvKeVkGRVzsmqUEDbXPTovACDl5413WbTYOvaq2JTOt0hlbfCtAzmgjLTTIfZROPCBXy+sb/n76pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6y8kTRW564nWcep71Qlj1yOaRwF/mu8wwRYnlORfIGE=;
 b=FpQZvSOHD8q2gvT+0gXruUTjFBWnVMAT5V4nVXap3us+5c44tZ+2gCYm+0u++4pt7kYWH0ElaRTABZ8OF23Z+uaNZlvT/3gKWMliQnh+pX75QFPcZbAqRk/qFZT3ooa0z1OZyDfgila+SQayPtrAi5HtHffxCcQitg3lF5l4O0hjGsh8fvw1YKIbvh0o5BvaKj2PGa/6cHpksdlybwcZ3zZ4mUhZtbEE5mATtwlMCJTtjEefZsUFOmHdh4alW4AKr67f1jKz2Ecy1SrJSh4xTMh8uTeNMcErcx6MNy3t5buD/AHGYVCcgVnBUnU/xFQCO/1yXXJCUIhOqwz1SyeD6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6y8kTRW564nWcep71Qlj1yOaRwF/mu8wwRYnlORfIGE=;
 b=OPs5ubsPaY7u59n/OwIHlP+tX8blv3Zo0F0aryxqU/T9RvNjUeFrxxxsuJXQ5ua2BzqOmS2bwIOBhh2fGDsLWYd81cM0xVXBfqMsZ3nvtJpzDKgV+5UXdFGih14j1NiJhNLZGKRkIcBxI2XZZuBqUGeNAtRldgwl4wgL+0BzdrI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AM8PR04MB7857.eurprd04.prod.outlook.com (2603:10a6:20b:24e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 13:27:50 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 13:27:50 +0000
Message-ID: <b14f7d41-2942-4bcb-8604-b18f1fa7dab3@cherry.de>
Date: Thu, 5 Mar 2026 14:27:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [scarthgap][PATCH] ref-manual/system-requirements.rst:
 update end-of-life distros
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
References: <20260302110446.132075-1-antonin.godard@bootlin.com>
 <20260302110446.132075-2-antonin.godard@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260302110446.132075-2-antonin.godard@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::12) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AM8PR04MB7857:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c12b056-6c63-4d8a-af52-08de7abaffc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	vjZB20A4i6mowgEHhFhZ4vbuxlcVWxgAqKIDkMqExuraLeWvX2XEj/CZa8fG7mgLkFfxFJV78o64OzAA8geWEXi3XtuM9hIBa4llm129g8f3NmyMhIPpxYfzarWDfC3hzg1on68YhlAfv/yJ+knYd96YzXh1ho8CDl7L/jEZ8xTZHdeJx6E0FS9N9uzOsdt22VArcqcZP68L1fL8hHoYGE1jyoyjV3aM6cCnkIuX/V85FADbzzvJxVSYXDDpvm1vZxoqqC0jmh+B/htZ0cO3So9QLs9CvQ46yg3Rpp6boI9PMutxk7zHEGCmhZhyxYjbJmbDi5LdVpV6+k+uqkrJuC2GQmW7f74PCqxGULRMtefJVX15oDMBQKQAdNG8qI7zYLkWnuFImMo7cDkdhHqIX5S63MXvZDuo7iIUVz1NYTNQ0nXE8cBs+bt4DoQa4L0DYGDcOyVFfaabnIqsMubF9jN9m322KvumQVBzvke4hLOK9gI359a6TXdtSdNJRDt6RF4AuvqlHdUg+bcSFxWMb3WDpFXKKAp5Ggfs9cd1o1vsAE+Hcybz4zqe7pRj7Ur6dOUId6eEjUF+lIxBfGj41mZHhcCq6sBYW9IjLcjch7ENQ16cWzenvYXpezy/n/DZh3YmYFynSPVLX5prHNaJxAaRtGxkCUtN3s29RqTXi8KTfCfVP1v1yYnABdDm6L6hGzTWq4xxzIJdAXiC3L+d+mtzsioVCIiCaOESK4AkEc4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?KzFtVjRJZFBhRlkva05nQ3JIWXhVb0U0RUE5SzZYQUhIa05zSWRVZFF5WjUz?=
 =?utf-8?B?TjJjM0wwNlhBRkV3L25WMWVYd2gzaHlQSFo3REZkTXl4bUJFbHB5N3lrRkFO?=
 =?utf-8?B?RFVxZ0tPWjZpOXVpdTlzbGRnQU42bWJtZFBab2E2RVlxcTc3OXdUVnVjRkUr?=
 =?utf-8?B?N2p0aWkzcFp2OFFZYTYzNWtsaGtmV1YvYkRKU1plWXNMT3hzY3g5YnJhSDNj?=
 =?utf-8?B?MlY3VHlEL3FVbTNTSG5DRThKV2tCdDlITWZMVE1qMTRrMWhVM2drUlRIcGty?=
 =?utf-8?B?K0s5dHJIWXg1VUFPblo1Qno1b05MUjZocEEyKzR2UXRiY2dMbitwL3ZScytt?=
 =?utf-8?B?TEM1cUlmSCt3cHcwODVSYVJjaVZyaE9DQVhJVW9sUHZRUjlIOFNIc1JVSERo?=
 =?utf-8?B?ZHA1ck83OGw3NTF4N0h5WCtJdllad2J0T0l5ZFo2NjBXOUtaYnVtWkdPejhS?=
 =?utf-8?B?aGNHT1RHNG9ua3VKMmVocklrd2VNNjExU1I5M1pJbXZ6ZzNPVTdtdlVRVGVC?=
 =?utf-8?B?KzA0ZHJsaDRmV3pWaFBaLzZMWG9CQi9QOVkxVUxPVEtrVEF5cm9PRVpyODJ5?=
 =?utf-8?B?NnNUVW52SUJJMnFjem0vUTl3c0luNVo4bzZya3IzZHhkeFUrMEM1TWdYci9x?=
 =?utf-8?B?Rm5DVGpnVjFCYjZRRUNHSEtpNkxKeGhtMkF3K3VNdUtleTJDM2w1cURXdkY2?=
 =?utf-8?B?dWNaakRkRE4zenpGWmVoa1NxU0ZjWUZNVjFMQmJVT2Q3OHJGQ0QralZ4RUVG?=
 =?utf-8?B?azBScmtNNlZEOTVFY3o2Z1UwaVBlenhBMEtwVDlJemFrLzZQTmZwanoyczkv?=
 =?utf-8?B?bkpHVXcvM0FTSVdlbEgxbGhKb3NVSkpGMkY0dit6dit1S21NVlVKUjF0R0hE?=
 =?utf-8?B?dXY5dEs5eFhoTFRqV0duajZKRzQ0SWo3T1lXVnFGWVlTUjdaMmMzWEplbGIz?=
 =?utf-8?B?RkZlVlVSWDBNWEh5M2k5UXFUWGNhZ3pQMHA0K1JjbW1BeTM3WVR2b2VsQXI0?=
 =?utf-8?B?Q29qM1ZKT2dwbzJPbjBqYmdrOTdiR092a21qQUNBOStzUzc3SXhOck13TURh?=
 =?utf-8?B?c3ZDVkVidVY5eFNuYXFQcHZiMjUwOGFiWlM5NC8rUmtvRThYZGRvdHkySEY1?=
 =?utf-8?B?Q1JLZG1aRXkwSDdnRVJUZmtMWWptckVYOFF6LzVzK0pPL1J1c3hkei80d1NI?=
 =?utf-8?B?NWFYaVRmN2JTZlRPTWYreUI2aHQxNWNDQUVUQnNUazd2d0s2YU1rdTFVemFN?=
 =?utf-8?B?aTNaMkVPRVRHVmtKb1RVOERScExwQVg4aUwwREtLK3lXSlBDRXM0YWJJZDJ2?=
 =?utf-8?B?L0N4WmJYMG9Gc3NheDd5OFhXL1hkMGJjbHQya0ExNHRWYUpFMjNBRkVmdEU5?=
 =?utf-8?B?UXI2N05QaUorOE5UN25WVUMyWHkrWjY1TFN0M3R6aXdZaDg2MEJ3azJCMVhp?=
 =?utf-8?B?VGVhZ0VwS0FlbHJjRHNjSGlzNHJ4aCtkWUJIcmF3S3gvbkg1UWhhTVJnQXdn?=
 =?utf-8?B?d25CdCtBc3pUM2dhb05GdXdRWjlPa3dPNHg1a0JsdkNkV05Lem1CTCtCcFdX?=
 =?utf-8?B?Q0lsbThsTkxCQi9UcCtUL2lSMFhSTXZFVlhMekN0MzRVQmdpVk9YaTZvdkNi?=
 =?utf-8?B?M3JySnJybXFvS0k5R01JbDc5cmNRVXVoMURlcEVJQVdwbFZZTW1EVytja20v?=
 =?utf-8?B?TEw0cG8vSkwrOWVPTm9yaXBJMUYxK1MyT1hmRFdwK3daSDlWNmVjdUYzdmlz?=
 =?utf-8?B?Q0JoeWw4NDRQQ0pEUWxkSmFuUXZXWGcvLzFYRWtEOUpaWTJzQ1lJcnpEVm5Y?=
 =?utf-8?B?a1MwYXduak9Mb05HS2RIQjNWRVlhYXVzTE1weG5NVFBoQ0hhbGpZYy9VZlRs?=
 =?utf-8?B?WEZMOTRObXZGdHlhNFJkeStuejVTaW9NN3hUcittRExzVnBwc1ZOVVJBSDhQ?=
 =?utf-8?B?SnlvaFQrRXlMZmIrYlFIb2sxODd5Q1hULzdpMkZ3SSs5UDZVQUYzdEFKNmIy?=
 =?utf-8?B?MlFLazJaa2dNWUhGM1A4aVZoWUxPU0tqN2NXa2tJQm1ESkVUd2VOQUswTTJl?=
 =?utf-8?B?R1FYRldnVEJtdkJKcHI3WGdZMGUyTVJGaFVKUjc2aGk0RjBoVTZiR0FUYmpa?=
 =?utf-8?B?ZzNxNU84cEJrNUI0OWwwNTNCdkJ4MWlacTFCNW4rS0NjR0EzQW9oaWUwSEt1?=
 =?utf-8?B?TmtUWjVyV0YybzJRODJ1Y3oraitPaXFzekxOYVlZNXhyS3p3dEFuYTVpRFVa?=
 =?utf-8?B?M2JyZHVsSkFBVnJ5ckYvVkRFS25zRWRZSjVHM1lPOVZsdVdZNHpBcTJXNUI5?=
 =?utf-8?B?RWdna1NZcjRXNkwyTFFIZW44Qm9PWWlGcVNNSGwxY0ozMCtQaU1MRHo2TGxY?=
 =?utf-8?Q?xu4Bmre04tkNzqfM9qhgHKV4Cd/ZbLgg1MF5G?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c12b056-6c63-4d8a-af52-08de7abaffc5
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 13:27:50.8815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XtF670FpTfJ9PFVfhGj7G2M3hzq+Ucxkz7v1OaeY+J/mkQITP05xaH5cdzRn0FP23J+fz8exFaQiTBqmqg+tPH9bupZPjojJpYgkzCAQjpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7857
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Mar 2026 13:28:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9071

Hi Antonin,

On 3/2/26 12:04 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Fedora 41 was made obsolete on 2025-12-15 [1].
> 
> [1]: https://docs.fedoraproject.org/en-US/releases/eol/
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

