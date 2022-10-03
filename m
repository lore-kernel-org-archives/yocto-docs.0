Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 770BAC433F5
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 16:08:19 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.77])
 by mx.groups.io with SMTP id smtpd.web08.1850.1664813288988049684
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Oct 2022 09:08:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1
 header.b=aj/DujG0;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.77,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VQ6c4vqIBYrh6QS1uUUu2Lv/RCsweWwTccNjtNbXtCEM5jrlnOtbUpRhH1P8JI0eured/jm/3yO+EYEuTGexrGLPJJ3W3EYnB1B+0aYlU6oZmt4JjL9lkaUanjsyUvsaLhZxpFh4Lj2ZxVnZvzrI+qXDG7A7RdFPfdSutsTSKCodAPcxI28M/lRCAC77ja3uJqS0bfXqRi+la8iIFfcW9Nd6R7wHjNRtp0/ffke98jcD397uGl/UqGIkW2S7zVT/WzK58kBIHQjNybf9oOX51GLy/vr/B1sCWBxEo4dOiFclv0riw/bLNX3XGHeUc0OceEOMxufm5wDY1GrupRrSyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N9Qp5c/YytKFSEe47JiqLKDhaAFLd1/H8tQku7oa23U=;
 b=Y7X2qSWYb1GA9TH6p9yrPwbRYRJj5WQSSy2eXQy29APkBtGUbQv/uyGhN99zc6PYx6t3GlOBBs9NuS2eKde3wCeKaRh8r0PoTTP4ED2ASF0D0ITOH1L/rxm/dKJZkl1Hxp7k595D4+0vxL3r3rA/bK/uU/r3aWrItmG6nuubup4A9QDzCNokuaetHjkvrbjBJUBORfpifbcvfBl1l9wbPhf++YlDhE77UKmnnCtHAJUYjLKdxSz3RzoC+czvKlVPcsRKBcG5bLoSj3VIuiebEwNcO0dHh2P1hJINjUzojeQ0cJWOzbavIgNtwJGuFsDa/wnMlIMrhzm6QD2kNoiS6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N9Qp5c/YytKFSEe47JiqLKDhaAFLd1/H8tQku7oa23U=;
 b=aj/DujG0EgC47rFsLiYvfCTH6ekxYDBk5RxzVW7mmdz5ougagOnSf+Uaqslh5C4uZI+S1IkrHpa6MhjbLmV5eElrUuFvO5nYns/R9uy9jzDny7VWkRsy+UuYwWpD17sKz3v9YQoMcLbaXMLcPkerqV7z1ZYrlF+mnbkxkcqqDEQgHWqv5kTbMB+gEdNnrmEwamqu6HfTfGgBl21l/oRYcir7dKHV5iIE6NSA/AfEtnfXH3bft1pGUhIc9yKzkOOldN8my9UMq7U6MuIdWw8GpthG63i20cwEZtDHLEbExpnybxPfmgA3Xv8/MyXsFVWiUigKE5c4fYNtl6r1d1J/Ww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AS8PR04MB8641.eurprd04.prod.outlook.com (2603:10a6:20b:428::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Mon, 3 Oct
 2022 16:08:04 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5676.028; Mon, 3 Oct 2022
 16:08:04 +0000
Message-ID: <1e904aa6-dfe0-38db-33e8-e633b37d4beb@theobroma-systems.com>
Date: Mon, 3 Oct 2022 18:08:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [docs] Incorrect minimum versions shown for GCC and make
Content-Language: en-US
To: michael.opdenacker@bootlin.com,
 Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "Yocto Documentation (docs@lists.yoctoproject.org)"
 <docs@lists.yoctoproject.org>
References: <e50abe3c777e4a23a752a3ec25ad0b2a@axis.com>
 <0a132144-f790-2fe7-d21d-c7f52a52aeed@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <0a132144-f790-2fe7-d21d-c7f52a52aeed@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::8) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AS8PR04MB8641:EE_
X-MS-Office365-Filtering-Correlation-Id: d4112c11-e5a3-4980-a8b5-08daa559741c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	frObD/AuBaK2Qc1w+zR38Ujb7t/tyIjn9+etkSkCWNnaRntTbc7kFm5M0NpIEnuv3HhszRRx7fCoWdwERYuxvhcDr0zjTWSpZOdYk7SGkbpq3QIMdUJcfr94uZI95MSKkFBR5LeiUZFUarpgUnSCa67SX13U72nZ9C9L+E0Y+QNQV/6eoDXSu5Jy63JvSXRisLnPOXE2J4NsXhSttnxj5AmvudUWRQJjUhPTj1jI91TuDsG8+Zig8y86Y1TmfCItBzWKygjkf1e4yuv3maLzjWiuHmMi5mlX0nTKGxwBIg7d7VpwpdXQiBDhF5tBvvNXRp0k+FtU3w9dLZ9pjnjtxn/1QVxFFcI2Sj0hEWTlsgJGvXKQd+Kv3boPmem0t+jouKBO+87nApgry4KWctCfqg0duPDEZdEXPsQB77ebUmvveWe0/f0V9AZarY585H29E60VLgOnCJugcvIMer0Ii8aws8BBi4DA8NICJvCE6nluu9mNGYaKKam7mX019WCeSfk3YwmE6sxyKBfAJtH5MLifbJhrt5itPwvzkM7Dhm6e+0a/8onBXGgfmpSemXNbqIlNpkLd6SNfG3V7QXoyxaDCUc7pmgd1YrPk5gJf56GPNDFDHQwCmiCCOI3Rjrz/UGC8dsiNUtiYQQ1UURIC35II5yI1glxZ/umFa/5JYBvlXHrmO0Yb2MtfAzGlV6X2JXLr/M50jigx93oJjrE4mApT1yJa2+4yhvsFwoRjGp1wbwdSl5fP9jWjOVAEkLLYo7IZhWyw49apHFW+uUelPQcMVETDLEp79agk5AxB3/WeNxh7xpDo8VE8cV7axv8K
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(376002)(396003)(39840400004)(366004)(451199015)(36756003)(6506007)(41300700001)(6512007)(26005)(86362001)(53546011)(66556008)(6916009)(31696002)(478600001)(38100700002)(31686004)(66476007)(316002)(66946007)(8676002)(4326008)(6486002)(2906002)(966005)(83380400001)(186003)(5660300002)(44832011)(8936002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cmljeXJXUWNpMlJ6VHNRSWw3RjQ2NXQ3ZTJnSllhWWhlVU55YzlEeVVnUGRF?=
 =?utf-8?B?MDUza1pIaE5Td0lDd3p4SjZweDlzbFVXUEpEZ281OHUvMUFIT0R6MmRNdzhX?=
 =?utf-8?B?L1doOEFSU1NDS2h5RmRwM0JCdEFlQVY3SXRkWFdQNG42KzVJaUc0MVJnNlp6?=
 =?utf-8?B?ejlFcGVTYzFFT1dqdG1SekU5NDhKK09YSHEvem9zN0xIQjM1NU1UMVNuOW5K?=
 =?utf-8?B?K0RhSlRNTWRQaEQvMTVaUSt0YnJQM2ZIelRLMXc2R3hnczRERFY4YU10UW91?=
 =?utf-8?B?SUJBY2tzc2Jwa1NEeWRlRVl6U0VHRmZxYVhkT1Q0VytXRE9QS3VsNU1CaWlR?=
 =?utf-8?B?VWtwcmhLMExCTXoxSzNqUmxydXpPOW9ZeGl4RWJoMENPNmUxRDFISTVaY09O?=
 =?utf-8?B?S0hrOEtRTUVHY090L1FGRUsxZTJBYWhWR1RLSHBycDZVK1BWd3pkUzczVC9z?=
 =?utf-8?B?S044V2FBck5Jc3lXZklCMnM0NnhjN1VjdUdYdEJLMUNXZ1QyKy9USUJ5dG40?=
 =?utf-8?B?VEtCWVhTTUJzOXBiU0NZR0ZtZVRoSTdrSFVkaEwrWjNvVHRFSERFZnZUbXFW?=
 =?utf-8?B?cmV4TlZja0YvTUZzckl2c0pweE9MRXVVQU5GcDdRbHJWTStlRnFOM3ExQzBi?=
 =?utf-8?B?YVgrNGlXQzRTT3l3Vnh2US9lYkpYRUNiRFQ1VkMvR0NPdXRiV2VIblVidkhQ?=
 =?utf-8?B?M1R4UnJkZXlodTRDRmI3bHpyc0RYY282R21jNGh0Y1JuV3NFQnpqWkUzd0RF?=
 =?utf-8?B?QVgrYXg5T2lPSklXMCt3NnRJSkN2REpKNnkzb0lBNzRBYkpUdkVRcFkrYzdz?=
 =?utf-8?B?V2Jtd1Q2ZmJnSGt3a0dBNjJvQ2pwTVlOTW5RcGF0ZitTamdyZTZTMEoxMSs1?=
 =?utf-8?B?UVNYakh6eFcrR01ISkNZTldNWGUxdTcxSG9DSi9GQ2FrZTVkWCtMVEJJdFpv?=
 =?utf-8?B?TGVhUmkxNk4xUFc3b3B3UitlZzc5SkNIMWQ1NW5ualAwUWRPdUM3bEVqZ2U0?=
 =?utf-8?B?ekkzWHhZbG0vZ24zM0RDU3RMVVBEdTV6bk9RUFpNc0lvajloY0ZIdlMxdXM3?=
 =?utf-8?B?WmFVY3NFNzh1RDdZZ0lDa1REUU5zMitjRjVwODgzL1J2aWxEYTB1eXBFVVRr?=
 =?utf-8?B?Q0ZYaGsveDZodWQydnJhMTRxT2cxU2xIU2dnU3NaYXNaRy9jaUxqTFJ2OTdR?=
 =?utf-8?B?MldHbEJWUGxVSEpyUjAyTEl3QkZrMC9PcktXTEd4dC9kakd3VE9mdG9uWStV?=
 =?utf-8?B?elBLU2dKOXBCMzl1WDNLRHllbThzWW1nZU0xYVkzalVwVmVkQkRpOGRHVmdT?=
 =?utf-8?B?dTdyUmhOZzNHK0Fmc3lJMEltTjZoajZFdVJnOWJ1a2JGRW5CUXlYR25NOWZk?=
 =?utf-8?B?TWRlM01KOXI5Qis1QlcvajVzL1hqa3lTUWhRUnhVY3dGT0FMSG5yWDlPTmpV?=
 =?utf-8?B?UWFldnNBRVdmYU9heGwvVk90NTBveWVTeXBjUVp1VWpYTzlzVC9jOTdnYm93?=
 =?utf-8?B?M0FhMTB2ME1MQWZISk9kRjFGZFZDQ1pPQ3dnNkdCYmtZSVRrY1hvRkt0UmpI?=
 =?utf-8?B?QVhUcWZMaGJaaVl6d1dNL0RWd2dpdGdLY2lMQ1libUZmbHRkSDlVMkRiUEw3?=
 =?utf-8?B?SG5UeUxwdjBLOERCa0U3VkRkWVlpUnp0N0gxRlhDZEMyZU1XWXdWdG13dmQy?=
 =?utf-8?B?OXJFRXNhK20wVGJaT0dDck1mQ2ZHZW12UEh0eUh6YkRSNGhoM1Avakt4R0RS?=
 =?utf-8?B?TjByRWpyTzZiSmNSU3ZaUC96ckRjS2JiQXJ5eUFaNjhCNjNic3A2ajZlVTIr?=
 =?utf-8?B?Z0pYOGdBbEVGWjQ3WVlRd0s0cUZQSVVqSmU0QzV5L0xiTXk0Q0MzWGlyNnpG?=
 =?utf-8?B?Vks2RVRIVG9zaEh3TzZjNk5QSmEvUHRlcmxvUUFFNlFkZk9VV3Evd01jYXBk?=
 =?utf-8?B?SmhUUzQwOWlWeWxzRlIydUNvbFoyTUtjKzlWaXcrbTEwZUR3dFdId2pwcGVr?=
 =?utf-8?B?RURDaDdiVHJkN0xaRngxcUxKWmtuaWJGR1J2bWxWUXdyRWNqd2diNFM1a3dD?=
 =?utf-8?B?QVphS2ZrTUYwNzZKUW5wQTRiQ1NDUUNGcmtkM0o1M3pIaE1MYjNyZWFUUUlG?=
 =?utf-8?B?b3RFY20vVnlaUU9GOWlqdWtkb3g1bmhiQlF3Qnd1dGc5OElKeTFZMVJVUGhV?=
 =?utf-8?Q?4cPqOK2gXZIovFcmW7GaQC0=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d4112c11-e5a3-4980-a8b5-08daa559741c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2022 16:08:04.6460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 f9wfbCrqyPP/BvV/JMQIGAyjhqtUZ5XN49IEO1+tewPfHx7i5bz6dDqsMJ4XmfkW7dGWtmQnXSxc7UelypKCCvg+MrhGc5bRKiS7/hvCJ+fBqjzr/OrTihVQljbhBK0/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8641
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Oct 2022 16:08:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3262

Hi all,

On 10/3/22 17:04, Michael Opdenacker via lists.yoctoproject.org wrote:
> Hi Peter,
> 
> Thanks for reporting this issue.
> 
> On 01.10.22 16:49, Peter Kjellerstedt wrote:
>> If I look at
>> https://urldefense.proofpoint.com/v2/url?u=https-3A__docs.yoctoproject.org_dev_singleindex.html-23compatible-2Dlinux-2Ddistribution&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=u9m2ve0ByU4CXHmZxjW_6GsGvoQjzEBiBGa5z9kZzkpVqhoVbvXs9wYh9bYy0jId&s=_YAl_18TDAUr1foHEEo3dgnk0MFXuX7PGsi10kUWXsA&e= the minimum version for GCC is shown as "5.0", while the minimum version
>> specified in documentation/poky.yaml.in (MIN_GCC_VERSION) is "7.5".
>>
>> And the minimum version "&MIN_MAKE_VERSION;" for make indicates that
>> the MIN_MAKE_VERSION variable is not defined, but in
>> documentation/poky.yaml.in it is set to "4.0".
>>
>> Based on the above, it seems the development documentation is using the
>> poky.yaml.in file for Kirkstone rather than the one for Langdale.
> 
> Right, and the documentation is out of date for Kirkstone too.
> I'll try to find why this happens.
> 

For the reported bug, we need to run git clean -ffdx after git checkout 
the new branch otherwise the git repo is dirty (you can see in the 
autobuilder logs that the poky.yaml file exists for kirkstone and master 
for example, which shouldn't be the case).

Cheers,
Quentin

