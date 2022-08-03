Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 972C7C19F28
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 13:20:43 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.66])
 by mx.groups.io with SMTP id smtpd.web08.8400.1659532833661805220
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Aug 2022 06:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=WWzNs7qT;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.5.66,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1vKXt9RWbHhqY2lFuv4sG3xQcgDIowJ6U8v1r8Aao+Dm1oHpzYWe4EFZDDRmwWTDJE8vXwJvq4vxfp0zelnTZYWccS2fPplfyXMl8kmewrvxmrFTlnk48Pnhifd+ZWXLg2haKY5dszwFneKoTD0u7gsD141XrNX63TDTGr1QRejdW0t+aMXtGnEPTVeLd5eZHpBeZzYc+WaBumeXqHmY1VITBlln/5ITx/Oo5lwHLSGB6ubj4FB8kKI4kBiJMcSjCmptHcIhDYbQhHpiGU+UqseVLx9HMmCUSnGMtwQQt8oRqnEkP10EsPMhhnDNtZkCs2gXJEaBizte5HxgmtUUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z8vVCPplN5j1+UH1wlaWEARhxO0RLC799d/vXg/i+2I=;
 b=L6OAHVxOwVKtdiLJqLdBiihLqVxo/2J6mpZ/THDZKNqbSkjT5ezbcl+iGE6kmK+RvpLxsci1qQiUG5/ook7tqAb6a/7Nek0fY0UzjT/kGoIn/knbWjxyO0RNyaSJwmoVOwEauUJ++BtHqn/Zc5v6yzMDyc46nJtz2L4YasndWwC6dzGgZV/veEOUt1KSfk6KkEb31NDdY9jH+SjYeVVj+X2gKOLEroFOenxoPyV8LH+ImOuOCC0AzC6Ajb1+fxIIODi/icbW83WDZjvbRA6qcUvTUL4XDj37jkPy/MjbJBIHqXnAmkuzQg+S7B2/PRjkXqdwYTDxLhmDaQaahMzGDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z8vVCPplN5j1+UH1wlaWEARhxO0RLC799d/vXg/i+2I=;
 b=WWzNs7qThIbdeORulHP5BolqqnVC49KKtSl9/WiweU0FLESy+TX6hEvpJNQIY6a/zzAhCkrteGvJW/9+Aa3pJg/xR4yTDTjqOLZ6rGxz+5rTTx3e1oX9Yji0mPdhSctZhs720URZVOyAiRDXjseTK6EuCoO4NpXpCRvgERaLNOw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by DB9PR04MB8332.eurprd04.prod.outlook.com (2603:10a6:10:24f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 3 Aug
 2022 13:20:28 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::81a8:1bbf:5e16:9b4e]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::81a8:1bbf:5e16:9b4e%3]) with mapi id 15.20.5504.014; Wed, 3 Aug 2022
 13:20:28 +0000
Message-ID: <84dc376f-36c9-8c75-2613-84f464d79f7f@theobroma-systems.com>
Date: Wed, 3 Aug 2022 15:20:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [docs] Generated master docs not up to date - issue in
 run-docs-build?
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: michael.opdenacker@bootlin.com,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <ac5fc19e-3c47-edb2-b5f0-da408275c0f6@bootlin.com>
 <eb55af01-e73f-856d-e61b-3eb331504da9@theobroma-systems.com>
In-Reply-To: <eb55af01-e73f-856d-e61b-3eb331504da9@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR07CA0014.eurprd07.prod.outlook.com
 (2603:10a6:20b:46c::12) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf00a5a9-8d37-4a4f-247d-08da7552ef06
X-MS-TrafficTypeDiagnostic: DB9PR04MB8332:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kRc4IbxFyan3W1zsl4k1we6I0IKlW0EIB+yHw1Y+OAqB3Vn0kqKaOQIhDZvXpn1Zg2eZcgG0sabLqjFMHOVim3s+oWKxa9XMbn4VKLRILAlp8U5p6pUxp7EgvFTkhm2W8xdIngPQbYKRTBObqN9JBBqTqc7wlOPlLs++y9RfcAMJnht/+Rax/HYCRVE0wBkGn7qErd5A3TePSeO5X+sCX/bRaFu0tbXpTO3PV9xSeVJH+PH3zt0QfHzf92AfYhnCrhHBtGB7j0Mzkju7OBTNQYjyEwLaqy/yytlRW78ArCwlSLWjYzs98mly9sPVsTIH/0A8gl+ouxJiIcq1GbEi4bNmCclYL5oCaz+t3xx9o0hKcik5B7+dPVBpiDmAuDdsSwosuNXNnlggmK9Wny3+3FnAEslLwSeKF6rtlMn9thDYi1ERMBnZxYn+LPDCbL5M1wsRmlFprwW4WmSEV0d19V/UuxjcQxHM50bdIJSEkg7pNbqttBJ/suVFayGnfQ+e2QpPNOZAmPAwUc3WDM14tybSCX0MdBqaZ7jEtUyD46yxm0I02gLMZB6NcY6/ZrwpPDa5QMyUTRzM+SO0Llqq5fMmh+ePmzjMazO9nos907YeL1RSJRE0la2qUx6Iu/j+MI0x7xC67BCiwHmHZUlYdbRNvL4sowOH7H+ZsWAlv8nEHCrhjdHaGrTesbHkfcQLpV/dJUCG0KOWbTVoGVSzMG+G1qJ692MQaHoWaRNpYcPDBc215l95EH9qOrtZGwO4Lwtdw3K85eXRRX03fRZbpvuGaElMiSmnQxB7tWtredC8jK0yQXfj40gfZvm2QghM30qQHc8hefEDiQJzDXR30Gcx418SgO+a4garnfnBiy0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(346002)(376002)(396003)(39850400004)(38100700002)(44832011)(316002)(2616005)(186003)(2906002)(478600001)(66946007)(86362001)(6486002)(31696002)(45080400002)(6916009)(966005)(66556008)(53546011)(5660300002)(8676002)(31686004)(26005)(41300700001)(66476007)(6512007)(6506007)(8936002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZzqC7py/3IQdcgiq19Zvgue76S73emnCMu6iLuYhRSBTCXb0jxh/VwC5m5Zg?=
 =?us-ascii?Q?RYkCfUUuziRUTJull57uGccNtxHJOrIhNz1aCLjQ0QeKg8RSGznrQ44+eYiI?=
 =?us-ascii?Q?I+gNVws/xVXy237UN1HgWB34oA3roG6fjO0Tt3HqVhP5f9SoCRP8ahI8d6le?=
 =?us-ascii?Q?Mz3x7JI0hh7k285QtBMaIoWwlk3GZWDz5R1ZIL52LC/zmMt2NX9T4SMAyEEp?=
 =?us-ascii?Q?i1vRkQhXUeveyEhzhqKSFHJgH3SAu72kNREi5Xy6GvqV0JT33N1LYQOZ4D4w?=
 =?us-ascii?Q?O6IcYT8V8IHD9XluAl2Gdyrf+f1T8pjzN84CwejY2kvZPl3BQCeLPgrt8Q8w?=
 =?us-ascii?Q?aoaqpUFpaWNjvXPfmZ+/V3yg4Yz+1Trj9MVGedqzXnBY21VQnXJXwqtHGwh4?=
 =?us-ascii?Q?S6Q6Pvv8F98tBXPanrQGD3tQMO8KyvFXE1wOnoF+sS5eCFSFZzMI9MFp7Ye1?=
 =?us-ascii?Q?0gd9+prINvVUmWD2lzfxEHCOJUXOf7U/6EIbDj6b0Atyr3FY8cR06JgYKkaW?=
 =?us-ascii?Q?5wjjkvSDP/s5yRNWUJARgsXEHikLfWLK4kP4yghxwklNeQhROvvZFZ5rE+sA?=
 =?us-ascii?Q?xPrwGrDc/hBlt5VFoP5inRfSx8QCrJWTY1vte4JOATOv1g19QZe6XKVn1IRr?=
 =?us-ascii?Q?LrVcv40pV5EXjjFSWlLLWwcW3mijoNM9P29Q8mtB8R/gnNzD51X2Kl2lGpY0?=
 =?us-ascii?Q?U+5HNPf4nY9NPn0BhF2Nve/DHUFzCgMLFf59slBw7K9Es7hhAhZwBUigDzTR?=
 =?us-ascii?Q?R9GTY4nwCl54SGChlouJfJiTU8ZLi/s6zdJFCZ6QcPVRJcJZiWRqbuJ/xflv?=
 =?us-ascii?Q?COFvBiSK9UFufqgyNY14ex/5+2ISt1oNeIr+tbw8vNB1YRHEkraaFOb9Masb?=
 =?us-ascii?Q?igg2z7BdwAhjP9tvaVz3sGcrH6JbmeQByyKcuLNwWMYZjppcFyA0LDfc6Wmm?=
 =?us-ascii?Q?c8qvCYp/RNczFbOsVSSEHqJ0wY4UZwSFqnLZ9/iZmYu9b1OFYYTOkMAhpnb+?=
 =?us-ascii?Q?9nmfxeW3z6Q4t+4MXTO9R36B6yO93hTcjpY5Jng6SSkLeygO0yEZbxF7raCO?=
 =?us-ascii?Q?Sep+voMbJ4KDQLc+iPi9NBDPydy78J4LWghBg6h7HKdzynaIG0VY+wL/uYRN?=
 =?us-ascii?Q?Zfw9JI1jecgGQQRqTHyVtYbxnzDyZ8RVkNg/YDqGzDc2FQEAol0dLJwZYEYB?=
 =?us-ascii?Q?8wBRXHe+8lTjwdiReOcP3gh6a9di91VM5ThxyULJCnZxWos7HwVQcOnP0xZf?=
 =?us-ascii?Q?Jee8Eb1H35HsGn6riTM49qV9BNJFVwcpKLW+Kz91PDmUtSUWe5LgK5MJIIrV?=
 =?us-ascii?Q?80u/wlIDrpfRCYsKsLkvNgCt89ZnJHt+mLzI59RE+RcFEG58/CTb87St7e98?=
 =?us-ascii?Q?3aQ7tMiU+6rIfPhdHjVU7vHbT9RyDYMvTvliyot8dAV38f+wfWu9IewImyWa?=
 =?us-ascii?Q?OSsskJje0k20Qgh6+Igy8xz66BkulPO7nXjne3NnqrBtmBzjfmOy0YhgVbc8?=
 =?us-ascii?Q?G1hY1+KSCDXX69+6fhv9uJQZ7I+nolVdgRd8nkvCMfDciLB/34GaCQKEvwFn?=
 =?us-ascii?Q?yPM5X+0vxUBrqWgDrfZjZHNK2BIbyKDX7okw2tcmUw0HS0bHt9wNJrrZCfBY?=
 =?us-ascii?Q?u0b3HflZR+8NsBb+359s/eo=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bf00a5a9-8d37-4a4f-247d-08da7552ef06
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 13:20:28.5365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Z4vnj78THSJG65He82qeVlv6IeyIrZv5Kh8ZaqGJ7jvCFu/q+pra999UJj3u40uwieCewld8o308kYou6QW2XphbOwENI4WTTA0jgKC6xHCetc8/pekB+JC61O+KCwLE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8332
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 Aug 2022 13:20:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3105

On 8/3/22 15:11, Quentin Schulz wrote:
> Hi Michael,
>=20
> Sorry for Office365 mangling the URLs, I wish it wasn't on........
>=20
> On 8/3/22 14:59, Michael Opdenacker via lists.yoctoproject.org wrote:
>> Greetings
>>
>> I've found issues with=20
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__docs.yoctoproject=
.org_&d=3DDwICaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XT=
SqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3DomMbxGmNQJRezZOXvOUrTA_kKPNZV4A2o=
VcrJjd86fPT8aVHAs52Av4OvW3-7lse&s=3DpFIoanEyazz3qTtKZ31so443Fv7Vpfnj5fZnx3H=
14oQ&e=3D=20
>> , generated from the master branch:
>>
>> =C2=A0=C2=A0* The 4.0.1 and 4.0.2 release notes don't appear on
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__docs.yoctoproject=
.org_migration-2Dguides_index.html&d=3DDwICaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=
=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3DomM=
bxGmNQJRezZOXvOUrTA_kKPNZV4A2oVcrJjd86fPT8aVHAs52Av4OvW3-7lse&s=3D8l5ZSIFCB=
5w2dI1Hi2WadpcRCQLbdi5_SgEaJQ9b9bw&e=3D=20
>> while they
>> =C2=A0=C2=A0=C2=A0 are in the master branch
>> (https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject=
.org_yocto-2Ddocs_commit_-3Fid-3D027a58616db9f3e8ee5992b57fd99cb3c284ece9&d=
=3DDwICaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8y=
BP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3DomMbxGmNQJRezZOXvOUrTA_kKPNZV4A2oVcrJjd8=
6fPT8aVHAs52Av4OvW3-7lse&s=3DXhvjm3mSHW3Tv-1GKzIzVWMdX4ZsBOiGabMGhSbv_yc&e=
=3D=20
>> =C2=A0=C2=A0=C2=A0 and
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.=
org_yocto-2Ddocs_commit_-3Fid-3Da17bfe2636c11ce8e3266d9add804d795991e2ea&d=
=3DDwICaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8y=
BP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3DomMbxGmNQJRezZOXvOUrTA_kKPNZV4A2oVcrJjd8=
6fPT8aVHAs52Av4OvW3-7lse&s=3D5RhBg7FSba6PsHFejKTGnq-KXoYKhPHU1xAMwsTZ5zg&e=
=3D=20
>> )
>=20
> Because you're not looking at the master branch.
> https://docs.yoctoproject.org/dev/migration-guides/index.html
> has it.
>=20

But this is actually a very good point. I personally believe the Release=20
Manuals section should be the same for all releases and branches.

I had in mind to force the use of the Release Manuals from the master=20
branch when building with the auto-builder so that they'd always be in=20
sync. I haven't had the time to do it yet, but something like rm -rf of=20
the previous location of the release manuals for older releases, + a=20
patch for using the master release manuals, then git checkout master=20
migration-guides/ and whatnot.

This would actually be a substantial improvement to the docs IMO. Which=20
would also allow us to use the latest tag of the latest release instead=20
of the latest release (which was changed for kirkstone because the tags=20
are created before the migration manuals are committed to the branch,=20
thus not making it to the tag, which meant no migration manual available=20
for kirkstone, which was bad).

Cheers,
Quentin

