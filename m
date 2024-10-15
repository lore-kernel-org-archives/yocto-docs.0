Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64CEECFC28C
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 11:27:10 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.53])
 by mx.groups.io with SMTP id smtpd.web11.10958.1728991621084566095
 for <docs@lists.yoctoproject.org>;
 Tue, 15 Oct 2024 04:27:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=CcV/mpl+;
 spf=pass (domain: cherry.de, ip: 40.107.247.53, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fD3z8NlBg486D4/TuuPcs27YX+K4gL1TN+XnArBp0paBQhUOl0jJsKFcMy8LUOPpybz1wfPNU4VOHHqjBGTgjNHPypj2IBjYo1EneSKI6h+yFVvac8msGfSDT3fdbrVtiTwcsywQzgjbPEGOVZwHYp0RiB6gK48UbIPYhYtd7v6AuUW/IQfwoYzwejiwqBpTeIOLx2XY1sLY0FJMh72ptZz3F3z+z7EFsjqekv49LUaSz+E/6ftqW3BCU/lf00V6R2/h7D45EhgOPpGifbE1XjOqd2+tLoGoZoPV885jV0cOJlbpYE5KwUrGXVN8i5atGw3MyoisE48cC9y0gNEaJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHaM3uexh4oTo18arxIEUwZYuBvXutigIkyeDr/y7s8=;
 b=riOvpc8XY0tRcN4U7BUpoanEgEp/RzS2eLl+aEEA8BxhtN6AYUUrMVglI1gEsdLkPW96fTngYdAtM4SsOZyWLJE7pQUQigRu5tPhv2FubyY2x+RjMXhR9EIicbRTcAE/VlVg/Cxwck2lRhVzedWliGxl9UgiiZYxpI8wxP3O8ags2jdrycJwily8NLfCz3DocngtRYN+mdYBBCYkYvkmC4YG/OJP6LLrYrkFm6r2TIgcJcOcbVV9iBlS+56+PT6cNNaMK4dhGb7EDhstGLo92ciy2XQNfqKb3NMIIDHSYQtjShRO6Ozbhd3Gw1pxwZJISI0Gt0V1q+aW0yh/GQPEAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xHaM3uexh4oTo18arxIEUwZYuBvXutigIkyeDr/y7s8=;
 b=CcV/mpl+ATFPkV1k1hVeAgSqeVbbB/ev9TSJX29GTFueXiW/M3jqbS65qZX+jI2YXfTWKg46O33m/ZskBfuQAmqmFxyDtcyy478aeGOrEtjMYwSsMAex4OW3l+OG8vcltvkfZCBBIMVr4CUNKiHSZa1jyoQeUcqRf5y9uirqpIs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI2PR04MB10545.eurprd04.prod.outlook.com (2603:10a6:800:270::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Tue, 15 Oct
 2024 11:26:56 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 11:26:56 +0000
Message-ID: <413ab88f-509a-47c9-8b94-171679206dd7@cherry.de>
Date: Tue, 15 Oct 2024 13:26:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ref-manual: fix ordering of insane checks list
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241014-insane-ordering-v1-1-0b51976580ba@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241014-insane-ordering-v1-1-0b51976580ba@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::15) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI2PR04MB10545:EE_
X-MS-Office365-Filtering-Correlation-Id: 55e360e7-e3af-4e0c-5f53-08dced0c46b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?V2w4emRHWDh1UU0zV0QySE4waFJya2tXWEo2clZxUW85SzFZdXZncjlFcFlD?=
 =?utf-8?B?YUxDc0ttZ0dORFBnSFpIcTY3V21TaVhuZ0Nycmc2bU9FZkV4MGhqRVpzRmFL?=
 =?utf-8?B?VkJBZlpRMGloZGpwYldQQ1FFTDRvYXlvSTdocTM0MTRYQnQ0UHNBdGNyTGh1?=
 =?utf-8?B?bCtwaGpQbUJOV0ZMQkJ3SHFHd2tTTnRTL29qa0xVc3lRZ1p0aGZsTnBSSHJm?=
 =?utf-8?B?MVYwNG5FNjR3bU43VDJFQzBHY1k4M0c3QXJ6WHNyTTlGMXJBbVZOeVdsRkVO?=
 =?utf-8?B?S3dMWW1qdk5GNzVoTnRXVTlUQVlGWkpCRFVGT2xrQUJTVTQxOUppTkVXUXVo?=
 =?utf-8?B?eUVzYi9nZlc3Zk9ldUdobVNsRW9xZUc2dnJxWlptaXdLcmFIZHlsTUMzY00w?=
 =?utf-8?B?Y3ZtUDJpL2syd0Rqd3dKbnpxTXhnRXQvcGRyM1B0bDhtTmJtMHQyS1N2MmI4?=
 =?utf-8?B?S2g0empCVXpyWkVIMmh4d1ZpY0VNeVZLc0xTRTFSVG5DQ0FSeVdsTXM4aHFi?=
 =?utf-8?B?dnRURWVBVWhzOVhXdVNrdmNJK1l1QUc3NWdpTlNMMjFGOFRUWXB4VVhBeWlx?=
 =?utf-8?B?dzhoVk1DR3FWTkNNaTZhdmVYZXdGRVY4eDVSeWFlMzVqVDZnUmprQ3RRYWdC?=
 =?utf-8?B?VzhvSytVMFJaTmJMM2NhaFVoVVhMYjVzTmIreGtTejVmRitROUVXY2xnem9Q?=
 =?utf-8?B?RnYxZlViUjZTV0hWU09SUTMyYWtueGdycVB5WjNRZTJWVk1kbXMwWkl5Q2Fr?=
 =?utf-8?B?cjFadlhNeVlaUDZUMUZQaTFmbUZtc3NSekdmbU4vTlFTUGlJYzFkRFpHVXJO?=
 =?utf-8?B?cGJnSS9sVEJxcWFpYTZITjhLSjMzTC9qWTlNOWVLMEl0WXpGU1MyYmdyTlBr?=
 =?utf-8?B?c0VVWExKbHdYdFd6RDBRMXIrVUo4bmVWWTUwL1pxcC92MGtpdjNDY2dSWmxX?=
 =?utf-8?B?OTlyWTBFNXVtdzI3Ty90UkZiRUJzbEhReFNua2huNHZFbzJYU0Y0VDE1SHFn?=
 =?utf-8?B?NjNSeHhPR296WERtN0dOMlJCU2xpZ0dRWWNvOTdjL2UxenYwRWlkSFNjVVov?=
 =?utf-8?B?aHd5OFJrRTJHN0d4VThpbWh4eXhXdm1CK0JyRXUwVlZMOWk3RTZpTFU4UGJ0?=
 =?utf-8?B?VWdMWEg3SWh6em9rMWRPNTJZbzJpZXlzN2pBSG9rdkk4TG4vVnZQLzdJcXFX?=
 =?utf-8?B?Tm1LRjBsYWlnRE54MUpzYjR5VXE4OGdZYytxb2lqQkZZSnNkd3praHdkTVNa?=
 =?utf-8?B?Q0IrNGZiYjU2UXV0Mk03NVAvMjVQQUNybjd6clI0UHFQeGsrR0h0REsrVXg1?=
 =?utf-8?B?NTd2Tms0WDdJK3ZHcmpBZG9yenZTdldvQWx3ejV2ZUxNNVVUZ1YxUCtTWXla?=
 =?utf-8?B?OEFtYUZORHNzcHpQeHRDUjVlNCtvZVpRa29Jd0VmTS81bWRUdS9CVVIySHU1?=
 =?utf-8?B?dy9kd0xSWEdoOEEvQW5TbEVCdXRqOE9LdThlWWQrV21OTHZsQ005elVtSG9X?=
 =?utf-8?B?bUhrRUszbVpWeWtLQVc2UHNvUkRwenE3WFZCcTFFY0xzb0FldzVaZFhlaUs2?=
 =?utf-8?B?akhmQmNvTE1rSVlEUVRUTktmN1IrUGV3eTU5ekNCelloYUJyeGFwNTFyeXBx?=
 =?utf-8?B?RDhyYyttU1hvR09IZnVrQ3NETzBCS0R0YkZjZGhCVkxHSW9DZHQ1RWJOR1F5?=
 =?utf-8?B?MVZOL2ozSXNwcWw4YTBHN05CaFlRaytnMTM3OHJtWkRKdXFWTnowaCtRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZDArRTZqNUtyQk4rSmhsRlVaY3N5U2tRV2dZZTZYZktXWFdBVUt6OGR4ZEdS?=
 =?utf-8?B?ZFlzNHdGUGhkM2JLVkh1ZU1hLzhkT1FRUzhXanhycHRQUTN1V1VMcHVIR3dx?=
 =?utf-8?B?UElnZkJabVNOWGo0VDBuMWdQd3h2Wk5LVjB3YlhUY1M4Q2pFWDg4R0l1VEZk?=
 =?utf-8?B?Ynk1MU54NUFZVlhiNHpSWlRTU2JPdmxJN0NKNDd3aG5mY2ozWXp3NmYvalpL?=
 =?utf-8?B?b3pnY3R4Wm5QSExMSEV2K3UxNTE2Sk1uQkV6ZURubE1EUEJXVnIyemlBaThK?=
 =?utf-8?B?M3lnRnhKK05FNnViYkpyUVZ3d3hLK0hhb1RuTWRzMXNwT21xb0NSRGorelMv?=
 =?utf-8?B?OWlOaGhCcHdTSS9EZnU5UFpPdjdNcE42TkJoRlhLVnR6Ni9Va2l5aTg4NHFs?=
 =?utf-8?B?YTJnMkE3Qy9oWVE3UXRGN2NhOTdOQURuMXVEcHZIODBOYjN1V1NXK0szVVBp?=
 =?utf-8?B?TjZUMW8xZXFhd0RMRU93cnFGR3ZOTDIrOXgwNkJ1YU1wcWZkTzFSVTFXL1Ns?=
 =?utf-8?B?Vnp1RHFkT2tlOVk4dW84YWNuc2hsWFd5S2dQcXNEZGJ0TUhGbjRlbm11R3B0?=
 =?utf-8?B?SHNPUGhkNU1HMTV2dEhTNU9Pdm85TWhuRmFsZ01VS01XcUVVaFhBVVI3SnpS?=
 =?utf-8?B?UXNFam1sZWQ0Ukx5VC81eWxMYUN4Mmd3b1BJU3hhV0U4SzZrWWNHbjdIYUxl?=
 =?utf-8?B?bmkxT3VHYVcwNTVPT2EyRmFsU20vZlBXYmw4bGRyK1ZaeWV2RmZqTU1DU0Iz?=
 =?utf-8?B?SmZlTE9ObDFITzg0L0cwb2VJcks0TCtkWlBQTi80ajFiMGlzc3FWTE4zM1h4?=
 =?utf-8?B?TjlPOGhxMHRXeHlKYW45b0lWZ1ZtcTFSRXBYQlptTjhucmVtT0gyaUxhc0NU?=
 =?utf-8?B?NGo4UloyQ0ltQlJmNGcwZWo0Y05DNjJqU3dqRmxCUytFQlpHeVBreHQ0aEZQ?=
 =?utf-8?B?M1JLMEdEUk15UnBpZVBUWksxR1Y0T0lHY1hoKzRPbEEyZ2lGVkp1akN1RVZJ?=
 =?utf-8?B?N3A5U3lzV1pmaWlXU2lMa0ttWTBwZUZ5b251WUY0SEhIVjB3bkE5ZlZuMm00?=
 =?utf-8?B?VUNkLzFLQlJIbGl1OEExQXNFa0VvbjlVaW5GQVJES1lsSHNDdlpKditoV1J3?=
 =?utf-8?B?K2NRaXhqL0xOMG1uZ2FQbzRrOUZ4NUlaQUJyeDJScEhLcEtZTnlORmR2b0FT?=
 =?utf-8?B?UldVdjhNbXNhYUZjV0pFRmdvSmtmcEZlQnhuYlAxWVRubHlvMGt6Zmk2OGV3?=
 =?utf-8?B?N0M0SjgzV054N0g2M3NhMmNvLy9PNmVEUm1HWDBwMXd0RmJKOFh5dytGOUZM?=
 =?utf-8?B?eVRzY0ppOXF0VkM1MFl6ekc0SzJPT25NQmhNT3pNck5pODB0eDRiZkVxR0pT?=
 =?utf-8?B?NXhwdGhLNWZybmRZTzFiZGVscEtJbGtPRjJMOVRCWGRyNkRhWUZjOUEyNjcz?=
 =?utf-8?B?dkxpUXpNMVpmL0ZlLzVTZFY3U3FtWEV1cTRWcTFpYVhjeDNxWU8ycjZzZktG?=
 =?utf-8?B?Wk5IemVJVjlPZEl2YnBxZGZNR252dTQwWFlkTVVHUnFJTW1ITmNXdjJPaGhK?=
 =?utf-8?B?VEdkQlRqT1BqYkpHVGNHc09SMzZnTGRyYTdHUEx1UTFlcGVXZjhDajRVY0Uz?=
 =?utf-8?B?SVFIV3hGN1RCRk9RellQalBpcnhVK0lNR2lYbE9yNVhkNkppSjFUMlNuMWp4?=
 =?utf-8?B?WWljeG0vRFJCSkNqamRYT0lsT25LSUFXSEJMUzhkOTFjbUJvTkowMzArQ2wv?=
 =?utf-8?B?VUEvRit3MEtncG5qeUhpbkdtQVl2ZkVyQk1xeWtEQWNEeGZqSFcwWkxkVzhI?=
 =?utf-8?B?MGdQQXZneVlOOEhES2JmSDNyWTF0emxiMzdIdk05TmtVcm8zVUxGanVQQ0Fv?=
 =?utf-8?B?NlR5M0JoVDFuQzM4ajJUMXFJYmNMeU83T0RheE4xWlV0ZDJxZXpMK3g1b3dX?=
 =?utf-8?B?WXhndjVqMW5DY3BVeW9ZRmcyaXZ3Mmp3bFVOYmViNnRPSElOQnNwK2lNOEhB?=
 =?utf-8?B?ZXVzUndGMktCbm9YTlU4WFJMYlo2TUxVRUlTaEh5aW5DZzBoQ3JwenhUT0Rr?=
 =?utf-8?B?RkZTOHBoZmcvcjFOTGRHZndZWG9vMnE1OHc4MHhnMVBOTG5VUDJxMWVHWXEx?=
 =?utf-8?B?NEVnY2FQZkZYNExyNm1XcWxsRlU5YmpSNHEzak5BdDNOMlQrYWw2eHlKMmxB?=
 =?utf-8?B?M2c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 55e360e7-e3af-4e0c-5f53-08dced0c46b5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 11:26:56.2348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5CNPlqGMh62D9Pw1wPavdcvjvYF1+SVVgW9G0/+5PHXhwRE6naQeVK3P1wYz1qpEDhC71axauHx4tt73wQQGGvjl8XpR+DEtWP+Jbursvxc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10545
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 15 Oct 2024 11:27:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5489

Hi Antonin,

On 10/14/24 4:11 PM, Antonin Godard wrote:
> It should be before "perllocalpod" and after "patch-status".
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> Reported-by: Quentin Schulz <quentin.schulz@cherry.de>

Looks good to me, though not all items in the list are alphabetically 
sorted, still :)

configure-gettext and staticdev are not in their right place, the rest 
looks fine I think.

But progress being made, so:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

