Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAEA9C10F15
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 08:37:40 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.115])
 by mx.groups.io with SMTP id smtpd.web10.13631.1713775059676121468
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Apr 2024 01:37:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=VDe+MSSx;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.20.115, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HYkDfbEipIc2XaqZOPaX781Lfkv13DZPXbqBo0N1txj6MIQZEEhpXyBLk6HWadTZ7Goz+yCY2M8on5WZhwoWifERo6YR3swvy0pX9ESQeLCVBGBvt9g5QAjHr9UPvI7iqvkKUEYCNvwjzIeolJ7YTqHAEzYroJxCyMtgvfm+TWagT0hFGoQ211UyKPw8P00VzjRS57kqzOWhuW93p6Fb46+0Z2WXTsg795LPOzTieabRBC5fx+az2Ww7Jklt6TCh/zg/IYF4xrZaV9rlsU17QjDxJmRFN43Z7J7G+2zLfgLpq53ZOBU3jLosj8B9uIHI1OIfXPWyXe+aSTu1N4XGgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+GHMD7lYCwRDjEbh3m95TWOeO7I9dGmq64FcY9tpnk=;
 b=jbCleGejywhqiVqjvfP2YmUPVROc6OSZ3mgvij0MAgp2LlX1a8pd46O7Dd4fMWTvTw2Oyj0xSs53dfZn0o8I8eHpEOcpLA3mGU0O2G2uIlgRQHl9n+tOEyNIn9+5E/mHHZTB52w/vAbt1hZKV9T/oi4zJJScUZVuXl0o1BhDBmuJ1Z1+mueAd93xd2Jd02jY/3SvN+aU3fhqXYoVGRTz25hI2Z3DStSUfNHI0+t0jj/2kpAqGdU4MztFa8nKhJWBXfGg4lMeGsNIgCSmX8ro7uVwn8N7pJK4HbmxCK5dIME0P3+w3BuvGzDZ5+1nG0gINJz06EzyMcAJnFQ5liMlTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+GHMD7lYCwRDjEbh3m95TWOeO7I9dGmq64FcY9tpnk=;
 b=VDe+MSSxm/zfDIoAq99/e5hgu4O5zzqP0vahtpJRHQQZT4CI4jDtZZPqEN22gYgr2SCq8ef4fyTnd8PD+/zfaM2ziKxkq8+2HTvMZ2FRIAXeWyhds8wpD9XWz5fz7aJV1GYQfljTq3brqwd13EFByDapzJnje2qjuF3HkSpo9SHyWn8iGS1Db3ht688X60iuLRzi08uadUDPbhM9ki44eTqg5bZNIFngfwXV6dStJhCzH5/sIT6nQw554eSQ794LrE0bf0/PMmt8b2nhc03RbVoyK2tSyXMKV3NKmT7zsUMlMI6aaOd5VJBemXEF2KMIgkbWw9Vjdr55ch04Bed6pA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DB7PR04MB4842.eurprd04.prod.outlook.com (2603:10a6:10:1b::13)
 by DBAPR04MB7271.eurprd04.prod.outlook.com (2603:10a6:10:1a6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Mon, 22 Apr
 2024 08:37:36 +0000
Received: from DB7PR04MB4842.eurprd04.prod.outlook.com
 ([fe80::bdc7:4b2c:e74e:1504]) by DB7PR04MB4842.eurprd04.prod.outlook.com
 ([fe80::bdc7:4b2c:e74e:1504%7]) with mapi id 15.20.7472.044; Mon, 22 Apr 2024
 08:37:36 +0000
Message-ID: <3a975c50-0f62-4e15-83aa-16b693e7a72a@theobroma-systems.com>
Date: Mon, 22 Apr 2024 10:37:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] manuals: standards.md5: add standard for project names
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20240419075526.4135600-1-michael.opdenacker@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20240419075526.4135600-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0021.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::25) To DB7PR04MB4842.eurprd04.prod.outlook.com
 (2603:10a6:10:1b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4842:EE_|DBAPR04MB7271:EE_
X-MS-Office365-Filtering-Correlation-Id: 3feeda02-9357-4c77-5f51-08dc62a77633
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NzhlT3ZiNnEwZ1FnU0t5a0JIWDBlbk5mL29OTUVkejdHUENFVVJtR0N4Zjh4?=
 =?utf-8?B?QjROTTZTdGg3ZFpSVG9jNE9ZUURjZXdJcm15eVo2SzRoT3pzbm5zUmc0Z0V0?=
 =?utf-8?B?VVFac010WWcxS0xuU2lPbndOZ3FCTXhyK0wzMzF2bi9keDc3QXNYRHVGNWly?=
 =?utf-8?B?RXpuQVlHZlVKczROSDBoUHZUb09VL3YvVSt5YzJCMXJCem9ZSzVyakpCSzBQ?=
 =?utf-8?B?K1RteTZ2Vy9FaFNhV29KeU0wc2hTT0pnd3A2QU9UdndWSUViVzFucER6QlFo?=
 =?utf-8?B?ZFo3eG5jVC8yNnlkbzlQNjh3KzNOSEVwL3RLWU9QZ2hQYTRFRFgraWt6UkJv?=
 =?utf-8?B?Q2MvMjZuK3FpeTJEcHJXQWhrQ1hBUEdKRmpyUmZiTzRWaGg5d2w0ZUl5dTVG?=
 =?utf-8?B?bFpkS0gvcEVUbzVZRFovczJsVitJMjlUMVVVSHg4L3lWVnRGQUxMcXVSWm5V?=
 =?utf-8?B?TnRkU0MzcTQxbXNUd0kzaFkydmJ0eG9QTmFjY0o0cFhHaWU4cUhqQ1dldlB5?=
 =?utf-8?B?L0VJOUNyc1p5N0M3OUNkY2ljS2JMdlg5N2R3V1dhcVVTTzZSclJCTTBtRlRT?=
 =?utf-8?B?YjRUTUh0bkZpaG4rb2VNKytzbEwrVitzQ2x1WWZEaEhDdVpoVEZ5OXBuUFQw?=
 =?utf-8?B?ZkNNYStDb2duREpEdllBTHdqMjVCWG1Ocm5QT0xBejg3RzkrWHEzdk52MzQ2?=
 =?utf-8?B?UnM1aUpTT1oyMmlUYUdJa1NBNTlzSWIrc09iYVN6WVRjemU5ZXlvMWo0Rm43?=
 =?utf-8?B?UGxROHhITG1xODB0bnBDb1ZGajBoR2FGQlZTV1RWVE9tQzhKUUk0a2wveElV?=
 =?utf-8?B?bzhva01CQXlmY1N5R1BxUE0xaHEzemNsemI2OGN4K2RoQms1YWdMSmxiWmxK?=
 =?utf-8?B?dlEwWUpLcVZxd1FPajhka0p6VmFnTm1XWHFuNVZia0o4VERHUkE3ZkdNcDNP?=
 =?utf-8?B?RVR1WHlITnVjbVNyQTVibHNGWWF2UmJRVzlYUEdMY2p5MUd1STdaTmJUcmpU?=
 =?utf-8?B?RXIrem0vS1k1d1M2dFA1cjBNQWFBZ0VHT1ZFZUtVTWRoc1dqT1VXWEZadFM1?=
 =?utf-8?B?MGtMeGdKVmh4Vm9JR0hDblpkMFVCVCtza0E3RHRTTldzWFhnTm1NS2tQYWJV?=
 =?utf-8?B?K3dWc0hlaXlHZmhLUmJlT2VFTW9zNnVpZ2czSnpUdXAxVVcvejFvc21mSTFW?=
 =?utf-8?B?bWFjTW1CcDN6UUwySEQxY0N2S3kwMUwvQ0FVajYvbzhLQ09WR0RBa0ExbU9w?=
 =?utf-8?B?WnVBdmp6RHlXbzNZSk4wK294bFlaY3I1a2JxM2hYUXpldlBVeFlnL1NtVGVG?=
 =?utf-8?B?VHNKQkNXN1grVnRzdEE0MnpxZXU4bTNSc0JSR1h2RXU1MTJrMTlRS2tmU2xu?=
 =?utf-8?B?TXZ5VjhiSWFHR2h1QTgxVUxsT2g2RmNCTmxHUFNOQmg5MDRNL2NNOHNZZWJ6?=
 =?utf-8?B?NjlpS3F1RUVQVkQ0a1NJR2RSVEJpVmw3RkVVbFpwVmc1akN1bGQxQWxrTjIw?=
 =?utf-8?B?Q2RZNVJYSGpSQ1J0V0JNQllFcytUS1ozS1dRc0xhUEEvcjVCRVo3VU1TeHBj?=
 =?utf-8?B?NUwza09LMGtyaGhqTzBmaXkwYzZMSWE2dVhMRVBBMWd2d240SWE3eFQra1I2?=
 =?utf-8?Q?i3UwgbnXsGPquaSdcMfCvBKjq9Ulawkh8e4b76+3o/n4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4842.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VHQ0NWk4VWtNRmVJajg3OXVjdjNLZmNlWTBmSmF6WXVQSzFqWFc5M25RUUtY?=
 =?utf-8?B?MzNFaDZKdyt2M2orOHAvTjR4NlU2RDN4eVJHbGNkbUlJZmN4TDdNOHdhWnA5?=
 =?utf-8?B?UGZibFFlc0MyN1RLazBweEFYT0Q3NE5yVjl1MDc4aVpuWlArcWlxN29yNEcr?=
 =?utf-8?B?VlNNUGVISVR0YzVDNEdrd1daUHlnNTFUYXBLd2ZyWEV4elBSdzRlTEVNWjBD?=
 =?utf-8?B?VGpVR1lxb2tLQzltdkk3eks0UittSDhHSy9Hay9PQVVHVDJCM2xTZUxmbDFv?=
 =?utf-8?B?M3dtdncwR0dnUVVPS0hhb3BTZ29mbXFSMC83bFNzN3BFT3JrbTdoaHA2YVE2?=
 =?utf-8?B?d3ZKMzhvRDdqWXRZNlMyZWVHK0NIMFU5TVovc0FwUDZrTStMamhvZWdNQzZo?=
 =?utf-8?B?aitiUCtuRXNTRnFFTW1MREFHaXB3aDUyKzJtcHpoWTJPYmRiQjN5c2R1a2th?=
 =?utf-8?B?NnFKVkc1SUNsOHdVTGNLSW0xanhkaDhjQUNZNXE4d3lhZWh6dytMSEg0Qjdx?=
 =?utf-8?B?QytsWHZxbFl2cjlCNmVHUUxlVXlJZjJGbSsxUUVKZmltbW15QkQvb0Fnc3RJ?=
 =?utf-8?B?UHUyaUJoT0pVK1NZN0VZL3ZBM3JjVGFyTFFaZnRraDRMU2p3aC9NTXlvSUxG?=
 =?utf-8?B?T2htRDA4U1NlVjAxS2pVMis0WVJ0ZVNoUmsvVWVjeTExV3k2dVpsbVMyQWps?=
 =?utf-8?B?d2Z3Y0VjSjhFdkFWdkFZd1BQS2NBZW83QW9pejdEUmtIRURqZFlJTjN4MElQ?=
 =?utf-8?B?QnNHeUFvQm5VQnBKU3RlRU9FRFRIeWhRdFZEdUJ3SzdFckI5VjBPdk01Y2R2?=
 =?utf-8?B?K2xGVnhCdUNxVnNmMFdOUHcyMkg3TjZqbWloaUpXV1k1Q3JHajM2SWJBMGQ1?=
 =?utf-8?B?MEhQZm5CaGhwYzJFMkNQRlMxY2xoWC9maVo3d3ZRcmF0MDJ0T21BR01RZUJG?=
 =?utf-8?B?SWF6OE9xa2pGdHdlcTR5ZDI3UVR0SjYySWtvUkJGUm44WUY0VW5MTkR6Zy92?=
 =?utf-8?B?c2psaU9XKzY4ODlLVFZHcHU0U2lrV1oyNklRR3phamFuekc2c0k1cW9aRGl3?=
 =?utf-8?B?cmRrenJySGR5NjFTN1hjbTYzTVI2TDM2WW5xd0JJM25oVnVOY3UrTzZkcmdB?=
 =?utf-8?B?R1Z1ZVIvSEpOSW9RT3dRNlpTYm1BS29rb24rb2E2eGJCV0NPNHdlWWVZbDBR?=
 =?utf-8?B?RkdBeWZIWUVMQStZUVlNaTl4ajBCbWVnam9IN0hQeWJuTWlIZng2VGZTZWVw?=
 =?utf-8?B?Z1J6MCs2ek5JZExuWjdTSnFQdWluaHpuNkdEdlRiaXBGSVVBQUVVc3FVbEkv?=
 =?utf-8?B?WmtKWmZGZmFOVS9YcmJmS3lXYUtINXNtdXRsWUF6WUptUjdLWk1aSVR3QWpw?=
 =?utf-8?B?VisxSk9Pang4U2FnVEVzNXVLNG1vUWxCOG1ySU5LTGl0eFVMTE5pYVAzMGZC?=
 =?utf-8?B?UXErMkF1RUZZa1hQeG9MdWo5ck5QL1BFZllqSUVnb3RyVXZ0dXNvZzdtOHJN?=
 =?utf-8?B?SnkwZ3Nid0VFajZUTUtwVTlmMGROVzU0VU5sbEN0cm4zc3didmFBQmphMkRj?=
 =?utf-8?B?MTdEbTdCZ1YrcDVRWk9JazBwWTZNUTdBbTEvaUpCT0pjY2pLSmUzME5hVVZM?=
 =?utf-8?B?RHhJK2pvM0ZWRmYzdHFWcGhTRzFXb3VKUlN2S2dLODMwV2RlNzNzbEpnTmJW?=
 =?utf-8?B?eWFyKy9jTlkzV0FXdGtSaHc3OWJ4SGpzTmNXWVBueDZRUW0zU28wTGVpMkgv?=
 =?utf-8?B?WmNtdGF6K3VvcHdGSFd2bDEwakc0SkE5RFJCcTF6aW1nVlFuWDVwYWlZVkJt?=
 =?utf-8?B?NHVRUnREdlQ2WnJPbVlyVUlzWDBiajhhVUJvcWp1TDBRa1BjSUZnUXFVZlFI?=
 =?utf-8?B?VGhVVFI0S3NlT2NHcXpVdVB0b2VOOUxYOGJ5eVBQZVZUUVVDb1JUR1E2clBO?=
 =?utf-8?B?eVpiV3p5NzJKM3lVTlVKWWE5K0hSVnc3V29sWmNlZnJ6Qm1EMjF0THpQN1VH?=
 =?utf-8?B?SmxpTEVLWVV0aTRPK25Dd0VuRnZySXJJMkZ2STlLd25tYkw2Tmhsell5MmV2?=
 =?utf-8?B?YitxVU4xYjh5UmdwNkV5NGFVNFdOZ3hVUVhISSs3M0FjbWprWDdOVGZtSzJm?=
 =?utf-8?B?eTMraXVjY2ZiTCtTd1QydWNBVnNPOGQrWStPUjMyRFlwZG1sdHBvRjhxMlZF?=
 =?utf-8?Q?V+aBOpJKBGBQO96VNO62KuA=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3feeda02-9357-4c77-5f51-08dc62a77633
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4842.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 08:37:36.3064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HV4zKNWhKJ9wjsNDZhtuDFmiVIgnsOxgrUdr857q+3de/C/OsRvofnTJ2JwgChru47LFJ5hNwM7t/RluGYf6TSIB6V7dWeEz+K3ndEhUT4TGKatG7aBJqhqCZeHAQ7Vw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7271
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 22 Apr 2024 08:37:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5172

Hi Michael,

On 4/19/24 09:55, michael.opdenacker@bootlin.com wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> Set a new standard to introduce project names with single quotes,
> so that they appear in generated text with an italic font,
> to make them easier to distinguish from command names and from
> ordinary English words.
> 
> Rework and move the standard for command and file names
> to make the whole description "flow" better.
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> CC: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> 
> ---
> 
> Changes in V4
> - Remove the exception for references to section titles (rare case)
> - Remove the exception for single quotes in section titles
>    (not needed are single quotes are properly processed in this case)
> 
> Changes in V3
> - Mention that project names don't need single quotes
>    when they are part of a hyperlink.
> 
> Changes in V2
> - Specify that uncapitalized project names should remain so
>    even at the beginning of a sentence. This follows what Wikipedia
>    seems to be doing, e.g. on https://en.wikipedia.org/wiki/Perf_(Linux)
> ---
>   documentation/standards.md | 33 ++++++++++++++++++---------------
>   1 file changed, 18 insertions(+), 15 deletions(-)
> 
> diff --git a/documentation/standards.md b/documentation/standards.md
> index e0c0cba83c..bc403e393e 100644
> --- a/documentation/standards.md
> +++ b/documentation/standards.md
> @@ -70,27 +70,30 @@ cannot be split without infringing syntactic rules
>   or reducing readability, as well as for command output
>   which should be kept unmodified.
>   
> -### Project names
> +### File, tool and command names
>   
> -Project names should be capitalized in the same
> -way they are on Wikipedia, in particular:
> +File, tool, command and package names should be double tick-quoted.
> +For example, ``` ``conf/local.conf`` ``` is preferred over
> +`"conf/local.conf"`.
>   
> -* BitBake
> -* OpenEmbedded
> +### Project names
>   
> -There are exceptions in which such names can be used
> -in lower case:
> +Project names should be introduced with single quotes, to have them rendered

"single tick-quotes" I believe is what you wanted to say here?

> +with an italic font and make them easier to distinguish from command names
> +(double tick-quoted) and from regular English words.
>   
> -* When referring to a package name
> -* When referring to the corresponding command name
> -* When used in a cross-reference title. Such
> -  titles are usually in lower case.
> +An exception is when project names appear in hyperlinks, as nested markup
> +is not supported by Sphinx yet.
>   

Not sure to fully understand what you mean by that?

Like... modifying a URL so that the project name is highlighted? 
Wouldn't that make it a different URL (even maybe a broken one)?

Can you provide an example here?

Because we do use tick quotes in sections for which the reflink then 
requires to use tick quotes, but escaped with a backslash.

Cheers,
Quentin

