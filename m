Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F61C433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 16:28:05 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.67])
 by mx.groups.io with SMTP id smtpd.web08.615.1668011281272303696
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Nov 2022 08:28:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=dLW08AWK;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.6.67, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P7VhFs/M8/dI3V+8g/DEHnxSQnbaPPNpM/z4XX3UudrN8Prf/LLze3+Rg8pW6CX5Mi2/aqG7f7e4S7vTHR3u4lmPRYYvmAeV2nTAT/2YKgfohyV4FsklECoTEiZoJuoJHgyHsAbIo5irahcaHxSdN9nzKy6FBHOOq00LVdKGrIw3AbZdUcDaeg4wSQNRKY0bwtSon3HMarYusytv3Q03xbTGWcdi7/lu0gONPxMCdqiwEl5vxmEl/v5qHBtYXtY2WLV7420TriQ8aPclk8OaqdjwXhFmziDWa9o37J9uzqnY/guZv94qM80TMCCNa6drLWuPT4bCqZ7DSG0427toOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hQi+Zb0CAhjqAagw44TnGD4mYJNr+WCW/vmz9SNSKQ=;
 b=eXPSrVeKn+LrtzeCC2Jh6S35S+3yUTgS2zX5ncygveL0BWDfC0lmJRPeqp4G3q2fky6ECqRrbS/9TvqpLOcpBPZbSgg2fQM4nMYWvv+hjQf2Z86qTV0I5I9K8Ve3D4ZH+v5DZ3ncMMuFpnSPKxO+GhBWbNfWoLkS1UMqz0j89wdgAu0eC+BosT8k0uQqbRhcrnIb1pJ+9bnaNttnfznABUYPBq8+5jkYiegKwgLMRPhvor0/3/hcMWd0BHZrLYPaJnAJrPyErTgeBwX9WD7CbcoGIuXFy9m5nbergTJJUxEk+t9F6BIaoMfWK15AwgaH9P81Cft+geVZLC9qn7sQTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hQi+Zb0CAhjqAagw44TnGD4mYJNr+WCW/vmz9SNSKQ=;
 b=dLW08AWKwnV3f0XUo+Eec6V7roWnh4ZUKN3RG8w4GU2SxiRXY5LLwPmkHYmcDN0f8BgqQlBa4HGyCIUTsVMv8a3VZ/tyjXtz3lwSmbiZZ9xyuLm1ACd6VHunCgrt74pla0R6qu66TET2mJTf71+gdec+q7y3agtMTOyyhd7Dl45y269tdhmQiSb9Uz6n4Po8FSxv8MB+6x+RdvaOFKd8ukffdJigG7qmPpO20IXXbpmgFw6QY2rrgR8yQ+Z44hweEGh90K2mhLodkqsgp2z/y3W9GHEVCTuKNJ4QjIInQNnbh/0yvQoF20izsEr9A9h9cwSE9thrrJkWwr4PCnU3Sw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Wed, 9 Nov
 2022 16:27:57 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 16:27:57 +0000
Message-ID: <5b159c82-a468-37e9-99b0-5bd3b5c5b57c@theobroma-systems.com>
Date: Wed, 9 Nov 2022 17:27:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [docs] [PATCH] qemu.rst: audio: reference to Command-Line options
Content-Language: en-US
To: Atanas Bunchev <atanas.bunchev@konsulko.com>, docs@lists.yoctoproject.org
References: <20221109115018.16086-1-atanas.bunchev@konsulko.com>
 <65858fd2-0b98-a736-42b0-be168e99c842@theobroma-systems.com>
 <2d279cb7-6a93-4b42-8ca5-64a4e14d5155@konsulko.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <2d279cb7-6a93-4b42-8ca5-64a4e14d5155@konsulko.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0120.eurprd04.prod.outlook.com
 (2603:10a6:20b:531::7) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|DB9PR04MB9626:EE_
X-MS-Office365-Filtering-Correlation-Id: 01ea7324-1d86-4bce-f1d1-08dac26f5c72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HJ8NHbTYmv6b99CJvdQ8BiIehGymso7x5pmqHvEP5iv6fJqixDVpo7VyMk4RUgM29wjA6sp+RqIWOQUX72jxtFIJAywZFyfAoFr5srnLwALJOR6IN9CEzvFVHk0ejqoadCyW0oXKoTztrkjqLc9FjOP5COAgRUWWr28CvIzkeA0IZWh91eKbVRG+J6Hi+YVa6PYOutUD90znQSjMIyImuTYcAZK8hhlasYdwCTFFG4cjh7ztAyJz+so+sKGAwYkunykCy2u4ehv8rjfd3Pf+53D9DNfVl9tMhAWnEI4gs6AtCzpAEzLqrKBlAlKRU/gmS3oLeOov8u/t9EH3FDTUZKXUsu0Xee8CbWam3bShwWPMx9omlbnSw+Se9xxUTGmUldVeo1BkldBLY1S6WY031Uh59Gyc4ZfmJPWlVVp80tYfA7sAf6s9jNNXc/mk4FiJhXNgEyd4itsiCwAtszjm1NCc8KAgFNA6OHiTQVQDC+SpeY5yj9UsFA52FoXwITe8WeFc86kLqTcSMKCiHSGE/jr4XX2MHZiGJKA5ncNYZRaPLAQrFXz8RkX5YNlCnWJJDOg5FjsEYAt7iQmey9poTkekCPJugaTNrrBocX47C0biSUk+FlCjM0mB0/u09rJ/+vJ/G5VccbwO55Y2ZEv+S71UHnfd9SJR6k7lPQWbSluAijq4nPHeuv4EjCP8FeGqTemMhNIdtkW6kyC8x5KEd7q6fnNOldcoE0JfEPqzeOQmuAT/qnpFKg5D93obZSzeYcpYTKUBGW3tzMNNWXFzUNIQR+6/bdjqka6AmaWB8RE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39850400004)(346002)(396003)(376002)(366004)(136003)(451199015)(36756003)(31686004)(478600001)(38100700002)(31696002)(86362001)(2906002)(26005)(186003)(4744005)(6512007)(6506007)(53546011)(44832011)(6486002)(8936002)(5660300002)(316002)(41300700001)(66946007)(2616005)(66556008)(8676002)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NVh4NS9JeTNxTEg4dWt6czJJY0dUS29PNFM3YThLSFBCYWV5UHViaDZXQ1F6?=
 =?utf-8?B?QmljSW5FM2xDa1dTb0pMNDQzSk93YkpEZ3R4QWUyb25QRGVOaDRaV2VVa0Yy?=
 =?utf-8?B?cURyN1MzRzU5TzhpMWVpcmFwV0hvVE1zcGw0eFBuRU4wMzJSNFJ6Ykg3YzRS?=
 =?utf-8?B?cEZ6VGFBU01RNkg2UzhDc0U5RXVROWNnY015U2xUYjBSbmNIK3JlSmE4b01Z?=
 =?utf-8?B?ZVJPTlJvT1V2VDhCU21lVHpxeXRCenhaU3hlRWhoQTdMd2dlRW05K0U0enpr?=
 =?utf-8?B?TUxlRituS0dKRDNGYTdLWmlJckhRRGtLOEtFdXg3eU1iSWJPSGtzNGdYck9M?=
 =?utf-8?B?R3JuQzVkdmdqemxCY2g1dFVrSHFYT29kRndzUzY4ck5Yb1MxbTZkQ1JTanNn?=
 =?utf-8?B?NkZwRWd1Wml1TjF4ckFHRno1RHZUUCtpSmJxOEZsK2twTElTRlltdVpVQW5B?=
 =?utf-8?B?aXRDUU5ISWdxa0xLTFhhT2dmWnQ3VEhZN1FKRlVVck54c3FvbS9tNUZyTTRo?=
 =?utf-8?B?MUlKSGJobmh6OTE1OEdveDRVcGl3S1Y2dGVEOUo5QUNzbzFQREtPM0x5Q0Rw?=
 =?utf-8?B?VEhQTEsvTnlyWmxCTVVrcVV3VVAzazN6dURYeTl1SE85bFdPaWwxN01sb0Js?=
 =?utf-8?B?a1ZTWXdwUFRCTHVvc0MydUFZZkNCVFJMT2JIZEtwTkxzT1FFZFJGN0JNUWdG?=
 =?utf-8?B?dUdoMGl0SENFbEtmdmdqMnh6S2ZDeHV2TzhCK0JVNDI3QlR0ZHRJT3hVcEZq?=
 =?utf-8?B?UVMzVlFuQzA0VG1BODhMRUJtSDU0RzVsNDBFeVZlZXRlbm01TjVZbTNyelYy?=
 =?utf-8?B?WSt2QjhDb3MvazNDdldKbk9uYmF6ZDVQSGxIdkdvR2hVNFFkZUlMb0prRFFR?=
 =?utf-8?B?OC96alFSc0UxZlhlalZHck4wR1FPK1JIMVBNUXlUY09qT3Uxb3FDMklua1Za?=
 =?utf-8?B?cEd4Mkhzc3FUV1c5UllIR045SFpqdytLeHA5Wm5BVmhkc0U2ejRaT2JWOTRE?=
 =?utf-8?B?aDVUVmU0SUxjZTc5bXJxcHo2b3kwN09IM2QxSWN4WkFDUitIOEhneEl1SnBz?=
 =?utf-8?B?U05YZW5VUHFURlZBRFhLRkVsNkVGUStDY2c4d09tbDVUTlVOaFh3aDFiRTNJ?=
 =?utf-8?B?S2RxbXUzd1FvZE1OUWFjOXJmQUNjR3hFK1pBc2dUMUZIaFNiSEtpd2p2TmMy?=
 =?utf-8?B?YXRtcWVvNXJPRlNpZXdaWUZDNlN1WkpBbmEwcEhpWTVxVkxVY1JWMEZJVHh1?=
 =?utf-8?B?TUl3ZEhxTlpPMHc0cktzSS9xYll4MjN0Y0RwQ3Q0d0NUaWg5Zko5azJzZ3pQ?=
 =?utf-8?B?WUZEUk56cXBlYU9ybkF1OFZhTFErdnBVdzhZOUFWU21GOUNmT3d4dHRWVHAw?=
 =?utf-8?B?cEg4SHZITzZMZWQramFOajFIVkF1cjFpVGJsblEzQ0lMNUg3aHN4WXRGR0VC?=
 =?utf-8?B?bmE0SytWQ2lZK05maUF0Q3NyRmZPNGRUMFUxSE5KVGZhR2IwcFdaWCsrM1A0?=
 =?utf-8?B?YllRQ3NIT0thaGc2TTFYZzVFdGZObzJybjBFbXVMam1lbmNHbTZ1R2VLTnVx?=
 =?utf-8?B?b2ZyUnNmdTNQTFRjai9KdzI3MTdSWTQ2WG9GODVxUWwwNHUreStpWkJ0M1px?=
 =?utf-8?B?Yll3TE5HYkFvLzdkUTluYkxuR3dGZDd2bnRCZ0JBcHZRdlpOMUw2RWZXbjRj?=
 =?utf-8?B?Y1dMQmtUaFlCNjIxVjUrQUYzUUowKzJ5VVF4MjlVQzJVdy9DSFlSREhRVERr?=
 =?utf-8?B?Vnk4dTh1MGtwL0VJTExJdEdqZW9sSkVRSkxib3NyUkU4YTdWZ1dtT3VlMnZ5?=
 =?utf-8?B?dUI3WFBONnJkcFprc3hhMExneXRBMTVpSmZPVk1QL09uTFBMNUIvdlFCWVk2?=
 =?utf-8?B?UmZjVXlmWHJIZnRoNERRYlNaWmhvU1NOZzkyZGwwb2lDTE5VbHdHcGRKRzR0?=
 =?utf-8?B?YjdBU3Q0QTFRa2NTVzBBdyt2U1dpeUZFWHRnc3BOT1dzdjVFMFdvL2Q2Rnlr?=
 =?utf-8?B?NDU5ZXlZNVFPaVBTV3FjcGdHOEN3V0NLS2pyUXdTaW5FY1pncHVDdHhDVHdZ?=
 =?utf-8?B?UmYyRTFGU1V3ZDlTTzVHRWFHOHB3bkNQNDY2OXY5M0xQNTFOL0lXcXZvSEFm?=
 =?utf-8?B?R0EyL2k2ZWc1elhnVTV3NjBRTHowbjNEb3lRemwzd3UyZEZFOVZTdkFGY3Rn?=
 =?utf-8?Q?lXOgm978WY6bZbvomadNPs0=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01ea7324-1d86-4bce-f1d1-08dac26f5c72
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 16:27:57.6572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C1fcgSDDzIa7k03gthRNU2/s6r8uW5D8msSauJR5/jPgdhDZy3ibUOJq7CFNMkKhZ46gYtE30KltRDhodxuJRLZ7eYHBvEQ6j9euAzffsSx2RMRchNPyPaa/2r/qDwhw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9626
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Nov 2022 16:28:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3484

Hi Atanas,

On 11/9/22 15:04, Atanas Bunchev wrote:
> Hi Quentin,
> 
> I tried to use reference initially, but I couldn't get it to render 
> properly in my github clone.
> 

Yeah, you need to escape the backticks in references, not really obvious :/

> If it renders as expected in the documentation, i do approve the 
> suggested change. Thanks!
> 

Can you send a new patch please?

Cheers,
Quentin

