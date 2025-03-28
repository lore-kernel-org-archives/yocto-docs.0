Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 252BCC28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 14:00:27 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.75])
 by mx.groups.io with SMTP id smtpd.web10.11930.1743170417092548499
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Mar 2025 07:00:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=hbxzYHGT;
 spf=pass (domain: cherry.de, ip: 40.107.22.75, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xR9wl788bVUJmRKhusJ+XVZEr/CMCrFrEAh50aYCrNkWegPJ7l7eDVJm7k0IaAqRyuMJYL7guhViobN7nKQX3z3s+7YdWKBZJm5G2Zo80vE7foJFLT4gNcHubLJmzryBjR0PJt4/xyd9f8mxM5Zdo2QVRq7h7rPCNdgDUtubLwKhtsQsLh8HPfsJ592uuUHFHt9Pd0a1PuX29DCNooifTHinrrnwx5FMeQBq6/g3kIeS/b/Bbk9WPBtuWS60Cq89Qdtgi2q+OHNMDjvHmdKuAWE0xIWLgxcYX/o1qlpzpp4sMRB5C/m6ShugKLFcH40EJ5mKYoaWsx7TAQ/26yJXjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6KLGjJ+vCbTrs5hN/mmZqadl2cLITLcC/O6TeZCGnak=;
 b=qlE+m7Nu/4RSWV6LX8HInqz1UOGW9ugtKUAx7A9dLBaH/PD5aMqxxNBqVJ/KUp4DBVa17GjCQ9ld69yrCKd3XiRS0T1AiMLRD4kd1z41ou6frQgaGZZAVV0wKMjy+Z51icE3v7MsK/3xN3z+MryoGqhHxZ5UZEsGeOu9Fdun2BlFMHL2RzRtkoQYgR+CTH4d64kVf5JX+tewTJ0O2AWlNemtxpgsKxz/MkDql8AkUFiwHwWeppvow7Ts2JVhb2ofi7BB8/qD+sw+iwvCs6NHMByR2Yx+eE9gbS5SGjJyVlPqnZDO4uznQO/7YsRebqq1Hy81YJHRF4kZNNuNCLjZ+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6KLGjJ+vCbTrs5hN/mmZqadl2cLITLcC/O6TeZCGnak=;
 b=hbxzYHGTx/C0pZ0Em1dWH8Sp4QjzTU0j1qIcIPghphd0KNN1pRr/9V+28ofur3MiRFbpbkytP34KlDjZEWsc46jkuGyFIbSX/l4Sj/ir86LGD4wVcde8LOQ3qQuMfetSwTTbJmLyRf+0mOzhxSxtxsKX+QXL+N8Wauj261DEmKU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB8PR04MB6955.eurprd04.prod.outlook.com (2603:10a6:10:11d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 14:00:13 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 14:00:13 +0000
Message-ID: <34688a93-9bc1-478a-81ec-52be0bc290fd@cherry.de>
Date: Fri, 28 Mar 2025 15:00:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 02/12] ref-manual/variables.rst:
 WATCHDOG_TIMEOUT: fix recipe name
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250325-release-note-5-2-updates-v2-0-19f050d61da3@bootlin.com>
 <20250325-release-note-5-2-updates-v2-2-19f050d61da3@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250325-release-note-5-2-updates-v2-2-19f050d61da3@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::11) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB8PR04MB6955:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e081c77-9f38-4427-5e04-08dd6e00dc65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NjVYaHZhWmI3QlNSb2g3eFgrd1hVaGJLK3JpYll5RTB1TWNQZ2ZJNzVjSzRP?=
 =?utf-8?B?KzNvUTd2c3BoMjU0TXBBeDNZaUhocmUydVlqVkIzZFVlbk81eWVrRkF0ZWlr?=
 =?utf-8?B?T1lvWXZTU3NjVndQcHBQMDBsSEhxWHAzRGZDRlV4cHBtU1k0YVhPWFBEM21P?=
 =?utf-8?B?UUlmZWlxUDgzL2xqTWVDMFdPMVVQOVgxazRXbVQ3aHNCUlVROHExUTc4TmtU?=
 =?utf-8?B?NnFsMlJYWHJscTdPc3JPakFLNmVzOHNIdG10M3BKQnoyVml2RkFSK2NObTBB?=
 =?utf-8?B?N2w1eHVKY0RFWWpLQWJwTkVnaS9NRHJxSjNHZVcvb1NvZ2owdWdYWmwvamU4?=
 =?utf-8?B?NmNCdjRId0dCdDFBdGNJYmJDNlliY1hwb0JibGtFd3VtdEluYTRxQWQ0M1FF?=
 =?utf-8?B?YkhIRWUxWDZCdUhhWnhTNkppbHpSVUF3eHRMUGMrYklmelpNNUphaGhBVndE?=
 =?utf-8?B?ejRKenJ3WWREQ1VXaW03NjdFWm54UndObjhyWFRUbHBoRzlzeCttRXk5RE45?=
 =?utf-8?B?ZkV3MVdhY2pmN3cxenFmQ0IwVEdLZ0lJMytFbEZmbVFKc2xzRWRLTnY2NGgz?=
 =?utf-8?B?cTNUZ3hsVCtNR1IrSFN6L3pOVXdwdi9QK0lNMjVWeVlRQ0YyQXVRZ3NZWDUz?=
 =?utf-8?B?Zkt3cEZHRTNuQUJqdzRtRWJORUdVUkxBdkx0NURNNjJqOGJmazJnU1F2Z0hm?=
 =?utf-8?B?TzNyOHNwWUxvWk9JNUs0b0ZHelhGa1dyQzduenpXVXhpN2RQN1RLVlJWbjcr?=
 =?utf-8?B?REpUUXlucjhqMUdMWWV0YVhTcmtQZjdNUWtlRllrZVdFRDBQNWFGdWpxdVVP?=
 =?utf-8?B?T0pqMlREMVR0Nis3d3IwZ3pHeGhVdVhRcEVIYVFtRnBDa254dXVkNkNNQVpt?=
 =?utf-8?B?d2ZGNFNwMEwwdkFYaUVINWRwYndmaVlNV25UQ21XMno3b2JjMDJKZ3BnRkI2?=
 =?utf-8?B?R1RaVjY4TjNGUTByeDVEbVVhTGxHNVdQUW16di9ocWswTWJycm9ZYU9hTlpK?=
 =?utf-8?B?MzBCVEpVRDN4eDR2VzdLd1pvSTlPZHF2YjYvYjNDc2phY09INlRlNmJjeDBX?=
 =?utf-8?B?NEJ4aUpvR05OblFhUGhVejZVMmxFT1NpZmRHaEJ1UExMMS85bksrTjgyNkVt?=
 =?utf-8?B?UUxzMUNEaHRjR213MVJBMEF2Y2YyM0VMQTVNMHJDL2NyS1VPcWg0Vy9DcGJ2?=
 =?utf-8?B?My9NOVFTTU1TVkdYWERBQVo0RjNtVUpWNHJlQnN1Rll0eEZCdGdYdThXNmRl?=
 =?utf-8?B?eTEzS1NMbGdNU0N1NzIxSW85WGhURFZDU2IwK1BGT0g4YWJFMHVCWE1PaEpV?=
 =?utf-8?B?T2I1cGo1QkJuVnRZN1BqNml4ZlMwbzRhT1JYMmtjejdvcVJ3aFJkUDQ0Ny8x?=
 =?utf-8?B?TXFoaWd0QnFrWG1XWTljREJuSUdqTDFuTldHNXBmaDhWcU9XMi9sZHF1NS82?=
 =?utf-8?B?SVlVcnRCdXJtT0FQcTR6cnQ3ZFB5QUVObHlpeEhHVXpBcWxrRjBER0ZLdy9W?=
 =?utf-8?B?cERaKzh1V21HMVh5QkZLTzhUWjhyOFZCOStQSEZvc1NLVHhEZkhaaC9HeDRD?=
 =?utf-8?B?eGdlY0ZJN3AvTWNJWGhJZGRtWkNRT1FEYW9CU05qNldnR0RLb0dSRUNyczVP?=
 =?utf-8?B?ektrUWN4UUprZ2taUEZWRUJzMXZVbmVSbGxVKzRIN0ZoVUdQZGkrQWFkazFp?=
 =?utf-8?B?UFFiNGEwVUxteWMrU28rVFF6UHloODkxOUs0clNCWlFEVkpXQUJSWmg3OEZs?=
 =?utf-8?B?UDdHWUdFR1U3UWpUZGxJYU9kN1lSNnVLaW0ySXpDQ3VMS2NFWU0wUmVGSWdM?=
 =?utf-8?B?cHZPcEZHU3Q5SEJqbkZPZXB4bHJTK2wwb3d2SkdudkQ4UFN1d3FYWHpWR0Ey?=
 =?utf-8?Q?xMtms/i8HkHcr?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QTI5cnF3ck8xbEJnUGh6TWNaMnJ0QXV0Y1BSM0dESTBiVENkUzRXaXFmYjgy?=
 =?utf-8?B?ek1ISHh3MEFqV2V2ckV1amdoWEJ5bk9wSnlTQ2hWSFMwWi9EWGF6SUxpVk1w?=
 =?utf-8?B?c2EvUzc5RWlIc2RDbVBMTS80K0szczhkNG9MQXY0b05TdHZiRkdITWR0K21r?=
 =?utf-8?B?dEdXN3FwcXJyczBXRFR4Uk9CZWpQMUZPRkN1MUVPQUJqb1VudzJBeHFERVhr?=
 =?utf-8?B?SXY1eHFleDJoTnZYWkNBcjgvei85cmt3YWliSDRSTDFJZTc2ZmdXSnlJUDMv?=
 =?utf-8?B?amdSVm5wNTlYdjNzQVJ6Rk9vUSszaUQ0d0hZbXZZSW1FQVRTa0c5b2F1ZXJT?=
 =?utf-8?B?NW5MV1ZzWE1LUmo0UCtpS3ZjU2JKL2pDb1MwMmtMejM1NEl1VDJxdTNoVWds?=
 =?utf-8?B?QlgrR3V0VG5Nb1pYckVCOHUvbzZGek5sUzk0bEpNcE5oQXFCbDlCZWF3ZFJP?=
 =?utf-8?B?VEYrVU5IMVZ1akdXSjNOY3BCTVdjVXdnS2tHYlNxditMQUdUVkpjUk9IMEdi?=
 =?utf-8?B?TjZMeXkzUXFpL3d5LzlEaVRsWGhseWJQcjNJU1E1ZHVCdW5MSmF2V1Q2SmJk?=
 =?utf-8?B?N212bVZDckMwQjdpWVZFUHZ1aHlDNVpqODZLZkloOFR5SUNBczgyNXV0RnI3?=
 =?utf-8?B?M1JuYldsM0Fwa3R1MGNERUVQMnQvYjVoNHE3cGV4TVZCcThuVWRPbkxiQWYr?=
 =?utf-8?B?Y1c1bUNRVnlUbHFoUTk4cytBVFNNQ2k0N0liUU5TRFhoMW5zWXZhZzNYdW5p?=
 =?utf-8?B?NDlYcHJGSTl3cmt6L0pTRWIxaFZId0pqajhSNmpodEk1Y3V6RmRUVEtrSkgx?=
 =?utf-8?B?SjJTUEZpNU8rZEhaT3ZNRHJYb2crbHBBMlVxaDJrYWNUVGJVQThnVUptdGc5?=
 =?utf-8?B?QTFqMWJISDRUZ2RPYm1qWFJySitXQ1AydS9wQ0F2aHoveWRmUE81ZXh5YjE5?=
 =?utf-8?B?MVZXaXprWVlpRGtEVzFVNW55ajk4NFRkakJIZ0poUmxCdWlxNmNNTG1yZ2tN?=
 =?utf-8?B?MDBoL0d5UVFoZWg3dVJRaDhmT1RiQkhONXRNVUhUY0E5NVA4SWVBODgvYktD?=
 =?utf-8?B?RFRBMnduSnRFVzlRMkxIajh1Tjg4WDZaQmZvMEZCazEyUGdTQWhVekdsNGNt?=
 =?utf-8?B?Vmd2eXNRMUZJNW1uc2Zlby9KeDF1MEIzUDNQb0I1bFFHMlhnSFBHKzd1Nkwz?=
 =?utf-8?B?Uno5RHJvWDJWeXRzSWNiQWlxbkU5a1oyOEVxOENlMlhzc2c1clhpcHlZcU0x?=
 =?utf-8?B?ZU5uNUpsQlNsUjR3a08yQUlJUFBuTVFVZGhVZUJCcDRLbXdVWk9WY1ZMQU5n?=
 =?utf-8?B?ZlpadGR5dWg4THR2NUtISVh4aDlUUklINGFzdEtlWldseEE2RlFhdWxocS85?=
 =?utf-8?B?ZlBVOTlNRVNUUE8rYVNielc3UlJrZzlxMlpDYXptejJHUWxQbmdCb3pzZ01j?=
 =?utf-8?B?c213ZUN5cm9qTVQyeWNZKzZsM1c2Ump4VE9ES3lTc0ZoS0duc1I2NkdENU9J?=
 =?utf-8?B?UFZLdy9YaUtMMldQSjZ2QWFmbnFlVUF3TDVwaW1qdWVXc3UzVkxmVmJocllR?=
 =?utf-8?B?Yy8wdmNqVmcvYU0xYyt0eWY4RFFJWGFjODBWejdyNmVhTlNOS01EK3ozZDZX?=
 =?utf-8?B?dERFU294cnNCOW9rbTBrWm4zKy94a2VMZ2p3VnRnTjhRR0djR094bzloZjVu?=
 =?utf-8?B?WWwzVHhvYXl0R1BtTXBEbEVxRG0yZFZNaU9jN1NMNXUxRi94UnBqNWRFdC9a?=
 =?utf-8?B?STF4Z3RIUkc5MkFiYWZkWlFtTkxwSUlvL1dyVUtWYW9YYkxLMXdzWnJ2M1dO?=
 =?utf-8?B?YzNpYW90ZkZ0bjRiSHJWejhKWnlreDZQVEdHRDhNMzNWSmorR0dBZ3hIVkJW?=
 =?utf-8?B?a1BiR2xJTXZEemVXWkhNYXVkb2JPU25oaEdqbkJiZkVPelBCeWxIL1FoU05p?=
 =?utf-8?B?WkFDM2F3cDZhN1VNWi9mQmlKTjE4S0ZrY2JPL2kxdisyWGVPdTRDbU55d2F5?=
 =?utf-8?B?T1Z0T0RWSVRPYnVvZlczN0xLNXJZSnloR3pIdzhRa3FpWmx4YzNGbS9DU3NX?=
 =?utf-8?B?SlVDZWZGaFJDMVI3b0c1dVJnUVQ0Z0R0NytpZFBITU4xdzNoSjV2UFIxYTBQ?=
 =?utf-8?B?ak1FZEc3MzE2QjNkU2xXM0lRV1AxckJFUmhLZmJJRE5RYlAzQmlURktNUUpG?=
 =?utf-8?B?WGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e081c77-9f38-4427-5e04-08dd6e00dc65
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 14:00:13.5823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kxgVoadP71I2lo6b4eDW8bDcsTIXrT4RJDjgfj2LeY4gmolwNwlJtvJcBQ5H3dzJ0VTN69uX+11/9mLoaeubAuVAWLqJQinH3DLkuZu4rDc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6955
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Mar 2025 14:00:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6671

Hi Antonin,

On 3/25/25 10:20 AM, Antonin Godard via lists.yoctoproject.org wrote:
> This variable affects the watchdog-config recipe, not the watchdog
> recipe.
> 

Good catch, this was introduced in 4.1 (langdale) so can be backported 
back to that release.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

