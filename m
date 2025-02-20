Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA0EC021B1
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 16:05:47 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.88])
 by mx.groups.io with SMTP id smtpd.web10.34.1740067539825416295
 for <docs@lists.yoctoproject.org>;
 Thu, 20 Feb 2025 08:05:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=gacO/7N4;
 spf=pass (domain: cherry.de, ip: 40.107.105.88, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pCYxUAUf1s8cmPbxf/evvz2YPaH1q8eO0odle7qXWGxxYBVcF1PYZ2MxuRtBvTC1CiSqJ+B08m6lSQp+zQwsJk2gGlPcRZXnG7vSPzXArik8mtbmw6Q9wDVq7eBB+1eEQJDSyLVXxT8tTSEcSl/sY+Usz6VW2u026/KHkOIJD2pCxFcSlPt7vYzHQu/dPreUplNZhiacglFJ90Dxbf8QXXQ3VlsH41iYxEWq3GhClaPqYX1F2cCQ2TmOkPQy5NI+2rIjthsjlnG43t533IEZ/zh1NQKeAt9mX9ixCdEGXZqPl+vqjBHIkpw0Q8IETWWNCQY3Lk3mGp/RqNE967gHjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06f+Uv3/HplBrFXIflXmLEucMOZWF9pePjnhvnmp73g=;
 b=rCLk1B3HxyaqZgb96J4u+pfdL3GWikJQhMptiOQzQSKEFcT/LuGgkpN1PAiA08GBa9pHvSqeDJrm51KjfdW395Goi3fHD6HrOr4YOaQlkRyhyf4bZb5IJ5310aQm001r6oIjn96QCJxzDoMx2QWFcrdXEOh1hbqOSMz22kNKeuuxmN3YDMF/hQ8l415svaqzR9nftIvsZu8A4SzTAprXHiE9NP8nyu43NM5RB+7X55eQZyyEtfAQVwPJ+6eOeTAAJ0A42ZDYG6gwhx+n/gNbe151XfQS2kWuW0W/zE8zGrK3hNI5qTUQhVTJJt24itsjPpDRdQ93mwdF3NewIqkWVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06f+Uv3/HplBrFXIflXmLEucMOZWF9pePjnhvnmp73g=;
 b=gacO/7N4jxXKWx4JFk2VCGuaZOP+sEsLD1md0xO+k7UvT6efH5oyl/i6drHBqIAG9lAa9yDlhbfgor1zipdPEHf+R7dRTuQWhqNe5q8iHqfObIByEPjL0UtI84cwXvseSClhemVEKvtNUg0fC87Du5Qj0o3ngEw0qPmC+E/Bz3k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB8214.eurprd04.prod.outlook.com (2603:10a6:20b:3b0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Thu, 20 Feb
 2025 16:05:37 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8445.016; Thu, 20 Feb 2025
 16:05:37 +0000
Message-ID: <ec0c3cea-78f9-410c-8359-86bf608d8107@cherry.de>
Date: Thu, 20 Feb 2025 17:05:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 2/6] overview-manual: convert patching.png to svg
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250218-overview-figures-v1-0-75d23b5e7a88@bootlin.com>
 <20250218-overview-figures-v1-2-75d23b5e7a88@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250218-overview-figures-v1-2-75d23b5e7a88@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::14) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB8214:EE_
X-MS-Office365-Filtering-Correlation-Id: c9b68e2d-c5ec-4811-f1d1-08dd51c869fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TzdYRXg2am04Q001R3d3WU56ZGVsTHo1S3V5KzBZQjBrZVJnSG5vTjZHTktG?=
 =?utf-8?B?VC9obStGYldlNTJmdlYxTkFXQTJLZmNXazBvTUFDZ3ZteEJYQjRNWkpQVkNs?=
 =?utf-8?B?R2c0TUtPTTBEZTg1YmcwUUlQT3NsU0xKekxpbGVJNmlvWmxZTFNUTXZuVjlS?=
 =?utf-8?B?ZnZQd1VxQkNxYi8yZ1BhK3NvbXFwUVg3c0VTOEVlL2FIT0UzOWlJYUhMZVBD?=
 =?utf-8?B?VUpNZWIzWlZtaWQraHRGTFZqWGtTcURxWUEwcENyQ2J6cStUTDVBaHhObm9X?=
 =?utf-8?B?OVF3UHoxMWJ1SG9sU0NSdHZIbEZ3RjRZMkJlRGszN2RFanl2eTQwM0luQStz?=
 =?utf-8?B?VUNKZ2Z4MTl5TVVwZldOb3d2TzlYcTYrdFc2UzhMbjBwQVkvMjF2NGdYU2d4?=
 =?utf-8?B?MWZ0U0tIWWZJUTNpOFZ1TTY2Z25SNHI2R2RmSGVrM09PVUQ2YWhKYTZVM1NV?=
 =?utf-8?B?S3VLRnVUQUJ3eXVXeWFYNWh2T2JTRDY2b09qd0pXN0ZTSlRHZ0loOFF3cVhK?=
 =?utf-8?B?UWZvdjM3RHk5TFV2c0t0akEySE9NTUxESFkzTmc5MEZmMWM4VXRoc1N3ZC8y?=
 =?utf-8?B?MVN1MHJPdnUrdUk4c0g1TTF4Q0Y4UkRwREQ4a0tyVnVXekhpTlNGREtvU1Bp?=
 =?utf-8?B?M0Z3bXdqVTFYR21lMEpYa0R4YUpqK1lwZ1ErYVFTbmV6QWI1WnMxRGxrVG95?=
 =?utf-8?B?NTMvUWF5b0V1SjdoWWVzUFJDYVEwU1lYNHJ0cFVEekx5N000LzlSdFFXQTN6?=
 =?utf-8?B?SXJZK3BXQ0s4YWQ4SExSZmVhVHdHZ0psOVJYSmRNM1hJYnNQN3NYdTdmN1Mv?=
 =?utf-8?B?NDBNb1FYbWZRQmV1VUJLR0ZlZ0F4V3N6YjJPWGVYUFp1UGQ0T29xNzV4YlRO?=
 =?utf-8?B?dnNBZTFUcXZTcERaQUhHNGZKMkxUU2NySnZyQzl0eFhTa2hNeVd6bUVUOFU2?=
 =?utf-8?B?OE45ZnUwemRSaDZUNmVRTzQwYmZCdnZyRDBiVGpWWmxNZDNkSUVjbFZSSGRq?=
 =?utf-8?B?eXB6ZURzNWdMalpFd1grY1h3cnBuZk1vbkxZOThZSG5xbmVJZlpZTXZLZ3Fj?=
 =?utf-8?B?MzBJZG5SK2FnanE2MFlyYzBZRWxyK1NXNEtBYWRsczF6N2NKc3RBNHkzdEF2?=
 =?utf-8?B?SEF4MVhJSU1YSUJFeC94bUlnRjVLTFMwOEJqeVEwWGlmM0dYbDNpWTVqRU5w?=
 =?utf-8?B?SFZidlVwSkpuM2RaaUFNMjB2RUdhSkxRcHFUV01XeTI0RWF2WFFRcng4cG9M?=
 =?utf-8?B?dmVUUER6K2pqRUFlUEJ6aFlYcXhQbmNnS3ZRY2VCMERVUXJjTUExakRNU3E2?=
 =?utf-8?B?R0taOEpZV0pscFM1d2l6aEd5c3ZIeUQ3YTBQTnc4U3Rvd1FONHQ3VkpYbGhs?=
 =?utf-8?B?MTRmMlZibVkzSWFSdVNRYzVhZnZ2Qnk0YzkyZy8wSXdoeGd5ckorNDFWRTZV?=
 =?utf-8?B?bCt6UXBGUjdJTzN6K29FeFh2NmhjNVdWSFkweVJBYnVDaVB4T210VHRUSWJK?=
 =?utf-8?B?R3Z2R1V2anpkR21Wckh5L1NsR3BkUUFCS2ZHSEtHSG1LdWlzQUZYeHhTbk9D?=
 =?utf-8?B?THY1azd3aHFYTklncjRtNkhTZWE0ekhJS2o2ODROZTV4ZVRoQWhkWEdJeFJG?=
 =?utf-8?B?Z1lZZ3BZV0V5eVBtNk1WbzBQWTNLNU0wM0NtYTFOdnk5aHJiVVdacEdFZzV1?=
 =?utf-8?B?NU0xVHoxS3J4V2Fub3UvY1lNdEVyWEd3Y2pxVDJYKzh6ZnRPN2N4MkpodzRo?=
 =?utf-8?B?cmp0dWdDS1VTVjdBdmNTR1ZITFJVTkgrM3RQQlpoTldTRDJTdEpGejZkMUdl?=
 =?utf-8?B?Z0NwSm5mejhZaHlmYVVmVSsxNXJiY00xeFhyL2J5N1QrQUgxazNXRk1YWVVZ?=
 =?utf-8?Q?l4e8eGxyp4Rqe?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MUtTZTQ4MUlrWWVTMDhwbW83TVVXbEFSRGZlQkZYODUyaDZjaFBNWjVVdndo?=
 =?utf-8?B?Ynk1bXlydzVxY0Vvekd3aVVSUHdlenlES1QyRm5JK1BHYWdPd25TV25iMnV4?=
 =?utf-8?B?cGM4SStnWW1JSW5DSjF5Z0ttbWtTbzZ5VVFwQ1ZiQnErMVhxUkxFSUt1SGxB?=
 =?utf-8?B?Rjc4dkROdmxlcVczVmRLZWdTTTFqK2d1ZytQOFRPaE5nNzlMZnB6UU0yNDZ6?=
 =?utf-8?B?Yko2OGVKTHFOWW1LWmthS0VaU2p6TUlqTUQ3NSs2ejF1aVprN0ZHcG9HMUZ3?=
 =?utf-8?B?UnRvRk9pbUNGOU1oZFFtMmwxQzJlS2lUN3pNeHZhWFNqZHM4MGtiZTlaMEQy?=
 =?utf-8?B?K2ExemgzV2s2WTdpVlVYemNtSTdvNHVaMGRVUEVPQ0czZzlxQld3WFdwRDVV?=
 =?utf-8?B?NGR5Sk11WUp6aTgxb1FYcldIVG9hQklrQWVkVEhId3hicStuVExnTzVvZDhG?=
 =?utf-8?B?blNxM2x3U3E0NlNkVklRODJmNm9yQlZQK3U3emV5RnFwbU40d0dYYS9IU3kr?=
 =?utf-8?B?M0YvUnFmd3ZmaXE3dEdtK0lUd3NEUy95b0ZjTnlpSzgwL2pNaS9TWXhoT2Jp?=
 =?utf-8?B?TE9RSkpSRVpUNnY3SmU5N25pZlYxd3E1a1RqNWtYeW1mNytRK1l5eDRLaFV1?=
 =?utf-8?B?eVpkeVU5RHlrNlZRVHNXR093TkVMcTVlcDAydzZzbFc0ZEx0STc5SVNqQldT?=
 =?utf-8?B?NEZnYVdvWUxMcEY4UVVCeFVYamZkV2R1N0tWM0dBUThwM2xldFRTVkMyWmtS?=
 =?utf-8?B?aWFzVmJoN0Vzb3hxZFlzdWN5TzhIZnpMbFZlYSt5RGVkSDlyZjk2dEtzcW5P?=
 =?utf-8?B?TzcxRk1UaGRFa0YzTTFsVTFOWmpHclJnZ1M1eXVsMHcxc3Y5RUdxVFNkaEZY?=
 =?utf-8?B?bTdDdllMTTErVlI1S2xFNmpTU1NSOGVEdWpOTFlScGhIYmxmcGtSL1hPa3Z3?=
 =?utf-8?B?TUhyeWprMFloTW53WXRQMFdINEk4djVxaFIvdjViZnlIbVdGcnZuMEcvNS9B?=
 =?utf-8?B?bTVEZGJWMW5MK3dkNXRxcDRPVmFKckZxU1dwRkNHeDBQR2dFUTU5M29MWFc0?=
 =?utf-8?B?d1FGZHF1SkxYUW1tWWs1bi9lZEt4Wk5TZ28waGxlc290S21OYmZKUTVTWHdL?=
 =?utf-8?B?WHVhdUdJeGZONmkrNHJKZDZLREhvalN1Wkc0T0Evd0owbDU1WDg1WWsxanJG?=
 =?utf-8?B?Z0loQmhmSVBHZG54Qy83dGdaNnZPNExkTFoyQVU4dVRwWm0yVjhlSHVTa3Y2?=
 =?utf-8?B?QXZvQnVTdzdtZ1Y4aURxVk1BNmVCUnlTNkNNSGVsK1Q0SVFRcnYvNmJQc3E5?=
 =?utf-8?B?dmxKN084blVvd1QyWGxsTm4vUFdhaGtsQis4SkVlakNZUjB1NDZSY1pFcDRL?=
 =?utf-8?B?Sm1PclZnL3g4N2xEN1YvWk83ZytobWRadVNzb1haZE8vS2swZDdLT0xmSlIw?=
 =?utf-8?B?VHEvWEE5NDBrT0J2Kzl1M2ttZ1JJS0c5Z1FTMzRnT3UxSGdKSk9GRWRSVHpS?=
 =?utf-8?B?dC9sUTVpSDRLZWI1OHNCRW9vZDN4NFN5UXgyb0JybEtUdjM3djJER0ZEQlg4?=
 =?utf-8?B?NWFiaFlzQldqR1VJZm9OR0NRVVF5WjRXVEhoYldtZTVFenJqTEZnMzg2NWEw?=
 =?utf-8?B?ZlVoKzlTcVozbUQyYlFPdW5TZWxzTEFTZVVHWG8rcnJ5ekpqejUwQzFkSW4r?=
 =?utf-8?B?NHAydGdBUHZwV3ltbThJNHNCM0Vhb3FNZDJJUW4xVVNBUnUzUGFYcTlyNno5?=
 =?utf-8?B?MW5BWUNqYVlsSUhzQVBMNmxqRHpaTjEwWGNNWU96KzBYb3NvTm5xaUE1TlRn?=
 =?utf-8?B?MDh6NWM1Ykh3bktzYytHZFpkeCtGOHFhRjBENm5VNk9vZ1I2N3A1L1R2dDgr?=
 =?utf-8?B?MWpmd1IwZEM5Zldtb0JkS3pqU05sc2lvc1BJaTg0SmlzamVpVnBSZ0FFOWR4?=
 =?utf-8?B?Y05BdlU5U0UvZ21PRWYyRFlqZm9oMVh2M0dudDFhRzhVVmlEY01OTDdIbmlx?=
 =?utf-8?B?eTZOWlA1UC9zaGdSUEM4QjZodGtpSzlSMmVEMGxlZVNJb1E3c3F0WnZueFNJ?=
 =?utf-8?B?VGdlQk82eVZBaW1PZm14QTVmalVhczBQdkdEeHpzOG96VDJwVDUyRyswNlB4?=
 =?utf-8?B?L3dKMHJYTG1oRzVFbitXZVF4cVJWcHJWUjZzV1lXMEtSNHZBMEx2Z3puaExo?=
 =?utf-8?B?NFE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c9b68e2d-c5ec-4811-f1d1-08dd51c869fb
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 16:05:37.1483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GcGo828j24vQc/EDPGmeUA53X7TS8MamYcx7Hbgfaz5UhM5advx8+P79DOG7WBm9rzYDNlokenShGeKEcKuH4AP64ApABm7UjpwR+sm1R9M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8214
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 20 Feb 2025 16:05:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6420

Hi Antonin,

On 2/18/25 10:11 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Convert the png file to an SVG file, and add the UNPACKDIR reference.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

