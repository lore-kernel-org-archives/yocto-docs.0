Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37A61C3DA59
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 07:28:37 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.117])
 by mx.groups.io with SMTP id smtpd.web11.5262.1721114910704199412
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jul 2024 00:28:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=KAlZ/n4S;
 spf=pass (domain: cherry.de, ip: 52.101.66.117, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oSrd/7bOm3MXKIavcB0yHOfy7iQulg80y9JzDkJZnckEawleldqFZ0CC5zlcNRUcvUHkYz3OGfep7WxqQRyG4rePCVEZYSc4yKHn+fgoPb5Q9pmiSs43C78K1TXfJTZwI8eCr3K8XLe4HWTaGpN8/T2c6umKuD3G5HOGQXl/zuHxZUkgWZC55BhzzfYOHe1uIRd5Y0CnArMMwUmW/seFmMFr2wkqDhlwdDSTbTX50B6pv8DFB6SBYRXUwjAjBavw4ntUMwURateO3CRK+jvotSOdDV+X8k7moHpSt9s66G/1XRYOES4vzvwhm6Gh9t1jqL+LQue28MW5yy6DqfidLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qEBtqAv3kdczxrdPIV6UZxV3/QehA+c+b7yzOzBsw4=;
 b=K8lGhO3QYnHgRNVOiX4tgC/TGNPUFYHjHsrrDRZ4mFYCEDNITYhK3hbMDAfZBPGb09j4dMQyvu2vobOnP64ctoLsleZvKIClxAb/OhfHOT0fh2PmiZ/y9v/bx7o78QSP7ZHcgwOXw2HbsgN9OyJQtO+pVAnG0AokCkwuvE01aktZUDRIfjT+vqSQuraicIXebZA3pSCZ/Ljvwf252fIimld309cM1GqoETV9fpzLLPcUy86wVh7X4L4bWTRoFYyz9DRTBZpcewpWLApKgkS4CGj6rZml0hjLTA1Ai2Zhw6gu033dNBmlSHXupIi/eXXj5ptTLn+eQBW54iMpqKylvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/qEBtqAv3kdczxrdPIV6UZxV3/QehA+c+b7yzOzBsw4=;
 b=KAlZ/n4SB4NF1PhjxBq5C3sX7R1RPSZ2+EPyIyzJkSTWc83XqEoXR7lxOTtKR4RAVBBL99zzjs17Z6qr5qgfqZVY3iKodOeczyYKydZ3SxKje+YKdPJpS8iWe3SQYglu/9g4EH5VyKBXeazVrYXjxBcyNoBfpWIH96pkPucCqtw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DBAPR04MB7270.eurprd04.prod.outlook.com (2603:10a6:10:1af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Tue, 16 Jul
 2024 07:28:26 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 07:28:26 +0000
Message-ID: <710f1acb-55ef-4b02-b7a8-9af827c86c58@cherry.de>
Date: Tue, 16 Jul 2024 09:28:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ref-manual: fix typo and move SYSROOT_DIRS example
To: Matthias Pritschet <matthias@pritschet.eu>, docs@lists.yoctoproject.org
References: <20240715162348.3984456-1-matthias@pritschet.eu>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240715162348.3984456-1-matthias@pritschet.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0407.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:83::28) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DBAPR04MB7270:EE_
X-MS-Office365-Filtering-Correlation-Id: 0864a1b5-a382-4f2c-d806-08dca568e1f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MTJZcWUxS0xpUkVvTnlGanlIek1lU0xtZmJkS1M4aGI1SXVqM1QrTm5IYUti?=
 =?utf-8?B?RU5tK1BSSzM3em1jQVYvQWlsdXVVcEJUK2kvRGh6cmk0MjZKNWU3UEdQZjBp?=
 =?utf-8?B?TTdZbm5yS3FYOVpwbWY4TDMzakJaOFVmWFE5TktEdGZzU1FZaWxzaW9raFhw?=
 =?utf-8?B?VjROQUM5bnh4SjNFSThvRVNDczFMaHYxZ0VWK1k2Y2Nad1VVQVM3Nm1xcXIr?=
 =?utf-8?B?aHpWVkZXQ2FPOGZ0a2QwRGVHNjZLcjdvYVlqRnNxbmhSMDd6M3N0TzRSY01r?=
 =?utf-8?B?Wjd0MDM0M2RaQ1dZcVVuRGRHb05uL1pSdnVJelNFY3NnbDFQelZScWQxSXRP?=
 =?utf-8?B?QXhESFZNOTJ4Q3FISC92OTRtcW5HVE9qM3ZZREowY1BYM1I3MmtVU3FtM2lM?=
 =?utf-8?B?bUdXVU5UZFE5ZlpZWWVHazNsUmEzZUNjZmg0L1pXbXRCY0ovdjRNS2NjV3A2?=
 =?utf-8?B?b2pDdHcxaFZDTDlxSzA0emZ0eVc3VXN2a1hGa0xJQ1E1S3B1d3FQWTB3bm1V?=
 =?utf-8?B?bjFEQjlEK3dWWmxvdE5WN2tZRVN3b1BEU3ZWUXAzaU5zMk1UYXlRUUg5LzFR?=
 =?utf-8?B?L05kWDBqOFZVVUN2aHBmNlloVUpxMjVkT1o3bHJqYjJwL1ZDbXIxV3hhSndW?=
 =?utf-8?B?empScDhxakdrT2F5bXZweGhkTUp4WUZLcU9XcWwwOUhxLyswYWRra25iRTZL?=
 =?utf-8?B?akMxK3hISXlUYmRQTHA1Yk5NSUpVdjFtZXBUVC9HekRPbDJ6Yk5CaUg2TE8z?=
 =?utf-8?B?cTFZdm9TNTFOd25rV1JnYldxY3FsNklyN3VJcmJGdElFWjFha245dkwrMGYx?=
 =?utf-8?B?Y3BkZmtGRnM2M0xqRVlNTnlBY1RrekJGNkVJVUMwU1ZxZXNXdmFiS3U1dnZw?=
 =?utf-8?B?cjR4dG94cG1pVkRQZnNGNmQ1d25aRzFOZTEzK3ZleFEyTFQ3eWhoU3RYVnhq?=
 =?utf-8?B?U0JVbm9XYWg1S0ptYUtJLzk4bjlFVWVlNUZrZXJzTmpBSUMxTGxPMHpvamVt?=
 =?utf-8?B?MlJDZWJJOXp0K2VZT3ZQdzhObzNKWlNkVGZrQ1BYeFRVWXNLbjg2ak81S1cx?=
 =?utf-8?B?RUQ2eCtoTmVjdHB4aVNyOTJnK1pucUFZU3J1UC9reGplZUtDdCtKYmg0elNU?=
 =?utf-8?B?WE5RTXhlVncyQ3d3a3N0ajk1cFZOOWlkQXVVTjRBTDNURkpoZnlqdmkvYzQz?=
 =?utf-8?B?WXp2Mlc3Yng2UUgxRDFjSFM4Z0hRbGlIK29iMGRVR0d2ck9ZUk9rSXFjRlJv?=
 =?utf-8?B?VFB3OEFHLzlWcktLMVNXWjBhMisyS3lDQnJFRm12RDMvVnVPSWRZTnZ1TEdO?=
 =?utf-8?B?VTFQdmFJN2w5Z1Q1T3hwSEZSMWQ1d1QwRjBjVDlaM2JZdnVhSXZPbVVZbkpH?=
 =?utf-8?B?ZDc0UitYL1JpWXZrUEs0SGtZY2pHR24rdVBXdW52bmdsWWhhaTljQXF2K01v?=
 =?utf-8?B?dklMKzNYQ2Y5QVgvajVmbzBSU1AvM1NJS1FjZURWYlpmZFdZRkwyMis1M3da?=
 =?utf-8?B?WW1iY0gvVGViZnpEamlkWTVlT3N4V1hyR2tUMkEya1RhRDJXUVM1bzQ2MS9h?=
 =?utf-8?B?aVlNSGRzZStyL2lKbU9MTHF3Y3BVUURFTmZKZHd4VGFFMGJ4TUFVK3JjOStU?=
 =?utf-8?B?VDNWMVNHZ3NpZ2dFK28zNysxZlByMGVadGc0dGR5aUg1VW9pRHBuSzhNTnAy?=
 =?utf-8?B?UTZxR2hFTlFJbHl0TmRON29WYit4ZkZ2TDlTLzU4ZDN5M0VRSksxVUNLSWE1?=
 =?utf-8?B?SzgveU5MRzV3ejVoc0ZqKzZ1ZHFiSnhhRHBzSUVBZVlWN08vQUNkQzAwVHh6?=
 =?utf-8?B?cE9EWDgyamM2KzUvbkFYZz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q0hBNmtIdXNqeDhCT29nVCtkSlY5ZzZmMU1oQ2lXdDVVM3pNMVNzS3pHTjVj?=
 =?utf-8?B?eGJTVDc3dlFLbSt2OFJSR0lXQktubTJJblRENGt3ZWVKVSt3V1NJVHEzSGcy?=
 =?utf-8?B?d0NkalQ3UjZjaGQ3SjQrSmhjR2hkaHkvVW9Nd2ZndzNtYi9mS25xZzkvUnFq?=
 =?utf-8?B?M3pXYkcwbzErVmlONUxMQlYzKzFFclI4WWdWK043bGVHOWx1cjlkTlRTWXBN?=
 =?utf-8?B?Yk1uS2I1T3ZMQm1KODRyQVBvR2dSYWpYbnAxNFJoUGVMR1lJdDh5ekIzdlBy?=
 =?utf-8?B?Uy9Cc1V1a1FJb29KVEYzMmhYdC9HWEl6SWgwOHdXRWNSWFZQNTdvdEs5Ymg0?=
 =?utf-8?B?b1ArcHpTSTNnVEFtYi81RW5iejM1eWZ6OTdHRlVxczgyMmFHWmxoanRVRW96?=
 =?utf-8?B?R0ZFdGNmSXRnb3Roemx4d25NRzYrNzRnanpQOWdBdlBBRytiNy9tYjVFeDdq?=
 =?utf-8?B?T3QrckY1V0FGMkQ2anZzb1psZTZPK1lWakswS3FRTEljTFVDYXBrekE5NEtL?=
 =?utf-8?B?YVZ2OEpkS3JnZ1dLbEdGdlZ0c0diUWJ1MUk5Q0wxVjlFaXF5WmZ5QnA4bmwr?=
 =?utf-8?B?K2s2RUFRUTlsNHV4bk5McGVJeldZL0NaWnY2WktKTjhtU1JKVnUvYkUzNE5Q?=
 =?utf-8?B?OWpyM0wyK1RYUDArUEp2ZTJ0Sys2VDh0SE1YUmpEc0xKVzUwT1NkUkZsUXJO?=
 =?utf-8?B?YUE0WXZkU2NMT21jTkJvQVYwaWplZmVPMk5TOHVEeGxYOUk4WUZ4OVFhUG1z?=
 =?utf-8?B?V2NkVEc4bnEvb2ZSM3BTRGR0T3d2TStncXIwWGp5KytWR3BKbzZpSXBXdWY1?=
 =?utf-8?B?U1ZvVEdOclBYTk0wVUNqcDBWc2xsSFdNZGVzaFZ0bHNqSks0cUliSWczODJ6?=
 =?utf-8?B?anJtMW1uM2pvNGROWk9ENmZDQ0NhNENpVHo0VzBrZ2ZWM1QydVU4ckFEakVH?=
 =?utf-8?B?U1NDVkFOczZadzd2c2NwRjRHRWh2Mm1rTXRrTllYRWlxVW1ybFNLenladDBx?=
 =?utf-8?B?N2orakpSSWVOZjZwYUJkU2NGQm5VZ0V1VkVEcTVvcVpydDJxOU9WVFcva3R1?=
 =?utf-8?B?QjFmdCtJOG12alg4dGVlUFA5UG9oN01zZ3FaODJ0MENiZFhEMGl4V1d3UHYz?=
 =?utf-8?B?TU9ValQyMkdnOTlkRE5NV1JLTnVpY0R1ZE03bUdNNkpoVE1id3hIcHE2bWp2?=
 =?utf-8?B?b1VyK0RtcUErNnNEdTNOT2NReU1ESE53eXNxc2RHdnI2eVdQamRweDZQKy9N?=
 =?utf-8?B?TG1Ja1B3ampJMFMxNzlQVEN6aEpMQnd2YUhSVFg3TkJBK3J0Uy9Lei9lSkVI?=
 =?utf-8?B?L3Z2eDYxaUtlUWpFVko2eXZRL3UwMlNOZ2hlYlVob3RlSG1hekM2MkVCVnBL?=
 =?utf-8?B?ejlmcnhGQ0U3L3NaQzdEYTd2cEIybCsvenQxYld2T05DVVRoQUFsU2tZN0pn?=
 =?utf-8?B?bFdoeFFhdmFhTE92Q0h2ZjFBSEY5a1hjRWtkOGxKQnpqL3hPNG9FSXYvRmk1?=
 =?utf-8?B?S3VNWm9zSFhrenJqdDNJQkdqVVFsaDVzRXZxdlRCdEF3UXQ2ZTlTNk01Yzd2?=
 =?utf-8?B?eHk3NXZXMzg0TW1HUkF4RTdqT0dDQmRNNDh0bXZBK3djOHdkbGNwNkJzWlZi?=
 =?utf-8?B?YUxwd0gyRFEyd21xYWVPc1JvMmhYK2Y0YnVKRkVTby94STI1ZmxXanIxc20r?=
 =?utf-8?B?QnMyWkVqVG5RK2QzKzhCS3NJdTd1Q29rQzZLVEEwZDRSZXZ4NFBSWmdDTHVl?=
 =?utf-8?B?UklHdUtJbXdzejI1M2NidFJhdm9NVFZXbTQ4Qk5rc2paWU40M25kU3RuQ21w?=
 =?utf-8?B?dzJQaDkzeFBnYXdyblpZQmVFbFRsczJpUzVGL3gxN3JIZXRYUVNCaE5aazhm?=
 =?utf-8?B?SWpyU2lib2h5OE5mb25iMmVLV21naWl0OFVyb0kzcmR5TVBEOWl3N1NpZzgy?=
 =?utf-8?B?bCsrOVVWYzNOUHZHT2dRMjVTeElIQTRidysxa0ZYdjlLa1JCaS9hWUtEYU01?=
 =?utf-8?B?NkhOSkVWcHBmT0FrU0x0dmhVOXU1OHN1Qm9mcGh2Z0xJTlJEZ2Z5UDhUQURJ?=
 =?utf-8?B?U3NPdVB6RldxS09USzlwMzVMRFRwY1M5WGR0c0V5RzVkTzBXTnVtQytEbTBk?=
 =?utf-8?B?U3ZYSUhSZzNZTFQxNWFjdDVhR21ieGh4SGdIQjlrcm9aSHBiVkZncWYvbGFY?=
 =?utf-8?B?SWc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0864a1b5-a382-4f2c-d806-08dca568e1f3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 07:28:26.6812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FGCfm5Tk9ZU1B+IFDXGcb+QDi1up7iTwwRkPHmiu4e/WXCB4alrm80VT+PRW6w7Hz61B4gvKyIFwpLSGvHcMRiJaAuOmE/yckjdPW09sNxk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7270
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Jul 2024 07:28:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5317

Hi Matthias,

On 7/15/24 6:23 PM, Matthias Pritschet wrote:
> [You don't often get email from matthias@pritschet.eu. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> 1. Changed one letter (s/B/A), so the sentence is correct again.
> 2. Moved example from SYSROOT_DIRS_IGNORE into SYSROOT_DIRS section.
> 

Would have preferred two separate commits as they are related but not 
co-dependent changes. As a rule of thumb, when you need to list changes 
in the commit log, it usually tells you it should be split into multiple 
individual commits.

I don't think we're too rigorous with yocto-docs so I would probably 
wait for the maintainer to provide their feedback on this (or silently 
apply it :) ).

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

@Alex, I believe you're the maintainer now? I think this should also be 
backported to docs of older releases?

Thanks!
Quentin

