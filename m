Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AECCCCA470
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 08:46:36 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.9])
 by mx.groups.io with SMTP id smtpd.web11.7220.1759999593089675400
 for <docs@lists.yoctoproject.org>;
 Thu, 09 Oct 2025 01:46:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=bcsCcH8d;
 spf=pass (domain: cherry.de, ip: 40.107.130.9, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LbASLwW8UbYFzk0EpmKbmlyG42O8dPfFO5tM09hSweSf2liJ3XMm8QMn8hOrUfZ6Z1lfml6kQQpc+cKUwDufeDSf/g9ovyEPi1Mc7bbMZx+XkZjl8G7+cRBgvg2yljf6gyeheWiF/ke4piJI6FwIr7O33q5zX2fygMezft/8EFIL13qgZLC7m9Rwc1n/j2eWyFoACT/Z3bjjLM7QUdO/w8OIMv2m262tkGmaeJRpb+I0rjRgM/Alg7fwJzDr6AA+tO9xaGZ3JvpnyKergl+fg+o3fgEZqgw0PE8fdpmql387GiBa89e2Q9mX+QjXJsu/wB+CDXcTNftMOCntG8M/5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k4Bd/iTrF5FdoGMbFoCGvVlHxXdyf86xmjhgiBjN+fk=;
 b=Hcwd4pZncQxAST0YQLUQwVQ9KGwtsWtxvZt9uh75ZrcI7C5DQ6pb2Mkx+ozbf+avqEg9xMl5TllLpLupvjwzCklb3q4xZ6W2PUhUrSYMHjHqy8sE87KyFwH701YpAwD8SNJrCkQebvjukpV7RYacDKsB+tyyfstnfnP8vbUpKfL3M6sLG7Rie9k9V+IXFnpdd3zmTW6iHoEHVTsXrNUaM0u5rbV9kqGxDW0rJbiw52v+Y80OY0nG86d7NyU24r9vPVAygZeAHJM3yKIW48LNp+5MFBYZIRcOxwZd4sd8Q1e6Qzjxijw3mcdKjtE11S0wQpJqb/SMteH8JWFLA0398A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k4Bd/iTrF5FdoGMbFoCGvVlHxXdyf86xmjhgiBjN+fk=;
 b=bcsCcH8dOCx5GtX2OWKXzjP/SKoRJ8/QNQZERRZpEGApif/kYxJ8esjj8eQS8HDKBONvA6Rhu+4cwwv75mh9W7xXhajA6bubfimmy3uwutNbMkbxI6ojMObRX53lzQ3lu5koy6PGrVN0aXFKlEOPudfl6fCx7+0Bpd40tNXK6gA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GV1PR04MB10079.eurprd04.prod.outlook.com (2603:10a6:150:1ab::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 08:46:27 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 08:46:27 +0000
Message-ID: <271c9642-3de7-48fe-a3f8-27cfc6c2eb52@cherry.de>
Date: Thu, 9 Oct 2025 10:46:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 2/2] tools/build-docs-container: remove obsolete
 comments
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251009-build-docs-container-essentials-v2-0-f135032bb43d@bootlin.com>
 <20251009-build-docs-container-essentials-v2-2-f135032bb43d@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251009-build-docs-container-essentials-v2-2-f135032bb43d@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0150.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::19) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GV1PR04MB10079:EE_
X-MS-Office365-Filtering-Correlation-Id: 63637c24-2533-4005-3000-08de07105578
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?S0Z0U2NlWDFucDl5UkVycEUrSGV4S045WUpscDI5ZEdoejg4Y0hmd2hERDB3?=
 =?utf-8?B?aGNVVG0xRTJvTXExaHZJZEtmcWxyNDg2NmJnQTk1cU83TWd1dldreGFITFZJ?=
 =?utf-8?B?TllNOWdIaHFoSUNxbWZ6eGJBWDh0TkNIazdMRFFFYUdiSXZnVW90L3NqRUdQ?=
 =?utf-8?B?aDRld3I5dUdTamRpbHRtTDdFRURnN3FPcXdVaWRUcEVIdkxsa1UyTXYyRHRR?=
 =?utf-8?B?L3RhRmp5a1M4RFBoazVQMS9aeWlUYzdFczRPOHdsTC9HU2RGTlBpdWJBY0NG?=
 =?utf-8?B?OFp4cmNPM0RtandJSnVrS3hScEtQN20rN1d6ZG93TVNWRUU2QVRiQXJBNHFl?=
 =?utf-8?B?RjB5Qk41NlJ3Z3JkK29qTFRSZStwaVFqVU9tWE9vaW8zd3FoRVprWkRhb1J0?=
 =?utf-8?B?c3pycDJkWjJoUGlpam41Z0x4MGRaR0NFVUdLcUt5NGoxcWxXUkhOOFpkdkU5?=
 =?utf-8?B?NVFVcTVSRWRVb0lkcjdyYUp3NzlCRnFIQS9LODR2d29JSzJOd2RrR0pjRll1?=
 =?utf-8?B?SDZSeEFmb3hUY0RaU0xpUDVKQmlwNHgzVkdKdERuQU4xM3V5dE1xblZxOUNo?=
 =?utf-8?B?VkkwVnFjTyttbUkyQmhEVENBUkQycm5pV0FjOCthMVVOcXVXTXl6MitobE9T?=
 =?utf-8?B?L0xRUEVYWGhIcTlNaExEYVdIUjNpZ0ljckJvTmVkYWI4WXBCR2hHbkRWR2Ns?=
 =?utf-8?B?akMrR2JrekVDUloxU2NnUTdQdnM0c2pKaHY0SUVrb1hnR1JiNmxqckdqRzYx?=
 =?utf-8?B?TS9ybTJ1WndhRWZ5NEJ4T0VUdU95QUNrSzIyRFR5QkR6d0RzTVpKdFJveUZS?=
 =?utf-8?B?NmlWa0drNGZHY2hiNHhzOG9lQ2srZ2hCa29pMjBwOTNmQ0g5bGVEQzBndVdj?=
 =?utf-8?B?MmJTTlErSkpHeGtBVy8xK1RJcm5WYTQ0di8zQ2pCQ0xveEQyZDZYa2VCT2p1?=
 =?utf-8?B?b1VBSU42TGl1Q1hlTGZOLzVmaHhSbVF6UEpqZ3NEWVU0SUN1WXVObWNpYmhn?=
 =?utf-8?B?YjJDdHIyUzBJTGVTT01vNXM2UUVrd00rYjhNNnNWeVQ2V3BzTmNJa3FHN2dJ?=
 =?utf-8?B?SU1XaTRTeWRzWHdRdzRtb3BvVGdRYmE5SCtyeDdkRWJ3TGxld3dpWC9IVm1S?=
 =?utf-8?B?UnJ2b045UWIzNVM0ZCtlZWZCeGIrZnRXdDI3RVlEa1pJNXZkNlVnNnQ3VmU0?=
 =?utf-8?B?Z3V6M0plUEhSaGdNTVlXcXVuU3hHQWVxZTZ3ME8veFBQQnVRRnZrbk1WdlZZ?=
 =?utf-8?B?aUU1Z3pGOTc2TGlKcHNzZ0NSSzJuZmlpZ0l5TXNUaEhiak9PRVpVZm82ZGIw?=
 =?utf-8?B?amZqeXVRZmh6T1FnNm5jNDZ4a1IwTzltRllzMlZWS3JiQ0pBU3hmTFh0YnpR?=
 =?utf-8?B?dC82SGlDa3VzQmp5ZWFkZDZ6c0pVL0drM0xaWTRWd1VkcnFxNWFpeXd0MC9Y?=
 =?utf-8?B?VjY4eFU1OGpBWEhZVnVBaGlTek9PQjdST1psYzhCZ0ZsaC9RWENkYy9JbjUr?=
 =?utf-8?B?VTR0RFVHczIvQmJZTDU1dmpXQWxteitpWXRNWHhNd2E3aytqL0k5dmdqeDhD?=
 =?utf-8?B?Z1p0bm94NVM1SllyZk1hVXk3b3pjNnE5eENqTEZXYjkzbmNyM1BJSHgxV2lr?=
 =?utf-8?B?M05XclRBOUZwTHI5aU9jQUVpYWMzVzN3RjVlaEswNWhlRC9mYjJFWjU4dDI4?=
 =?utf-8?B?dUloYnVkejlDeDcxd1g1c1dsWHU5QWRRMWc5QW5vQjAyemFTOUdvS2xVMFNB?=
 =?utf-8?B?N1lWMU5yTTNqUVFmSmttcC9HdlRHK05QYVhFa0RHbzFtWDFqV09pcGZleTRs?=
 =?utf-8?B?dFpPSXBVUWlEbTJmWkhRUWxwRTJ2OEZJcFQ1cWZ5YXZTaEVWUDR1OFdJRGJO?=
 =?utf-8?B?U21kclZXYkg4Vy9memU0K1pjQnV4bHhyZ3NqN05rLzFHS1djYVJEUWNlQW1X?=
 =?utf-8?Q?RFZ8bYo7FSy2BoT3BOCOGWljcUEa6xYq?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RDdUTVorcFVXNjMzd29Fc3pDTU5wQ0NwQXpMK3pNdXNaQ0R4QWF1SnpVZWV5?=
 =?utf-8?B?eHBoVXVnenQ0N1p0UHFvVkdqTy91QTYrT1ZMWmt6allkTHlNM25BZmJ3elln?=
 =?utf-8?B?OEFjYnhZNkZqT05UbzA4Q0RDS0N4eSt2QWIyVCtnUE5xaWNyOUFGcjIwY1li?=
 =?utf-8?B?aXNkSE0xRGpScUtpWWJXeHp6VDB3bUUyNC9BTU9lVWcxUzA3RCtKMkR6VWJt?=
 =?utf-8?B?S3VsZjFXbHc5TzMzTlBUaEFYWGFZTFhpaGhyZFY4R3lhMnVoM0FPVGkveUZz?=
 =?utf-8?B?ZXFnRkk3Qyt4VVRHR2hXckUyM2ljQTA0Q1UrOWp3R1FSREN2cGk0Rk1XL1ha?=
 =?utf-8?B?NkEwRmJqMTNGcU9rcEQ4cVJHRFlsTWRpamh1aHlEbGI1amtVSG9UNHFMVzNP?=
 =?utf-8?B?TkpKVC9ickRnS1pDcUptTS9TKy92SXV4TkZoQ0NEQnJDbEVjQjNXZkdkaHNB?=
 =?utf-8?B?b2wxbWhFZXhpQVdYK1lTWTk4WGlBRGl5ODBqcWsvSGZkU0pYY3RjWm55cnNW?=
 =?utf-8?B?eHlGN3paQTJWNmgvaGJZekNjZzJSTjFQdWFjUzFLYUZPdGkwb2plaXdaYVBX?=
 =?utf-8?B?NXJYZ2NWTTV3RUFXOWc5NlJuVlREcUtYbzlBcG9rU21lUGpQZWVsZEViUFRl?=
 =?utf-8?B?NUMvTndiNEZhL3ZaZWx5djZLOVM3akRobGlvdXgwWDY2cXcxTXZFQk13TzBZ?=
 =?utf-8?B?aWZwZHhaTHkzM3QzZDhwSWsyejRNRXRpS0pMajd4UVRwOWo4M1NQNXFHWHpi?=
 =?utf-8?B?NXJCTjhLQ2Z1b3NrK2RIdC9aR0xoNjM2SnNCb3UyZ3RSWGNrUEU1OUM0MFRJ?=
 =?utf-8?B?T3pEc1VTYXZjMEFRRmJTcnhoUC9SMHg4TnRYRWxJL2Q1MHhFK21LVHZrNGE2?=
 =?utf-8?B?bml2RWkrWjNGWVBxQ05tWmpsWFVxbG5HT0RxMlB0cjI4ZlhmdnZlVDJFOERw?=
 =?utf-8?B?TmNkUjJNak95U2xZc0pqaVZ6THJ6TlE4S3kwNU9rWUJ1VmdFT0ZlK1JMSEFy?=
 =?utf-8?B?K0tDcGd6QlgwNWpoQjhSZTlSTDdvR0x3Y2NJcHd3bmcxSzdaSWpFS2x3ZnQ0?=
 =?utf-8?B?bWZmKzRDWm5GTm9yZU9NWUF0ZElWQUdDa2MvU0xEb3oyTFk0bWtmRW9rWGRl?=
 =?utf-8?B?bTFMVTB4cE5paW9rYWJrVFFZWWphWWpyd2FSOWdRdEp4MU8vbXlmNktCdno4?=
 =?utf-8?B?MkVTNHluaWh6ZjNSV1VJT2dKMFBvOEszU1A2d2dQbVQrRTlZUUl5eWhhY05G?=
 =?utf-8?B?SFcycEk0QkNyaTJQYWdRZGlLcy9YZEtGRFRTckp2cEJiM3BSUGZyZWoyYWxZ?=
 =?utf-8?B?YTY1T3ExWjNhVy92dDQvWi92b0F2c0tzZ3pFbGhUUVBtTnc3bEhnam1LQ29G?=
 =?utf-8?B?c1NJbjl3WlNIQTkydGlQL25Pb1BpMGRYckdMQ1FLTk9MMzBBalMyTTlxbWMr?=
 =?utf-8?B?NDBWQ0g3RW5sZi9LTS9xVGNuYUpyLzlROFl0QVpmYkZTYlBxMVRHNHhaZ3BE?=
 =?utf-8?B?bE9Td0hkUGRvOWlpY2xIK0Vydkhoa0xXaTMrTjBlSEYyeVZOWlpsTjkrUVNB?=
 =?utf-8?B?MkRzZ242ejJnZlg1aG0zNGNhU1BWSU5MMFA3NEx5cUIwTHU4MUVhL2Z1b3Zq?=
 =?utf-8?B?enN1SzRtazZSUXBWZDRvRkxCRlR0eFFuanlaL0F3alVRT0M4VjAvaDZadHlx?=
 =?utf-8?B?UEpIOThqdlpSK3NrWGl6NEMvNEJsVjlPZGwwVXJKc1RrU3FxSG1DQ00rSy91?=
 =?utf-8?B?SlNDcUVMY2dDc2pWZFIyNU4vZ3dBWG1pajhsQzRpVE1ZNURYbFg5c2JaaGNF?=
 =?utf-8?B?R0RObFZrV1lBbkJkU3Z4MW45eG85ZkxuVEJzQm11Z05FZ1p4cnRPOVMrSHMy?=
 =?utf-8?B?eVpsSkI1Y1prai93ZCtGNlVVRjNrWVZWOHNtSTRkajEyNVA5WHZka0xqSzJ5?=
 =?utf-8?B?VVltYVR4OXQ3dUxzYm9acjVPRlhPOHBLbitsbkVUWkxkUjZGUis4UE5hZjV2?=
 =?utf-8?B?Y3BabDFuNC9zNjdpYUJ0UTN1cVdXNXlKN2c2R3QwNnlWbEYrbzlRVm0xVDNJ?=
 =?utf-8?B?T3ZZMmpZUWYyK3dMMjhNT28rdTR2bEtMcVVyTHhnZVJqeE81bmhXL0xUZUwr?=
 =?utf-8?B?RGdVcy82cGNxczJSSDZGalluSVhUTG13NG5GRC9rWmtERmRkWU9VNUxjNEk4?=
 =?utf-8?B?OWc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 63637c24-2533-4005-3000-08de07105578
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 08:46:27.1577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 10+J3gmmjXL6lVrNW1B8LUGSqNQJTWH9ze1jfha7DHJFSLPSgloGBpgYtD6yll3QrpNYizCkndb7o/Avat0nQA3oIvcVf+ARLTUYX/kit9A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10079
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 09 Oct 2025 08:46:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7669

Hi Antonin,

On 10/9/25 9:26 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Leap 15.6 worked fine on my local builds, with Docker or Podman.
> Ubuntu 23.04 got removed from the list of distros we test.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Tested-by: Quentin Schulz <quentin.schulz@cherry.de>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

