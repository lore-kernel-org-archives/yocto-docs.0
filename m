Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BF59C43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 17:12:05 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.47])
 by mx.groups.io with SMTP id smtpd.web10.50135.1669914718948751228
 for <docs@lists.yoctoproject.org>;
 Thu, 01 Dec 2022 09:11:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=aAOyH4N+;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.20.47, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=izOV0sMUQO4OFdV6UV9hLgRGbQSKUXW/ZBXlA+5EVRHl00ykK0PSFebKJ4+hc7khwFSvmwVlNzRQuQ/SZ+PGlnc2UynI1L09V0Sl9gze25rVIf8gtNHKGdTBHD4ZnCgATGw5851JNZQf2WAftxhRV0/92MWrtoXa6vBy15ZUerdMl8UwA/kXmm+BXJeUpJTLrIGZz3ujbq1RAYKGQBVMvItIZWI2Wv8ZW30ogccP+C1sr6pnqnp4wSWCjDkYiXFR8+XbAXKAPyEjsn6pD58d39HbYYB63d0PExQ6wKvl3Vx0Hzo+NezowwIIVGyf9NqqJb8FDUKBYQl0jdriSQmiig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RkizKW3lsMZ4dPLSFygEXyKglzaGw9KB4acgKSjgs84=;
 b=Ba7Ujg/FNRLxK1oW3JAHV8S8bIEIQq4Le69jLT2oLhwxMb15E0XrLmoAB25wkozJRiVnwOmjAx8/UHO+TEHT0JB7YyUsLeF+9U6Qw1ZocbUskS6HUnE/FYx3XEIZTpLr+9K4oIrngC1vTBJI6qZ1YpQK+wRtMZ4BSkMldybbsWXQYpkN8zjOcXL1urnVliDWiGHZyJFVFfFrHF8gtROH1pA6CSoi1Kb0lnktAou4dISIqWsSelapcJpXNW76qnWxOGUWQM5Ey/UBE4BrXmiNEXeWu09MFbH/jZhvqjv/WHmAXlNvv2LNxjRjHGakgmQn7AN/tgy8oFOdLVtIgTIROw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RkizKW3lsMZ4dPLSFygEXyKglzaGw9KB4acgKSjgs84=;
 b=aAOyH4N+KgjuxuGhwOAuJlmgb12h63RMavEg4ICZRqOE8cP4aiMdmTwb3CXgjUaunQVEq6zW13PoTLY3Pg4IM2At7/JoIQjgbSx4rv82AQZI2y4ugOgdo3uYKB4fPBsTk5fzQhWK/Z0ndIj8oOWjmu022kTr9KSm/ABuZTadAdp/Tbk6mcIZYutBs/rmzAuLkn2mDeHT9sas1rJuSvHNF3/bUvHwmtI5vTZYD0auknHwbdzMVdDcA91qayZKhBAFIWl0NPB6vuBCWMxnTFOhis6NzgD/j9Jj0S58R/qXkbcxn5rUWNxisuQBjxw/X1LvgTUhfM8ucO5cQtuKJCqDlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by VE1PR04MB7392.eurprd04.prod.outlook.com (2603:10a6:800:1b2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Thu, 1 Dec
 2022 17:11:54 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6%6]) with mapi id 15.20.5880.008; Thu, 1 Dec 2022
 17:11:54 +0000
Message-ID: <015a0ce9-3745-1720-2af1-3558dc77a688@theobroma-systems.com>
Date: Thu, 1 Dec 2022 18:11:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [docs] [PATCH] ref-manual: add references to variables only
 documented in the BitBake manual
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20221201170625.266217-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20221201170625.266217-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0076.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::17) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|VE1PR04MB7392:EE_
X-MS-Office365-Filtering-Correlation-Id: 9518a1ae-9e2f-4984-4e52-08dad3bf24ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XTFzAmyVyDL0m6iYMTmn4j8khZYRpGiEK1vhQdMiioWs7UaDJNEBZyF+ygkIbbNJBP30t6RBwi0RSHP9fYdX4PxbSW0WPOqjZn/FsG/TioRuZKFIgUcWZMZN4BAanU8KOO2rVYYeWMRmCgc4k43Cq4glDXnJssckbnY+X9o0HQND0GCLbE2wuVWa/Nrpoz4OOM9g/TdnUBB5u7zzmq28JO5zH/agnKbdmUqcERRGfkVZ3iltNq5eW3UsF87MEpdpi0pSUWZvZqAknnp33udjXA2jIQFdypv2I479oVykHYt+gjgzHo4jlst1zqLwSMTedCE9qdjBjrMr21vFYIxA4OCtXhnkcexCXL82wsTGp6zoJUMWE3Cyl9628c6zFcPwdLVHRq7B15OVQRtF4e0DX3PBiIRHR1i4LqNG1gTQHmK/J3kGhCvCwQMf6Aauk91uaX/HpXMhb8nHvyr0dc/fERDZ7tS6T/tjGRXwEa45V4bblj5MybQO0C2emx3L2r4gp7a1MLbTqcql+3llRg7m+v/HfW9CeS+0idtaasrNZXYERViqJTeGvWgC+TfYYbRxT5IeFBZh3UNdaNHb64UgCkZYPzMM7G2JpHhYcV8B+sSkqyclhU9PqRDOfmx7U20YFWFcSpumCrOhilJCscaFnYNPHqmF5SIk6mgxoaAthBPRywYQsiIAAyOynXq3h+ILolTKtlfvRN7qXf2j5qSvdfvbv9ymGtvDARc2O8jPBg4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(136003)(376002)(39840400004)(346002)(451199015)(2616005)(31686004)(186003)(316002)(478600001)(86362001)(31696002)(36756003)(6512007)(6506007)(38100700002)(6666004)(53546011)(8936002)(41300700001)(4744005)(6486002)(44832011)(2906002)(66556008)(8676002)(66476007)(66946007)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R1pGRmZHeVlwelNxTkJXeHdTTVJOcEkxditSL1lpK3FtNXhKOXRGM3ByZXds?=
 =?utf-8?B?enJ6b25zUHlJRmtWQW00VkY4WitMQWVWNEZtbEpvZk1LZGZ0TXMxVlpCNTBV?=
 =?utf-8?B?SVlQdkkwVU5wbmdPdkNxN0dXeGVEZHU2aFJoTVl0QUlQSkhtVjdUOXdUb1Zt?=
 =?utf-8?B?YnMyTWVTRERRb2lOVXpPSHA1MlNiSE1KT3RZTWw3bzVoV1dQaithVnQ0TGZR?=
 =?utf-8?B?dVpqbm4xRFhBSUt3WEt3elhCcWU1MDV5U09xMHROOE9NZmJMWUFpNTNIZzJT?=
 =?utf-8?B?OWwyWDYvRlMrcFp5RjE5Vnh2TGNkb09ZMnpEbFJWcXlCYTg5dFNzT0NNWTM5?=
 =?utf-8?B?OGw0MXBYdng5T2RPby9GL1EwS2NveHgzUXZFaG9zNFRQS1NjLzlTbWcyY1Fs?=
 =?utf-8?B?N01Qd0txU0p6MkJvcmR2MVBOTm9Ha2FseVRoMGhSUkViUzVhdXdrdWowd1ZL?=
 =?utf-8?B?Y2htZVljQnR4d1Y5NmhGUzhYZFVyUjFZRGNZY2NDNExTUmRxVno2UCtqQitD?=
 =?utf-8?B?SXByOStCYnVoK1ZTSWNSQ0NqUHRLODJPMkNJZzBFV3drTUxPdEl2K0tkeCt2?=
 =?utf-8?B?WlZCU3JjZnRqTnRkUDRKeEM4ZWN0bE80N1l1RDJjd1pEWU53ZkNDMFVmd2k0?=
 =?utf-8?B?MmFjM0prOGViWTFFREVKMzVEN0tEUnh0R3BWM0RDSENSMXhzM2xySy8zQzNz?=
 =?utf-8?B?UmhEMXR1MzBmcEVVbXhQcmZBcWdLOEpjMEJIQTJqRDRvT1ZpeFRPdnJQZ0pS?=
 =?utf-8?B?OFZLZ0NSeWU0K21MQWQyL2lmM2dMb3V3eTRiQlRoTnRPaXpHZCtaYU9lNElD?=
 =?utf-8?B?RlZHWW93UUxjejJib1c3RkgxZjlVZ0FlQ2N6MDZ2VC9jMmF0QmpXdlZiUjFp?=
 =?utf-8?B?UmJkZ1lVWVpCb0l0aTMyUXNMUytHZ0taZVRvQVpoRk9UZVJmeVpwSDZIbkIw?=
 =?utf-8?B?MUhnYTRaSklZdndnZGRsOUZRNXR4cG1TOXdLb2NuQVpFUlpEbTR0VXJTRHF4?=
 =?utf-8?B?MUY0ZFJvcGt5ejNLdVEvUUNZY3dveUZxbFVBUWxhbVUrcnc2UUV2eFlOcUpC?=
 =?utf-8?B?dmFvTjhMSHJGY2dQVTF3T1lhMklHbGo3RTA1ZEpOL1JBeHJHWG1GZTM0MEUy?=
 =?utf-8?B?VGtwakxGU3IvVGpiTEJqTTVoRmcwV2N2dVRnUVdvRFdWRHlqZFV5dUpweHhu?=
 =?utf-8?B?OW03cnFZSTlqdFNlT3NmSkN4dlFXb3FxV1hNYWN1UG9SUXFMNnFYY0NzMkRP?=
 =?utf-8?B?R0wwcjAvRzcrQW42QTZlNUZTUmZyQzhhb3RyYjhRTnBKc1F2LzZhWTVpeS8x?=
 =?utf-8?B?SnJ5TS9VNWt1b1ExWDBDTUxJVXdrK25mNTM1RGpVMTlPRDZ0STJuUTRzaDlZ?=
 =?utf-8?B?NnRnZnVXUzRGSmtyVmthYmFJaDBGTXV4cVpzQXhXSno0SWd4MkltZ2IwUFJH?=
 =?utf-8?B?RjJNbGMvNW9RampneFVpeGZZU0JKT2RINVkrTUlsWDdiWFc4ejMxQUo5UnBC?=
 =?utf-8?B?WDVPMVJDc095b2FUZzkyOWV6MUdvclpYUmx1UVdOQzhjUmZUZ1Q3MmRIL1h2?=
 =?utf-8?B?ZTd3R0NyNnFRRUkrMzVTV0xYVDBNR0dKTGdTcURwSXpwdHpkcnhrYmN5ZnU2?=
 =?utf-8?B?MTZSQncxekFLNUt4RjZ0aG5kd1lCd3V6MXN5SGhDL09tUHFGWjRmOENPZzNN?=
 =?utf-8?B?TVAzbW1BN3UzM283T1lwS05tVWlpQmJkSllVQzhDZGZjRmlFLzVBa2lGT2V0?=
 =?utf-8?B?Rnlaa2QvRDB0Z09FSG5vK2xNV0J1cm1lRTRFcWozRmF5bmxBU2Z6eThkc2wv?=
 =?utf-8?B?V0dxd3FZOGJCTDNnSXhSa1VDVXU4bE5TZ1I2Rnp3MkpkemlTZyt5L0ovZ0dH?=
 =?utf-8?B?bUJ1ZTZXT3o3SDFBeDRBbVJBdE1vZ1lIdS9JLzJxclRsUlVMWUxiMW1JZFpC?=
 =?utf-8?B?MVliVXJqQ1VIUytzOGliTmpEcmxvYmxYbmpOajVoZjFjMVpvVitUdm5nT0Vz?=
 =?utf-8?B?VVFlT2lKNDhsVi8yay8rcElIbVVCMVdxd2RwMFNuZE8rdE9YTU54MTdLUW81?=
 =?utf-8?B?MHMvdWU1a0ZvT0o2RC9Wc2ZidzVRdWl4YktTeTd4L3pQVUdXTnhaWnY4VUpy?=
 =?utf-8?B?c1hsRFNwM3FVdWsxNjBMb3kycUdGZW1ydzdKVTVWTHZVaUpnWWxVOG1oREF2?=
 =?utf-8?B?Q3pMa1dwZEZ1MGZLVzJuZS8ranh3eUVwcytVY1JpVlp6dlVaMEoyVXhFcTdr?=
 =?utf-8?B?UnQrS0NnSERMczNMd25qdk03VWhnPT0=?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9518a1ae-9e2f-4984-4e52-08dad3bf24ec
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2022 17:11:54.6139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S+OgzSd8uQ3e/wq1xTHsAWS3i2KzjPj22TIZ4SG9qQgeL4B+Z+AxHvDe5lfKMuybB0VgrLtjg8yeuVWJJ+RZh2CJmzgPT/bLUv8uAEt8rkYG3QEIZgvEO7dNvO4lSM58
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7392
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 01 Dec 2022 17:12:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3512

Hi Michael,

On 12/1/22 18:06, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> This makes the Yocto Project manual variable list and index more useful,
> not missing any potentially useful variable.
> 
> The price to pay is that a reference to such variables now has to go through
> the intermediate reference in the Yocto Project variable list, instead
> of going straight to the Bitbake manual.
> 

Is there a script/command you used and can share that does this or was 
it done entirely manually?

In any case,
Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>

Cheers,
Quentin

