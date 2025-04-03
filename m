Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3E08C3600C
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 14:21:21 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.68])
 by mx.groups.io with SMTP id smtpd.web11.14511.1743690076402310797
 for <docs@lists.yoctoproject.org>;
 Thu, 03 Apr 2025 07:21:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=fZjXjw5z;
 spf=pass (domain: cherry.de, ip: 40.107.130.68, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N9YERuE3mTVHPLkv28fOx9RHDlxceivcNb8P4P9c0wSUinI4wA5ROTSfNZDiWN4TbFmYHqo61MhgZXbzUtJfASxdjiFjhB3+WSb9z1LUcb3ax2AYan8Azq0F07sfifEFKxI0OxrXXpaRPTYC/6vPiX9WjUWJBPcdSqvR2AwGv2qBoKQ3nnL1hbpzbWb9bFbnJz9w15Jw4J7Fk6H4m6RrUnRmhX2z6JA7YvpvM1FJKnnbVgZmB9vY05BOBVJRI8J/j/Jq2mLO5RCTbz4/DraQsxQ9yVCaxQ5QvscDm8gRZQRHPUPcQ6hcNgqKL+tTIr+CuT9Da37+SYPc3ArPPiWlww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Shy+VNuRCmW0dcU6t7E6NhTf6qmUnBFTOHx/UYDmwmU=;
 b=bHU3iFqUMyqQRuUa1CiJ1m8QggKjFV3nVlhvyMmvc6PA7P07cXYbiAORz4Q/Po+5Oy7K0Iav06kG0zR/vo793cvO0Cl80fENTTAmhxLYn6MgAkRwHFY2LwhmxOB9gxPuaIvHlLBkmJIDSse4AVdlxqt/HXtaca4/AKAs4wqu0oiHlMhxWW1EaZXwAfhfR783W3PwOFQjdFGXdcmUWq9GpTMvQTLwiiwP6JbWD+Qf1lkA48s0oVcuJcnY2KmJBYevwacUT0hSRQzrGfHHms1CtiNvB+IbjuXtW0whoBi1/N0EE3oC0ZegJdYy5MdEgqDqmVFlPMv+gSqQbcvbcy/weA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Shy+VNuRCmW0dcU6t7E6NhTf6qmUnBFTOHx/UYDmwmU=;
 b=fZjXjw5zv65f5BTIRglvbwh7ASZqEoFJGYNKXULLnyXMFv4JlQ8lGtq3u3ZCBUc1Cxg1jhrVJG6F77mIBV3uMRXl+Kb9FxIBeLjbIml4JYh5YMwkyzaYP78vHKcf85v179tXAtWcjR6QsS+EpsDczi+nI5MvbOaCIGezpYmN6fs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by PA2PR04MB10471.eurprd04.prod.outlook.com (2603:10a6:102:41f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Thu, 3 Apr
 2025 14:21:13 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%3]) with mapi id 15.20.8534.048; Thu, 3 Apr 2025
 14:21:12 +0000
Message-ID: <a54bdfce-4480-45ac-b13d-c6c0848916d9@cherry.de>
Date: Thu, 3 Apr 2025 16:21:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ref-manual/classes: ptest-python-pytest: improve the
 current documentation
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250403-release-note-5-2-updates-fixes-v1-0-13d16361f17c@bootlin.com>
 <20250403-release-note-5-2-updates-fixes-v1-1-13d16361f17c@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250403-release-note-5-2-updates-fixes-v1-1-13d16361f17c@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::15) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|PA2PR04MB10471:EE_
X-MS-Office365-Filtering-Correlation-Id: 13bab27b-7130-42e8-89c0-08dd72bac981
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eWViU1ZCcUJjdTZmeXFzRHRRRVdQZ2JweXFKUWNpZk10MHVXNUdLTDcrUjZZ?=
 =?utf-8?B?MEdpUTdBWk9Fa1VvWTlOVXdONnBmcUl2cFhCbzk2aXJXajIvM1ZlRWRzaE9r?=
 =?utf-8?B?Ylk2ZmdLOURpdVA5TU5PVFBLejFhQjVBYTVUU2o4Q1lqUE9HLzUzS0ZaM2M2?=
 =?utf-8?B?VVF4d3dYZHd5NGsvMFgxdGNjODNGTm1nUnNzNlJXUlp3eS91SVZkRlFnUHRR?=
 =?utf-8?B?UVJXeEpVMFVURkxScWp4aGZoN01jVVJHdnpjYmU1NjJ0RnZNNHo4MUZ2ZWJx?=
 =?utf-8?B?WVhaV1BTNG5leHdYRk9SV0ZiNFd3TmNZYmNuZjhianl0RHhvTDlDeTVOSnI1?=
 =?utf-8?B?dUVtbm9ndWE3RXBlY2xRQzVDcXYvbEJQMXJSbTM4WlZrU0ptd01laUVoUE1r?=
 =?utf-8?B?V3R1TXVyTVNOSExZcDZSVklYNEQxSFIxQVZZRDA2eC9MTFNqSTFPWjY5M1Y5?=
 =?utf-8?B?eWk4ZHdUZXhGd1M0ZmxwNTZlWHVPc0ZQL1lLQ25GdmpPdEV3WUdxQ1gyQjNr?=
 =?utf-8?B?RHFqVks2dUZHOU5iSUVSU1I1Y2VLNTJxMS9VRnhEdUVldVQwVUxVK1pXN1k0?=
 =?utf-8?B?amdUS0U5bVNIVzRrWW9HVVVaRWdvK3lKQks1dUlmZVhhMU5UN1M3UVM5N1Qw?=
 =?utf-8?B?UDJFWWNyd3FuSGpCazdUQjlFM0FLMmcwSS9Idm4zZ2FmdVFPeldtSHp5Q2FU?=
 =?utf-8?B?OEtmc0pReXBaTDFBVGxZMDFOa05BcXJvWDRuZFJ4VVlIRmJIS3piV1J4dnFZ?=
 =?utf-8?B?MWxkZjU4bjRycW5DMCtsbmlaU3RHVWJrMHdUS1JOZzJ3N2N0SG42K1M3SnQ3?=
 =?utf-8?B?MEJPeURpV0lVeUdlcFdnMlhhdU9xcGFvRVNURGVxRzFGZ3YxL3lBVjFUR0t0?=
 =?utf-8?B?UGlycGFtZVNSUElxRUhia2tXQlFFeEtFRU90eTBtdVFlUEpQbmJGMHkyNVRi?=
 =?utf-8?B?R0xkTnAwS1lMTzVNU0JvWnF3aHIxa1BzUTRPcFRvRnhucHZHOEhMNjFKUE5Z?=
 =?utf-8?B?N1VtNGVKWHBCTkhnb0xzcVNObjNMN1hJYmdHeWM2VllNOWlKQis0N3VGZkhi?=
 =?utf-8?B?eUlqSTFjN0tKKzhoNGtvNGVvdzZoWnJ6eVZ3MzlBc0R1Q0JGeEE3RmN0SUtW?=
 =?utf-8?B?ajQ5VmJiSXprK1RVNnBkams4ODMxdE5aRkdZVUNtQzQyYmI2bWZya3ZWZmRC?=
 =?utf-8?B?eDdWdmZNUFdtcUxVSTExamhZZGZrbi9zRWRqa3BEdVlPT1NJVTB5V0lFQ0Uy?=
 =?utf-8?B?d05xbXJod2hrR0hHbUtPUDFKeGRzSWQyd0p4OEt6cWoybnlJdEtrNEdtWCtm?=
 =?utf-8?B?Rlg0QzNrY0JpVEVBeUJGV0V0YXFaU1JTZ0JvdHFhNE1vYVR0cUM5dmNjVGto?=
 =?utf-8?B?QTZVRFlpUFNqNGNKWlBNbW5rWGljUmZpdGEydG12aW5pR0JCQnZvNkVRc2hJ?=
 =?utf-8?B?T0lXbFNESDR2WTJQc3ljQ1NaT0Y5eGJDZDZvNFZKWW9FZTNmTE1JajFpSFkr?=
 =?utf-8?B?N21SRlhKanlwU0wrQ0FBZGFDV09yaVRLMnVydkE2djNXR2UwMkttUVNjRkFZ?=
 =?utf-8?B?c3AvRmsyc3JqanJZRVpyNTlKVDVma0FWZDZxU0FLY09LdUY5NXAxcTNNRVFw?=
 =?utf-8?B?SXpjbTdOS2FUTm95cm1VK3VINmh4ckJ3ODFaZGNCTXVMYWFlaXFhOXp4dGN0?=
 =?utf-8?B?UUI4dEh6MWU5WUJGeDlaOXVZYnZES3lIZE11UlQ1MC9GaWFkbXhDbW5VSUNm?=
 =?utf-8?B?NjNRNzZjVXl6V1RkUXJ6WE1ELzhySU5iSjdtNTFGalRPcXpkSHJqSCt2YVJk?=
 =?utf-8?B?ckZoNGcxUjN3MGVXMEZxZWNWTHovRGJ4eXNhNFNRMGhReU5DZGg1K042SU5J?=
 =?utf-8?Q?Lu7dFatodzFxw?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QXFEM0R1Qlgwd3NobnBjcDRwMkpKR1ZMY2FORG1rNHBUUlY5TWVzKzhsVDV5?=
 =?utf-8?B?MzYxdkZ2WW5VSlBUbEdzSE9GOXJQZndwOVNZTVdBRkVJQ1lyRi9KRUF4MjZX?=
 =?utf-8?B?YXBtdzhtM1Boa0U2VzM1SW5zM2duZmFzaUIrYXBBNzBBK1d0b2gxK2VhNE1S?=
 =?utf-8?B?SloyRjg1Wm1sanE2LzhVTmxnQ1k2cEhQVzFwbExpR2xXakFGbThPU0RncXRk?=
 =?utf-8?B?VHZZTG1kSUhBQ3dQUVlaSWZYTndtNHJJT3pMWndkS3lzM2dmNUp4dXdDaFBB?=
 =?utf-8?B?U1pNdEF6cmRSMEdmSW0wR0pCOGtnV0ZsWjU1V00wTXJVVXZEamlnelBVZll1?=
 =?utf-8?B?WGFpQXZuN0s0RDFMUW9OM1ZMcGtqK25scVF3TFNoQ1M0aGFGVGYwS3JPcnh6?=
 =?utf-8?B?NyttVHExV1IvTWtkYlA0YTBsMFl6S0VIZlYwZlJPa2Jwd01HK256VW9Ndkh4?=
 =?utf-8?B?VSthZ2JRMURBZnZKbWhGLy82Zzhhdk9sc0U0c09jSjNvY0JHdWY2V3phZGNV?=
 =?utf-8?B?blowNkJ3OVZTSDdPMThXcERvOW4yckVyc1dpQm5RVnBodHpndkJ6WFQzQ2Jh?=
 =?utf-8?B?WHd0K2QzRm9vSEdhTXlYMlFxbTlpOXFIdzN6UFNXSFlLUTQrSkQ3dUc4WjJl?=
 =?utf-8?B?dVlJc2F1aUlpWk5NZWtiYWFITUR4M3JkSzZ0R0IrQWFIOVA0NjJTYjRqNk5q?=
 =?utf-8?B?a2tnS000Vjhzd1U4Q0VKdXpGZXhjN3A2Vm1TS1pLU3dKV3lCVGwxbnpuU2Vx?=
 =?utf-8?B?YkpZOTlOYXpmaWlTVlh0S2VtK1R0TlB6OWFCZzBmSjJiZEpLeHJTWVRmMXB5?=
 =?utf-8?B?Q0JJSHVXQ0NDRWJBVjNGOE1jbWt0MUlxY1NaNlpzVTVUbHhHVlZTSzE0Skdt?=
 =?utf-8?B?S1ZqdFRweWs0K3BWODRzQkFTNmszYld1QVFiUVpKSlJDcHFXTWhkdjF4elhs?=
 =?utf-8?B?MnRZSDRCaFlSYnAzUW5vZTFwRWtpSU9sckFXZWdpNTNvWnhRd3owTjZsOS9l?=
 =?utf-8?B?VzBrZHlPVEpaSWx1MU9EQy8yYjYwVVo1Y1VGd1NWY0pUR3ZaSk9ST29pYXJE?=
 =?utf-8?B?Sks2NkpsNHpSYzVMais4djY4a3hzZ2YxaThtNFFIcUs1bld5MkJOS2R4c2hB?=
 =?utf-8?B?YXBzSWVoalJ2eEptdTZSdVVDNkc0anM0NUFGQmxiZGYvUFlid2F5RkJTTXNh?=
 =?utf-8?B?VXZDVnN3bHVza3ZHMnNjNUNXZ3lHK2lDUVRiQ3JBcTdybnM3eVVHUFV5dEts?=
 =?utf-8?B?N280Vk1aSmVZMzJSckYwdkVzdTRINi9rYmNmWGtwMUZpNGQ0WW5EMEtkZTRn?=
 =?utf-8?B?OXFUaDdHV3pma3N1dGczY1h5Vm5wNUR2bC81NVRWUzFuWGduKzZyUS9abFph?=
 =?utf-8?B?REU4bm1zZTR3dnUzYzd2emtuY3pOWjlxYVZMdHBZYklnNTZFalBIOEtDVXpP?=
 =?utf-8?B?dVEzMkdZeHYrQThyMXNUSDNTbTdHVllVOTBCUmkwWDd2L0JSR2pnWjd1aVkw?=
 =?utf-8?B?MUN3Mm13eG9sazk4OFh6c0IzNjdId1p6OUNYajhEYmxrUGtWazl6cUNqaCs0?=
 =?utf-8?B?WVdxeFA4THVwN0pZbnNUS1JPNnNUbzZTQ2c4VVc0dTVGdTRoY0h1cFZ5Mmdp?=
 =?utf-8?B?KzFqVXprTDJtYm1PN05GclBSZE1PMWRLZHNrSUJaVWVhL04zLzFSUXFEYWl2?=
 =?utf-8?B?NVJ1VkRlUm5VUjZTQTJEL1VhR3A2SHd6SGRpUFdUMUFTcWJCaURQTC8vVDhk?=
 =?utf-8?B?SFE0WkR4UmloQkJPL0lXZklHbmg0SVViSFQ5QXMrWDV0VUpZME1rMWs2ODBj?=
 =?utf-8?B?WC9ROFlsUmRpRytLT2dNcldLVFlGQU00QmpsNWU0RW8xTW5Gc2pGazh1OTRL?=
 =?utf-8?B?Qk1oUVBObWNBRlNpWHlIRmczNE54NEYrUWJ0Zmx4WGZmRW5CMEx6SENobEVF?=
 =?utf-8?B?UDdaVjdUT1A1MENKeFhUKzJDOUhFQytodzdUbmUvVFJjcFBuZ3cvRGJha1lw?=
 =?utf-8?B?d0xKOUZjL3U1akRFOWpzVXJkVWVCK0JrWFY4VEt0YnR6YW5sdTZGblc1aTY3?=
 =?utf-8?B?RU5DcTJ0M252aGJOUHliaUxWOTJKOFVjZVh0WEx2Rml5SEFCaGt3ZE5WNHVB?=
 =?utf-8?B?YW93eitLa0p5SnZPSTdkNHRsVzE2VlMwUXVRc2NMb2loTXNyK1p2aDdrNXR3?=
 =?utf-8?B?Q1E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 13bab27b-7130-42e8-89c0-08dd72bac981
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 14:21:12.8405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xFXaqbK70aXiD6k/HVspCjNmiSRMbrH3C4oy5W+ABN4P9x3dTp6Rryjj5tYy4ErHQ0YcvOKQkbNEUaPYm+5m7kWgS9YEKHxbsl7cru8j+Tw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10471
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 03 Apr 2025 14:21:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6707

Hi Antonin,

On 4/3/25 4:08 PM, Antonin Godard wrote:
> Improve the current ptest-python-pytest documentation and
> PTEST_PYTEST_DIR variable definition. Namely remove the default value
> that may evolve over time.
> 
> Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

