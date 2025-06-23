Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EE09C77B7F
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 14:23:00 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.43])
 by mx.groups.io with SMTP id smtpd.web11.21067.1750688575303770952
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Jun 2025 07:22:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=TXnwl1wP;
 spf=pass (domain: cherry.de, ip: 52.101.70.43, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gIkjosBJrXpbN1Abbe3NBwZDZIwqsCFMB4jI642nSUucKb5YX8oKdd3bbtvZm1NTVqSC6h0idQ4QWdaGeSiASjA/ozJGHP+JSVZFKAVFqJXrDcZzPoFYL+2cebjHd0I6XpfucS6sfHvTNHc3EzIA3mOF9yiGpknax3xhjQ1x0WhhjbqB+lk+WSB6IEgnXvo6tKzFM2s0BsyJYfwM85qBVAhZBBOIyDjojBFA+AKy2me8wkGbKmtaOGMxSd5QK/2lsOb8MG/MyPR4wi1hfRY2jNpU+H2vuwKvN+QSveubRjeQdrI7uulTEl9nt92Y9gP0jYhC1iseRXiYgfEwT56/iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9NLUhB2wMLVGJi7yTM6MyXO1LUIe0ESRx3friz544qY=;
 b=zBgJI8MINAQWrpOvF3UZkMqsdXSBv49q9+lKtaFwUMCj04P/VI4/BdPmYJKCKMs771Iq1ZPl6/9IL+dNGfkgCYdqGdp5uaqhtKwFvMpXNitgOyoNBVow4zEZBJVTdMrxM1Ee1Z88DLtQRRGTFCwSTrfZ5vR1C5EhSoCTSlP9xvjFb2E0lgl8f0ldjPpurUuPyOGtO0ob9k2LZw4O4/C2q+0qYqbsIcIbv1mE1sotp5XXI6ieC4/rys8zy0KUGWWlfjLXF0XmZNuFQkfMx7Z8tpKbjK1NrtDv4k3oEvDqj875cwBk+jnWIOrieg1N9C5p2F+EiW+gAW3djix1/BZZOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9NLUhB2wMLVGJi7yTM6MyXO1LUIe0ESRx3friz544qY=;
 b=TXnwl1wPi8GPHzoyMJcrJCZ8AhrBmFOym1xy/SSclGqwO/3Y0LyHSPK4YNjzo3V8Z9jfdGHbsJtb21scoH+fab3TdWBUU2vGaUwgzXJ/QJBKqJjDx6P4KrGY0KoUxPugd+Al39kvxtIv5KSgin5p22druwn27/NIe6xSzNMZhe0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by OSKPR04MB11343.eurprd04.prod.outlook.com (2603:10a6:e10:95::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 14:22:50 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 14:22:50 +0000
Message-ID: <2ee944e5-392c-4023-baff-57684d6a2cbc@cherry.de>
Date: Mon, 23 Jun 2025 16:22:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] dev-manual: Replace "On the contrary" lead-in to
 sentence
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <b651b956-eb9f-6d46-f878-f09bc6bdc460@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <b651b956-eb9f-6d46-f878-f09bc6bdc460@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9P194CA0028.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|OSKPR04MB11343:EE_
X-MS-Office365-Filtering-Correlation-Id: f8137cb5-a418-4f98-2d34-08ddb2616ed4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?blB3cmFFV0VpRVJLdTd0eThkSG1YQ3dTMDdydy85VGNnWFNFSkdnOTl1dzR3?=
 =?utf-8?B?ZEJvRVRwVCtORmJoS2ZVcjRtalFVcHN3MVRaUjdBRzJUZEw2eUNaNGR3Mitr?=
 =?utf-8?B?TEdtZW1CQVl5UmlCWllCREQ3UFlUY1hQNTU4TUQ0MGJZNmtZcDR6eFluSnR5?=
 =?utf-8?B?Mmd0c3p6WWFHTGZuSHhBcE9IdmdvdmpucXBJNEllMGlqN3lHYjFROG94UVdh?=
 =?utf-8?B?cXZpVUlaQktoYnZMb0JpZHlCWGkwdytyK3ZZcXVMemlOeHh0dFQ4cDJSenM2?=
 =?utf-8?B?UzZqekpWTURMaGJZaXB5SE5RQ3k4VnlhcXlQUDNPc2dDa1k4WUYyc21zM2JX?=
 =?utf-8?B?c3RMM3Njb1krWDdPUFdyY0xrNWtka1RYbnF4emYvbTdzbWtuK1JaTXp3enlt?=
 =?utf-8?B?V3J6bTczaU14ZjlyOHhzSS85dzJQOWRKWlZPRFV4dG9EcytnaEgwSzFPUDBZ?=
 =?utf-8?B?WUNmWkVkYTdZenBEVm9HRVArMHJ3eGNhY1pjV1dZRU5BV1NaZzc1U1ErODhQ?=
 =?utf-8?B?cFZkY1ZMVDJsVERvWXo3UHowTko5WWVIT3FKYnlYYVpKZU5pdmdMU3AxQkpZ?=
 =?utf-8?B?WjBLVmx1cmVaMkIvOG5OeFV5Nm9mUUtSUld3bndTaVlWZ25sdTF4Vmh3NjRB?=
 =?utf-8?B?VjlQaFRlYzFjb3J3Q2JXQ1dHZE5vb0d0RmgxbU9xY3hkajJZQXpNNWVtNHFY?=
 =?utf-8?B?K3pLaFlQZGtKMEJYNDE5UVFPT3cwdGNnNUVFZmlSN0t2MjZPNCtaN0xkQ05h?=
 =?utf-8?B?a2VQcml2RUVQb2gzYVRBemxTUThtYkgrdEs1bE5PaVhMZS9zVE15Z1lGNzlF?=
 =?utf-8?B?U1BGUDdVSHdoQjhhTWVQUUdxMzZodGxVTUhKUm1qYUhYakNBejNkaEFiTXBB?=
 =?utf-8?B?YW93STJRODZEckFRaG8wTStYUVdKY3RvWERPOXBIM0Vab3hmdFFFYUgwTWdU?=
 =?utf-8?B?RHpHditNc2d5UEdXOFJhYjRENTdnYlRBZ2xUL1pSQk1ZSXQ0cFpqVW1OdTZ5?=
 =?utf-8?B?cXRXdFdmYmhDdi84OTJmTS9uQkRtNTRYLzBNN0h6KzhVcmRsalNET2thRHJG?=
 =?utf-8?B?aFFCMUo5WW9ocGliMzhzVXdJUG1TVUxVdTk3RU01djM4WXJqdlpYRnNNajJS?=
 =?utf-8?B?RHllaUZGdldLMzlyNGRFNFRlWlMrdStodS85dUM1cG5CQkRHaEl2NzJDc2V4?=
 =?utf-8?B?blE0QS8wNWd2MjV1aGthYXNnTzliWGFSWCs3dGZOUHdtRFMxMDJTSFkyS0Rm?=
 =?utf-8?B?MVdEblpiWXBxdDBMTlU1eUt4OUFYdGJxQk5hQkdRaTB4ZTZUWlV5MEhUMlU0?=
 =?utf-8?B?U3B4emFzVUluS0o0dkR2SXE3TEt4WEZCMVdGMi96YVorODltOFVFejZ6RVFj?=
 =?utf-8?B?KzJCbUJyY1Y2UmNuc1ZKd1VzSjd5VnFaMlhmb0lmMXVSZ0Y1Y0ZTQ0k1V1NV?=
 =?utf-8?B?UkZWMEQ4aFMzVzQ3cUMvUDhzLzNMSHZuUmhRUHp0d1RvNDF4MGNZVUw5bHgr?=
 =?utf-8?B?ZU9ocDk3RzVNZVF3WkJkODIrY1RsVmhodFYwWEJNNW9pMHU1VFdyRThDTmNZ?=
 =?utf-8?B?dnByRFFWYnJsSlluYW0yS013Rzk4Y2ZTMDRVUUd4clg1KzB1V0hCRW52WVow?=
 =?utf-8?B?ZjQvS3FkdVdWVmIyMmlJNnJHeEdnNHNTQ2pzNkhjdXFodEpDSi9nTGJ2ZUdB?=
 =?utf-8?B?VDBMQ0hSRUhydGk3Ujg1Yks4ZDRGZHFjNU5WdHhVNTdTUG5GNW1LYVJEU1RI?=
 =?utf-8?B?TTh1OW5DdXlxczh2eVU2Sm5xanpqbGxUS1MvZkVvUkRFdG1SUXNBU3A3NGNq?=
 =?utf-8?B?SjFYWE5zOE1mSnFZT2lsM3ZDMkRmZ1RWOXNldXp5YVg4OXkwLzhvQnlXT00w?=
 =?utf-8?B?L1JVWTQ4OW11bGZQRnF6SzRZeW1JM2tkVjJlS0VEK3ppMHZOckkzT0k3SUdC?=
 =?utf-8?Q?2mXLnbh26t8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dkRGZ041dG01UkRha0RmZlBDZXlyM0sxeG9Hdk4xTHhnT3dMYmV2RzNPbFBS?=
 =?utf-8?B?RkEvUUozY2pHUk1BNlJ5akdicWpJRm9yWEFHWjlBU1p1LzZSeXN1akxFWG9H?=
 =?utf-8?B?N1dyUHJvM05tdk5iZzArb1MrL1FCbVR3ZWdzMlEvd1RjSGREWmI4Q0VLc013?=
 =?utf-8?B?Wnh6U1hIek5rV1RZRlZDa2xCWHl2SHlKVC9xc0FIZnYzTndBZFIwaklJR001?=
 =?utf-8?B?SzZwcUljUy9wVCtpdnJMSWhKZXJWOVhzZ205Y3VyYmpHa2JicHhueVNMOXFp?=
 =?utf-8?B?ZXphSTJONU50L1A1TDM4VHc4QlVxOVlONFVCOGdvYUhYcTJreXdmUzdMYXFQ?=
 =?utf-8?B?Tmk4Z29zeXZzZmc2OWMvZUtIc1hIeU1vMFpaOW13NUkrc29qUkRtK25BT29N?=
 =?utf-8?B?ZlU0bm1QajI2WS8vZERMVnVwZ04zOUgwZzN6N0twRVhaVHhMS1pTMkVtS2h6?=
 =?utf-8?B?dXZCWDB2OHlYYVYvYXMxWC9kRVRxcXZVb3JOeld3SERXemRmV2hWS1d2Q2RG?=
 =?utf-8?B?K2xzcW5JSFpPYjhqWURCL0ppOE53OC9NN0FSSHFPbFhHNVk1Tk5EdDBROHov?=
 =?utf-8?B?NmZFMDQ1Wi82K0FFTkNscytmV1ozZ0RjVmVVMWtTUzFYTUw4QzdOamZpWmVI?=
 =?utf-8?B?V3hKNFozdGhVTkJJYm1mSjh0dVgvTWpkWVhVdkRadG8vWjdNRytnUXVySjMr?=
 =?utf-8?B?aFM5Y1pBd1djb0JKbWFGUjdWNFMwU1hVMGt4V2h6TnM1bC9sZXpjY2N1dm1T?=
 =?utf-8?B?UVNuQ2JuRVZwWHd2ODJDUE5XZm9FN1lFT1FRZlB5VmtLZ1NTZ0pWZk9tZFZJ?=
 =?utf-8?B?NjQ4NHdKMWQ5NEZtZTBRMUd6L3JXZU5Wd2VVeGlnZVdYQjNQTWkwRnhBYlhQ?=
 =?utf-8?B?dUw0S1RGejFzMjUycEozeVFRYzRoSHIxMHNsMy93RHVES2hLZHJMVkVyaFEw?=
 =?utf-8?B?OWI3Qzk4c0FmSk5zNGNCVldncVFlNGVGemUyU0Q2eHdGY29RUmhGbU82L2R1?=
 =?utf-8?B?aWdTOTNINERmNk1qVDZ0Zk5aNFRMSVBlVktJRHZXd0hIWURCbFRSY3VwNUxW?=
 =?utf-8?B?YTI2Z3hoWXBJaTY1bmoyQTV0S2d5c24zT1BEeXc2b3NCZk9sUUVIWjdUMWZt?=
 =?utf-8?B?STl0bUtGMlVWUnJHNHRwVGRtQjd2ek9weDhqYllCYWt6UVYxRXcwVk5ZaUNo?=
 =?utf-8?B?T2V0Q1ZhTUNUcW1qakZiYVRlMHlsNzVJRWdYcy9RdU9qNUF5bWRxYU53SHVT?=
 =?utf-8?B?d29KL3JhMVMreHdMV21hZERqRzF3a2E4TnNTMDdySWxQVWt2anFBaUFHbGZM?=
 =?utf-8?B?emNYYTVRTVJ0OURtN3krakNMSHJMNThmUXVUNmZBVkpWRXlOUm1OaUxzU0Ns?=
 =?utf-8?B?QTZXUGdJby9pWW9CWXJaS3N0UmxRNkFVTjVTNzRITTZLcVR5c2xxcysyY2Vz?=
 =?utf-8?B?UTNuZExraDFrWkRWZVY4SFljaU1hVWU5UWdlNGRBZWVlbVByVEg2cXhlTzNN?=
 =?utf-8?B?S3JjU0dXMEJNazRNWEFkY1AycWkwQUh6TDY4SmpnMGxJZkR6eUMyQUZScUdl?=
 =?utf-8?B?UjR3a2g1Q2x0QVVRNXJlTWJ3M1U4ZTBsR29QQThCSmFwREwwckVXRGM5SFFH?=
 =?utf-8?B?WStSeEZZaHF2Y0MweVRTbFkzZXJYbS9JU043VmkrZVlnYzM0bWwrMC9VSm9N?=
 =?utf-8?B?aTEvbzRveFl0dUltK1B6NWVIWVpRcW5mQ255V0xUZE91UG5udlZtY2hUOFhm?=
 =?utf-8?B?T0E4YkJyWXR1ZTBXQWtuNSs2UGRrQzA2QUxhNDJwQXU5MjRBa1B6bXp4b2Jz?=
 =?utf-8?B?eUpUNTF6Z2RhVnJWU1JSUXZ0RVFVenNzQnViVS9XUVVhT2VHT3plTVJrNXFY?=
 =?utf-8?B?NUd3aGpWcnVjOWJVaTB4b1ZpSlUrZVNPUm1SeE5Bd0xoSFJ5L0MxeXNmZG9V?=
 =?utf-8?B?WmlYNVJtMEFxS2JnWVdrU0RDekl0QkJacDhENWlUNktZVUt0aFVheldXSUhY?=
 =?utf-8?B?ME41N0NSZFZUZG5IY0szbi9NdmtZVFZVNzRuZloyTjlVSk92MkZIdW52OGMy?=
 =?utf-8?B?Uk5ITDlscTNTNnBka0dCLzcyODdEZGZlWHRBd2NvRTFUMEJ4TkdJVStCVEVP?=
 =?utf-8?B?TU9mdktpeFRLMDRQYlFHOXc3VkhLUEJHQUJHdldmWXJIczBaMnoxZndzckFX?=
 =?utf-8?B?L0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f8137cb5-a418-4f98-2d34-08ddb2616ed4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 14:22:49.8834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7r8HpULYZQqe1di9OhgIoCjY/y8ymAkwZ9C7bXIexWh62lMuQ+c0FtAg9ZZnUFETMr3yO48V/lUFt1U3hWy70yQ44OeFI703TcytQIq7LvQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11343
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Jun 2025 14:23:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7161

Hi Robert,

On 6/22/25 5:09 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> "On the contrary" is entirely the wrong qualifier to us here, as it
> typically introduces a *contradiction* to what has just been
> expressed. That is not what is happening here.
> 

Not a native speaker but my brain isn't too happy with the suggestion 
either (but that could be solely due the fact I'm not a native speaker :) ).

Would "Alternatively" work here?

But I agree "On the contrary" sounds wrong :)

Cheers,
Quentin

