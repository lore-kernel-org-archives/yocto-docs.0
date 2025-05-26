Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77B5AC5AD49
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 08:00:50 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.86])
 by mx.groups.io with SMTP id smtpd.web11.24429.1748246439579301609
 for <docs@lists.yoctoproject.org>;
 Mon, 26 May 2025 01:00:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=hT0KgLcK;
 spf=pass (domain: cherry.de, ip: 40.107.21.86, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DV1h4dwbfdJL45fT+fZHV1TEGptFudTxFoUmAqNfWXrD03hBkq3KozRdCk7l42nN12trt/xPdbBDG2bxF1X29YAaeBoqB05xtinDzMgZ4yLCltAEuRUrBa7KCVNcwfBb77DFpybdUT3YvPWOdN/zzMwlhnOFxQYYZLtQ44QsV3hLwABT+LR6JXOzkCoIxLqVw2qThuAsiuexgXGhwQX9q0hNLKGiMXvY5llVopk5nvHQaF023Q0ZYaZcvPubziil+33JJ8PsRfbh7ecWF2U5/w5lF5/HZ7Q6ecaLO1kqb/f8YijCV456G6NX7ZkOiWvCRzK6eBE+AbXttZa7GLd8cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YEUYPwn3zD3O2rJ29izedaursKEiW+yfBa1sfRGuqoo=;
 b=T2gb3REduPa3nlVnDKX2oSpHiUdRcM0JNDGVdRbEIyOY99lrJ3DIRc2TuKi9oD3rM0km1f1xasAlqzVnof0zcuv46BVw/8hDD+l7zaVboBeOrq+FOdaZUvEjznEdYqd/w2KF1ARhXe5z4v4jYI+S1gK/7g4pZYXE/LCfIWqswKNpq+lWp3W1Ql4i3oQZypYU0fhqPm+atdnhkmNQKvuTMv5nGRQeJWzlbniEDmoqxGmZCW4tTX2OQeM5+1aH9obFAS122nKBu1Cd9wd3GA5W962E8t7pXsYFmTslH5rhEiHVhav9UKxrEZkm0yYSUu6J5Z09d/ojSXD7WA7useHofA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YEUYPwn3zD3O2rJ29izedaursKEiW+yfBa1sfRGuqoo=;
 b=hT0KgLcKajtWuU7SuukFsBg4ChkU7kzuxeWHBkycQybQs+l9TOijxkTbZovhdTLZ4DYWE2Cccml3sCKEBMr4OjgQTsUy/GgxDbVBRrchOWxjXik7tRQ6CbSJPIONbJkUrKjJPu2gikupgYI8MswcuiE2qKEzAlYi8xZplxPJA/E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB8231.eurprd04.prod.outlook.com (2603:10a6:20b:3ff::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Mon, 26 May
 2025 08:00:34 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8746.030; Mon, 26 May 2025
 08:00:34 +0000
Message-ID: <8358e69b-fe5d-4d8b-8d21-4caadb85e519@cherry.de>
Date: Mon, 26 May 2025 10:00:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] brief-yoctoprojectqs/index.rst: replace removed
 macro
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <20250526-fix-forgotten-macro-v1-1-1dad286539de@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250526-fix-forgotten-macro-v1-1-1dad286539de@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CWLP123CA0253.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:19e::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB8231:EE_
X-MS-Office365-Filtering-Correlation-Id: f7707288-5c62-4e51-42a9-08dd9c2b6448
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?b1o2ak5zSlNZR2x6VXlQYjk4Zlc5VXdLNWlncHcwTllJRmNKTGE1R2loTllS?=
 =?utf-8?B?MkpYNnhQQ1ZaQXJvREFycTJjdDdwTThNbzlWYlRZQW4zSlhURG96UVhvb3Q1?=
 =?utf-8?B?MDhBeTErbllrbi82dUF1eXdmNThzNDRvcUc1SEJ0UFp2RkdZQ0VxT2pwTXZ3?=
 =?utf-8?B?azBXVEY2djFNZUxPUE9PQjZyRWJVajQ3RGhSdk5FZkNzTityZ1pKMFVhaVBE?=
 =?utf-8?B?OU95R2JuZTlZSm12eUVaam5yZ0RPbGZncUYyb1RLZW5YODlYTnVnRmttRnQy?=
 =?utf-8?B?dnFhK2FqRFRoZTVKeW5UYU9iWjIzRVAvVWhobWwzVDFUUU5yZjNNQkovVXBq?=
 =?utf-8?B?TGtwYnpieVFmVnplTnErc1VKOXJpRW1xd0FZRVVhMVNxSlBBck8vUk5Bc3g1?=
 =?utf-8?B?aGVTdTJTdm1zZnJ4TXdLS2cya0pIMmwyQ2ZOdk5GSEpxK1VyOG9Rc2JEK01t?=
 =?utf-8?B?RHUrcFE0d0R0SHdYeWZNd1dnUzU2b3lBRFllQi9tbWdOQ2VRSE1GcnBPM3Bu?=
 =?utf-8?B?OU1NR1ljbXF2UDBkTmx3Z254Q1l5OURCZGszekcwZFAwYS9LaG1uMGRtdEZz?=
 =?utf-8?B?ODYwMThVZzQwQ1ZHeFV5WG9GeG00V0tLSlMzdjVjZFJwbFdFSXdxRFlHb2Vw?=
 =?utf-8?B?cDNPdGlCc3hUY210ZHMwZEhGZ1JCWEhNcUlpcjJxZW1zNVo0bUQwL0NLTVRT?=
 =?utf-8?B?UTFTRklaeHZ2ZVJ5SVU4bWRucm5UMS9uYXg0aDk1ZHRMYmpCQkNUMHB0eHhP?=
 =?utf-8?B?YzQ0enVwcDR2STZ2NTFRNWdXOFlIMHlaT0ZwQVdhZmUrb3RwUXlkVkozMXZ0?=
 =?utf-8?B?MlRLeTdPYys1NmtJcHVXdEpRQW1zMXZNZUdlbUp3VmEvaGlkUkc0VjFHaWlF?=
 =?utf-8?B?UkhYMkRaSE5VRVNvWVRCcWR3OCt5TWNubVd0RU9oYVhhaU8rNVBlNVlSVGVX?=
 =?utf-8?B?Nk5QS1ZRNHlUV3lWbkJlS25zWldkQkt4ZVZKakoraytUMnB6NW5FeE1ScEwx?=
 =?utf-8?B?eE5RZkZjN1FtRDd0a2U5SDNrTEozeUU0cmZBei96eGM4OTR4UUpPSkVLV2Ux?=
 =?utf-8?B?TmpETWZwcXFaTEZHT1B0UGllbFQyZ3hoV2pKdmEyUmY4WkVkYXp2dzN0V3hX?=
 =?utf-8?B?ZjBMbVVTRGhjSHRwbWZnVDFyNHNqK3o3ZGIxTXlXWldwYXQ1NStlbGVSWWRu?=
 =?utf-8?B?S3BoQy9uRjNOYVBuK29zaU8yNHFSSzZpYnY0YUErOTNWL0lMSmdmeDdUTGl0?=
 =?utf-8?B?OVhLdU91WHErQWM2eUpEeHM3R21lQVhjQkZLaVNaUDg2Qm1PdzlONFFtUXdH?=
 =?utf-8?B?cWJITjMrTExPemdJeUpLSEkyK1UvaElzRjVRSm9DaVB5TkdMd1JHZDZoOS96?=
 =?utf-8?B?dXE4Ris0cGhoUnhiU0hoSFhLOGk0L25hZExWbEd3NURKZUp6Qm8raUJ6bGJ3?=
 =?utf-8?B?WTN5bWlpQkNoc2ZUY0l5SXRVTSs2ZDdQbmQ4ZWVQRFRKMmhTemYxZ0t4NXZM?=
 =?utf-8?B?UWNzWjY0UllXbTloWnlXYVFJY2sxTlE1RFRSRjVnZmx0WXV0bUxoK0RzMGhH?=
 =?utf-8?B?TVIrS21wTmFiNWNSMVByNE9iMTUyM0V4NitySUhOeVhlQktqM0phUlFJckky?=
 =?utf-8?B?Unp1QjFpbDJ2WnZXYWVQZ2ZkbVF1dXBWcFoxS2JORk1QOGJ0VWE0eGkwcjMv?=
 =?utf-8?B?enB5YnlVWFZYOWZtaStXcFBEN0dwUXkvVlZXNWRoa3NvZFJZZ3NlaEN1TnhC?=
 =?utf-8?B?S1FVanN0d01ZM2dQd0VYR295WHhKT0FUSGZQeDIrZ0JSa3VML2hVYS8rTllZ?=
 =?utf-8?B?OS9mWjBlYmxTUnIycXdxY2MxUDdxcGxYQk9wR1lWdGRSTG4zWlpndys1NVVZ?=
 =?utf-8?B?aHNiTXhHeGduMXZUc0g2dldudlZxS0RXZmNldUQwYndyQ1lkSklrMzVmR3NR?=
 =?utf-8?Q?7dAlr9aF168=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cm5EUFJ1YjlZcnpsdlZSMjZJV2NwNE16R0orUEU5Uit0dWFrZnBOS0pXZzJy?=
 =?utf-8?B?akNPV1RzUUNCdFVSRHdoZ0hnSzlBdGNZS2NVdEpyQVRFSHlaeG9DV01IM1U1?=
 =?utf-8?B?Qy9oQVJmT3BIQXNnVmR1ZEFaUjN1dVJLTk5LWDNyN3MwWVRtWmRMWHh1eG9o?=
 =?utf-8?B?c3YwRkVGdUg5b1o2ZXV2cTFUZ2tHUTI3Znd2WDB1ZTVVU2ZtYzYrTU83QXdV?=
 =?utf-8?B?cTdDTHQzR3l1UlBIUUJmZWU3OHdpZFJoNGw5YXlrVlE3S2NwUjk0ZDR0c011?=
 =?utf-8?B?U3JudDlsWmhWbFlCNHYydXpkN2VHTmRDSlZYa08zZ3hwc0JiMXplU1V2NTFj?=
 =?utf-8?B?elJpNWJYWWltc3hycDNrZUNuSUhNWXpDc2dTck5TRVIvVVVtTTgwbm0vU0hP?=
 =?utf-8?B?VDN0V2NOSGh1T2g4bHZ3eTJ5ZE5XR3lUOXpacnJuQlA0a0J5MjNuZmsyZnAw?=
 =?utf-8?B?cE1DUktVNGNWR0tWcmVNNTViUmthRlA4S01naTFOakNIR3NxOFQ0aVBCVldJ?=
 =?utf-8?B?aVFsYkpGNElZMTd0ZTJDNkJQWE5QQW52TzZSOG0xaDZDMnBxOGJjT2FyMlZH?=
 =?utf-8?B?cFV2bnBKYmZIeTJYTzNwd0N2Q1hHdDNVaVV5MjBab05LRC8weHRiYmVxZUxp?=
 =?utf-8?B?bW9HOWNkU1BiakE3ZlNoVGwvNC96bGVWYlBKYXZxcTJqTlhjWjJMYTlrVXNi?=
 =?utf-8?B?ek9rNGRFU01NYkxJUE9MSnFLb3FTTjRQdlZTb0VHNkVCUnZpQVRKWkViV2ZY?=
 =?utf-8?B?SXBISjBHME1ObWgvQzVmOVl4dTFaMEM1SVQwdDdlT2JMUW9RbmNpZitERCtu?=
 =?utf-8?B?ZUJtUDdweW1YaUNaa0tBRk9XVkNaK1pwZzZ6MlMrTHA2K3pJZUZiRThneTRz?=
 =?utf-8?B?RmdtQWlSbVlsZ0dGUW5XNVAxV0gvUDMrQ2luenV4bUxaN1pkTWx5M21ucDYv?=
 =?utf-8?B?UFVyUStjSVNpTnhLZTZYY1hVcGg0QlFNVHhJekhLeWpiL2VYakxHNlNZdGUx?=
 =?utf-8?B?S2krcTNlQWZndWhXcmJUMmwrRkFIdTFiQWxPWXFBQkZiL0U3V0JiUUpxTXVl?=
 =?utf-8?B?cE5MMHY2QnVQQlkzdWdGZFJDMnViZDIxaENQaU1mcnNmcWFiNlcyVW9vdU5U?=
 =?utf-8?B?bFEvSmh0QzRlSEx2L09wZjlIRXUyb08rd1Zxa0QxN25FOWt3SjRDaXZJajcw?=
 =?utf-8?B?bW1mMU03NHBKVVZvRm1RSk1BVnlVTlA5MjlVeVloRXlRcEtaVFRnWFcrKzRF?=
 =?utf-8?B?L2R4Z2dvWmExa2d2b1lpeEkzVDZUZ0kxQzlNREtjSnZ3MndWNFBXWS84M0px?=
 =?utf-8?B?QW5aTjlXMWJlbGEyVEhveUV0K1MvZmpiZHFyM244eExyVE10R1JCK3hqTVAy?=
 =?utf-8?B?NWxES2FtZlRYdFlNaThJMENGTzU5UTA2TnBIWlVGbUhRcWhWQmlNSUMzMmZQ?=
 =?utf-8?B?TllBR0R5dHE5VjkwVUd2TDF3bGFsb0ZPMC9tbWRWcEQyajRaVXdiZG03Q3pM?=
 =?utf-8?B?RStYTEpLSzkrd2NhZkZTVTVscUtwMElQRUJ0Z05GdVlYOTF5aE9KdW9KaE8x?=
 =?utf-8?B?cEVRazlZUXNpQzVWdm10L1hmamloOUFYV0V2OS9vdVJla0N1M0VoWTh0aWo2?=
 =?utf-8?B?Q2xMdkRHajltTEJpVU10dGhQdTJZWWpsdEhBbnZRbkxTTEZ1Q3IySEduUVFk?=
 =?utf-8?B?azNUaFZJTGMrUFM2R3Y0dlQ1em9xY1F4R1hCYUhSRkFYU3ZLTWN6YzZ4WWpV?=
 =?utf-8?B?M1NGV29LSGg2UUNJMTJOa3Jld1lRRk9iVGVBblBuOWlkUGovNms2dm9KOWtH?=
 =?utf-8?B?VTBadWdGb2lkdis2TFZJYWVtRVUzUXlHd1ZPUXhVQWFVK2xyTFBwUFZyREw3?=
 =?utf-8?B?R291US9KR1RKa0lsbzRkbVk1Y01nbVgrck94NmJhMFdzcVZzVlgyV0Q2eWlW?=
 =?utf-8?B?cHl1YzVMMHB3b0Z4N0VRdVB2YS8yN2dEZGY3U21GZC8yMWtrWEd0WVRudGJn?=
 =?utf-8?B?aWNJRldLQVNKbERxbXFCVHI2Q1k3ZE9hbnp4dlJ5amlPUWx2YlVNRldZdTgz?=
 =?utf-8?B?Zmk4MDl1Vk9PZGY3UUpSYVZ6N1FrZkxoWHprR3dEbWZwWXB2YjlEWit4VmdN?=
 =?utf-8?B?OUx0amRpRFJDdytmSm5YZmxFS0l3NVlSaXJKeWphZ3h2Tjl3c1ZGTExyZ1Ny?=
 =?utf-8?B?UHc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f7707288-5c62-4e51-42a9-08dd9c2b6448
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 08:00:33.9955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mzN2BF0i4TcVFmZicDeZWqquY7OKUo8pKUoxeUu4ZEvzbaR29uoYCpvt9z5j3ysFWYVvRn6QYw2+sI30c9Vorwfzx5L2yNrUWz6KMdhcUr4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8231
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 26 May 2025 08:00:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6916

Hi Antonin,

On 5/26/25 9:31 AM, Antonin Godard via lists.yoctoproject.org wrote:
> The UBUNTU_DEBIAN_HOST_PACKAGES_ESSENTIAL macro was removed after
> 8d993022c2ae ("docs: use literalinclude for system requirements").
> Replace by the literalinclude like in the reference manual.
> 
> Reported-by: "Robert P. J. Day" <rpjday@crashcourse.ca>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

