Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD429C02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 16:56:27 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.32])
 by mx.groups.io with SMTP id smtpd.web11.22477.1736787382882887531
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Jan 2025 08:56:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=UTquW17U;
 spf=pass (domain: cherry.de, ip: 40.107.159.32, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s45iMy661rMJ7j7WKv5kHuitStV0vcGszvjwxOup7XacFYCHRfxXyYDU5tKDq5BrXIcWkq64roWXECaJXCHte9llxv4WGMT+fQ/4FfFgeQfUqB+l/+rr+9a9EuwljX1HUrymzPPmwQjdURBAu3ImUwJW3FhyOmQSx+5mH0OW914iJ7U9E1UjHYoTIdwjZ5oGo8pjNaBzlnAvwAD1ij5xy9CHUgQoA3Klgqq4LDdr6d4iNVB0cPxeyAull0NHvg0Rj+AfFBlYYCqt4HNDDCzK0e3QzXGHJlw6okJUoYWRI/KLPf2GSNV8legjyjLdFV13BWoRsrVnEa8CbgjaFM1v4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uMbG/Cqhi3aD+QDZeybVXuu8VMdLoSGgW45280Ue9ro=;
 b=A5EXfT8ED9H1r/BNC7mSoa9aS2DMjGbl1OqOlksjMy8Dl6e6j5Ag5+N2OaOXtc9qpAXOQ4jJ8BFCHVnVzZjqBIXrDpCQGL76a6gUtvPhWKsNrCgW8DdeYZ7+wRSatd9gqGmqcw42mmymzWAeNloutLes6QdE3rfqqwWHl99gXi5L8bKEhf5ZPF3S1nsRO3BIY3RXbfpzTcgPbxvVofLyne+ezdRJJ/aatSLkDJAE9TGKiAcIn9rOSfudhKulMgL/MUAVLii/5IHixu3MAOPajfmBoFdEx5vgDKUFh2lnb2qx1WJIgP6QGrqWXQp5Le2jMvmUjkLKRKb3ibdJUP6/Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uMbG/Cqhi3aD+QDZeybVXuu8VMdLoSGgW45280Ue9ro=;
 b=UTquW17UFzbSZiliUyBNRfcSciAqUQcP0a+YrUg2++bekqzKGdiZtFOeFjHgkm2g+j/gGEEUn9AGe3aqog+7CzHUGIMzengL6MTE2NQTYraE/62WvjIS64VXUFaxC4XRvtWRUtb4rdrCnuHtCm2b9NAeCBtVn462HPip3KCOyB4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DUZPR04MB9917.eurprd04.prod.outlook.com (2603:10a6:10:4d8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 16:56:19 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8335.015; Mon, 13 Jan 2025
 16:56:19 +0000
Message-ID: <0ff0c424-26d8-4fa5-8b87-fdc43f61533d@cherry.de>
Date: Mon, 13 Jan 2025 17:56:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 1/2] ref-manual/packages: move ptest section to
 the test-manual
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Yoann Congal <yoann.congal@smile.fr>
References: <20241226-move-ptest-to-test-manual-v2-0-227db1b045a2@bootlin.com>
 <20241226-move-ptest-to-test-manual-v2-1-227db1b045a2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241226-move-ptest-to-test-manual-v2-1-227db1b045a2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR03CA0048.eurprd03.prod.outlook.com
 (2603:10a6:803:118::37) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DUZPR04MB9917:EE_
X-MS-Office365-Filtering-Correlation-Id: fc1b25db-9308-4443-dc1e-08dd33f3337f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bHVZSXdLVFB5MnJjcno0c3NCazdSV0V1N0lFUys2QUJTTkt4NGVmQUNvQW1m?=
 =?utf-8?B?WTdzTVJlV2VHb0ZnQjYzaGs4eDJOTUdES0Y1Qng3eTVid2laTWJRdHl6RmxI?=
 =?utf-8?B?YmEvNnh5M2hsaGl3UzlCTWxLQzFGem1Vck5Ccno4Rzkxc2ppTjlTMHZIUU9B?=
 =?utf-8?B?VGRmZzdzeS9mOEJVdWRsZHpvK3VlUFFDVll3bGtyNzFma0h6Y2lMSFRic2o5?=
 =?utf-8?B?aUZHUytlNnRrc1F6aDBuV0Raei9INHZja0dVVWphZE0ra0d2VDVEQVltd1h5?=
 =?utf-8?B?YzZKNmgwYURSVnR6UXE1M1NQRTF5SHdTOStYVHFwc0oxd3JRK0tMSHU2ckN5?=
 =?utf-8?B?ZUtENitIK3dzaWhpcGNzQmdqQTYrMnlXcFJzUTl4c1gvVUN0bUVjR3VRTVA3?=
 =?utf-8?B?YU9tRmRWYW8xT0dNNlZLaisvN2pXTi91TkNYYmpwV1l6Q0RSSHJLN1FJY1d2?=
 =?utf-8?B?OFlTMkxzOHRTbHYyRlliMmwvRnE4V0N6VVhpd3NVOWQvanVvUm1WU09Jc3Uw?=
 =?utf-8?B?NURLTndyWkQ2VkpqbGRkbDdXZGhwcEQybEwyWjhabElGL2lSd2VaeUtKYWtx?=
 =?utf-8?B?VTN4djQ0ZEFPU0taSkpjMWRWV3JEeVpzT29JU3lFQlcxcXBndkpJL3VnYXZS?=
 =?utf-8?B?aml3UXlESXZod1FSWnlDcWxUOVd5aFBqTmVsZERJNXdsN2JzdWFsT2lnQ3RB?=
 =?utf-8?B?Wk9LQml1am9zaDJ0eXBzV1B6VE1VZjc2M0FmaDNGWndOa1ZxS05DZTdYTHBv?=
 =?utf-8?B?ZFlFekJjK29tWjZuNWR2dXpaeGZyT3RDSnErV2dJUm9HcU1pakhJRnhtby9z?=
 =?utf-8?B?TkpOemdJV1BNM1BBMVpGZDlsS0JXT3Z6UWZYeXpjTnJrZC93NFl6R0F0eVRE?=
 =?utf-8?B?a0xjR2hYSFd1Y3pQSmVpWFl6U2RSdWhXVUV3TUtPQUNFYW15YW0vVXNLV0Ew?=
 =?utf-8?B?cDdSRUV0RXBPektzT0ZQNEh6OXhDUi9EUEZHNkU0cTF5QlZuVDgzcmJaT1V2?=
 =?utf-8?B?K25vNnprK1phWFRkckZhVUprUDZXV29sMHBWVytoNmtCTDF4R3ZxRE1jVmVK?=
 =?utf-8?B?eGlNa3p2Y010L2JlaTV1ZkdoMzMzVk44YnUvNk9Ka29NZHNBb0VJVWVmT1hk?=
 =?utf-8?B?V2d3RUZlZ1FFRDNxcnVYTGtkTTJSUFlmWGdzaWRvWkwwTXpCVGNDVUUyNHlS?=
 =?utf-8?B?czIxVk9acWVocTlFSGs4bm9SNFVFZVJZdGlGY2V6UWN0a0huZHhZSTRsZ3lv?=
 =?utf-8?B?bU5ac0VVTlRTY2x0V3ZzNlVTU1R4M05NMFhRYjVmc3lMQkd5c25SY0RJR3Rp?=
 =?utf-8?B?WnI1Z2tYcUlsRFlpQWhaY1gwOXh5MnRsbUNjSCthQ1ViVWdFS1FBaXhyL1R6?=
 =?utf-8?B?T2lZY2YyaW1Ha0VmTFlWWDJwaTFxREFLMzJrL1hmbzgrWkRWZVdPMnRQV3ll?=
 =?utf-8?B?TE1JRzNXWFptN1JKeEFKTWxPQTM1N2NtZDc3TVJBWXZEL21hSVRyNGVwNUVN?=
 =?utf-8?B?ZFFBMUN4b3dzdk9INm5FZ3BvYnhHb0hGL3AvcEdTNWNQWWQrUFVEOXFOdzFV?=
 =?utf-8?B?aGdPMWVpQlM3OHIwUC92L1FsdlNoMjBid3RwNEV2VlVkZUgwckV6dXVwSEtI?=
 =?utf-8?B?RkJJbDVYa3RpZUZBMy9vZVg1V0ZSTDJkWjdWdWVrUHdaaWpsUHMrcU54UkxW?=
 =?utf-8?B?dTN4UFMyZ2hRRjIyK1ZTYjZxN3Nzam1uSWRyemtFbGZrT3ZjZkMzT3dvSFov?=
 =?utf-8?B?M2VTWDlZUTdsY3dmbzZWaUEvUFN3VFlVKzVaMjBnMGJSSjJQN2lGN2JVZ2Ux?=
 =?utf-8?B?Q1RyZkZQYzZxNnJCbThWa2ZQeHJXY0pKNllxdmMraElveGpKZXRRaU83Q0kz?=
 =?utf-8?Q?NZPN0d6TqSF+K?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b2VpWUJNU0VEWnhuZWZjckNyaVZpdTVhSFRlZ1hvT3g1aXNQVTBwSk52VEpm?=
 =?utf-8?B?RS9ESzVkSktWR29CRnlDYmpoM2ZybnNlZ3Jmb255eHRERGxEYlBHdmJDWW4r?=
 =?utf-8?B?REZBRkh3TncrY05vQWU3aEw4Y2pjTjVoNTdNSnRha1J0UXl5WkxrbmVkczRh?=
 =?utf-8?B?dGRscHdOczFwK3U4ZitFRkVMY1VGZVN0Q01pS05WeWJBS1A4OWpTVHgrQzN2?=
 =?utf-8?B?YjFXQThkZkRHYmVUMDBsdmMxQThSQ2lyUkFZZVZrQ2RyK0pVRlpRWWorN3F2?=
 =?utf-8?B?RHZUR0tvUW5hR01FWmpyUlFyMWh2UFFhTTBlRmZDVWtJYlhxRjh5K2JtUEto?=
 =?utf-8?B?azRsQnptcHlCOEdsMWM0WFk1cWVNZ2ZvanZZbkh5aW4vOUJ3R1l3aUc2bzNS?=
 =?utf-8?B?Q2NnMyt0NWdnRVNQU2wvT09valM3dWRMMGxLZDRmUGhsK2xvNnJaMGw0ZjdB?=
 =?utf-8?B?TDVUV2VrcmJQcnFtRlRrVUppY3ZvTGNNcHFXTm9nR2lrOWp2c21qS0tERFlH?=
 =?utf-8?B?RmJKbmNPSUZPNTg2U1lwUEdjU0hCVTZ5WTR1VldkMVZLcUhieXZxOUczb3BJ?=
 =?utf-8?B?dnowcGhqQWl1cVFjVG5YWG9rOGJFTkdSenRnZUJQVUJOd1dGbzYyeTNDSGk2?=
 =?utf-8?B?bVBlWFJ4dzBUcmhNOE1IZ1A3WWJVT3F4UzZUR0QvWWh4Y3pNeFd1ZVkzTzlS?=
 =?utf-8?B?aWRnUnNIdWl5ZzYwRE90Rm9kUHczUXd5YUhkTU9iV1d1T0VWTG5QbndWMGov?=
 =?utf-8?B?QlVKSXhpdFprdk83OWFYUTkyME1MMEExMG10T0V2ZU9zaGVvWlBXeFNIMjht?=
 =?utf-8?B?bjJINi9uQXRlRVR5aXduMnlSZnY3d2d5TGg2bUJCeXhDa3JnWFhMcGtpaEZu?=
 =?utf-8?B?SFJtbU42ZXhMZm9TQWpWbGhSOFFsaDZ6U0FqczVtYmVoUUVmclR2TzYrU0Vl?=
 =?utf-8?B?RXhHVU1PTDlBK2dNUjhTM2xoR1NMYm11b0xhZXUrTHBaTzhSRm1Wa0hIdStF?=
 =?utf-8?B?TFNCeFp2RVM2b3VkUERicU1vMGJwSzh3S3dtOEFxbWRuWUxSTkdJMzNSLytD?=
 =?utf-8?B?MVIvVUFXdGxGNFlNZzBQc0Y0RHlKN09zWHJaOGt6Z0c2VlJ2eGpPSHdybHJr?=
 =?utf-8?B?S3V0ZmlTazhPVjF0djhMVTZrcWMzNHl6RDFZL1pyelNrVmVLaGw1VFlOK3FD?=
 =?utf-8?B?alcxS1I3a0Jxc2FrUnZXcE85NUlZMk52dXBvcHNFQ25jUlVMZGdXZTZ1RWhD?=
 =?utf-8?B?T0d4VFZZRi9HZnJ5eHcwSmxUQmRXdUlHMXdoMU1QVEU5c2dHY3JZYXpGVmJY?=
 =?utf-8?B?eHJzcmFHdC9TOXhnQ0p0aXBQU2h3ZkUzV2pkL2ZMNXpBYTdXOWc4QlBFdnkw?=
 =?utf-8?B?VW9maXh1TnR2VzJxRFhLT2g5U0cyWGlmWXJJYXpVV2ViUmZJMGQ5RTVORk1T?=
 =?utf-8?B?NU1jOGpWMDI4bVp5c1pnL0VjQ0lPN1lzeDRoaDgrTC9FOTdMNFFpM1lJOGlZ?=
 =?utf-8?B?VHlQTUpwQUF0R3NpOG9ub2xQYWJYcVBFWmVKK1hPV1E4d2tyL1lKYkVORmxN?=
 =?utf-8?B?elllOVNoQjJvRm12NTBoVVoyazdRTFhBWWVPaTcvNG5aYXk2SUV2MVZlNW15?=
 =?utf-8?B?bjB1K3lOMFZtVnV0NHkvd3gyK3RtUDZKTzFpdGtlYzV3TDVJN3QwNGZyQS9m?=
 =?utf-8?B?KzRLakxlUXhPM0lKaGx6OTJhY0crNXNJVGtXOVo0Z3lnUDIyWDhzQlg0dW5R?=
 =?utf-8?B?UGxtb3kvOWRoVkVueDd3VGJxVXcxMmdxR3pHVWM5clVYN3NoK0ZJVVVGUXd4?=
 =?utf-8?B?cGNkKy9MZytoeDhxZUJZM3YvZFZ2QnVVcVNxZGtDNGpMZ3gydnQ0R0FldE5Q?=
 =?utf-8?B?MnJkQVlOZXRaNkhIaHJIMDIxSVY3TFE1Z05WL2pPUFJQNTFzQ1VwZUU1RDM1?=
 =?utf-8?B?TmQzZDNVR1g4T1h5M1ZBY0t3cWJGbzNvYi8yZWZWVitDTlQyZ2ROSndSTUo2?=
 =?utf-8?B?QVdZWThzRHBSdzdydXl0MnF5TkpGNUNzWTFHN0UrNzFsNW9UcFR3MVV1MFpm?=
 =?utf-8?B?M3IxQUdqTXMya2xBdGdDcHBwQVRmbWl5bjRMMzJkV3ZIekc1bHNNS3VMSDhj?=
 =?utf-8?B?L1VzeEZCeUdoVWZIellzd2Jwa0J0MzhnR0NTN3hPWDAwOE13OVJhM0dkQ0h1?=
 =?utf-8?B?VHc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: fc1b25db-9308-4443-dc1e-08dd33f3337f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 16:56:19.2192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vUgOwcZkx7qHVn8KEoZM73NDpvubtZmZjgALzjcb3tYl/FsgUOL1uEwU92S3PHkxF5mmLXCrhsnDJQGGJ0eEZIikmDo5S5dluhlS87qKu6g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9917
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Jan 2025 16:56:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6088

Hi Antonin,

On 12/26/24 4:20 PM, Antonin Godard via lists.yoctoproject.org wrote:
> [ YOCTO #15106 ]
> 
> It makes more sense to document ptests in the test-manual. Since ptests
> are still related to packages, keep a link to ptests from packages.rst
> to the test-manual.
> 
> Reported-by: Yoann Congal <yoann.congal@smile.fr>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Just for your information but there are a few additional ptest classes 
one can inherit that makes things a bit easier, c.f.:
meta/classes-recipe/ptest-python-pytest.bbclass
meta/classes-recipe/ptest-perl.bbclass
meta/classes-recipe/ptest-cargo.bbclass
meta/classes-recipe/go-ptest.bbclass

Maybe we can tell people to not reinvent the wheel for rust, go, python 
and perl recipes?

Looks good to me, so:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

